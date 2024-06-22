const { request, response } = require('express');
const { pool } = require('../database/configDB');

// Controlador de las peticiones HTTP
const getAllArtistas = async (req = request, res = response) => {

    const { rows: result } = await pool.query('SELECT * FROM artista');

    res.status(200).json({
        result
    })
}

const getByIDArtistas = async (req = request, res = response) => {

    const { idArtista } = req.params;
    const { rows: result } = await pool.query("SELECT * FROM artista WHERE idArtista = $1", [idArtista]); //Query dinamica


    res.status(200).json({
        result
    })
}

module.exports = {
    getAllArtistas,
    getByIDArtistas
}