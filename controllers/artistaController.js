const { request, response } = require('express');
const { pool } = require('../database/configDB');

// Controlador de las peticiones HTTP
const getArtistas = async (req = request, res = response) => {

    const { rows } = await pool.query('SELECT * FROM artista')

    res.status(200).json({
        rows
    })

}
module.exports = {
    getArtistas
}