FROM node:20-bullseye-slim AS builder
ARG USER_UID=10001
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm ci
COPY src/* .
USER ${USER_UID}

FROM node:20-alpine
ARG USER_UID=10001
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY --from=builder --chown=${USER_UID}:0 /usr/src/app/* .
EXPOSE 4002
CMD ["node", "app.js"]
USER ${USER_UID}