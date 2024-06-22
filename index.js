// Imports
require('dotenv').config()
const { Server } = require('./models/Server')

// Instancia
const server = new Server();
server.start();