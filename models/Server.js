// Importaciones
const express = require('express');
const cors = require('cors');



class Server {

    constructor() {
        //Inicializamos todos los ajustes basicos del servidor
        this.app = express();
        this.port = process.env.PORT;
        this.paths = {
            artistaRoute: '/api/artista'
        }

        //Midlewares
        this.middlewares();

        //Rutas
        this.routes();
    }

    middlewares() {
        //Middleware para CORS
        this.app.use(cors())

        //Lectura del body (Cuando hagamos petición POST)
        this.app.use(express.json());
    }

    routes() {
        //Middleware para rutas
        this.app.use(this.paths.artistaRoute, require('../routes/artista.routes'));
    }

    start() {
        this.app.listen(this.port, () => console.log(`Server corriendo en el puerto ${this.port}`));
    }
}


module.exports = {
    Server
}