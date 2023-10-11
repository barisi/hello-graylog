const express = require('express'); // Import the Express framework
const app = express(); // Create an app instance
const PORT = 4002; // Define the port number
const HOST = '0.0.0.0'; // Define the host address

// Define a route for the root path
app.get('/', (req, res) => {
  res.send('Hello Graylog!'); // Send a response to the client
});

// Start the server and listen on the port and host
app.listen(PORT, HOST, () => {
  console.log(`Running on http://${HOST}:${PORT}`);
});
