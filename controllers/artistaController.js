const { request, response } = require('express');
const { pool } = require('../database/configDB');

// Controlador de las peticiones HTTP
const getAllArtistas = async (req = request, res = response) => {

    const { rows: result } = await pool.query('SELECT * FROM artista');

    if (result.length === 0) {
        return res.status(404).json({ msg: 'Artista no encontrado' })
    }

    res.status(200).json({
        result
    })
}

const getByIDArtistas = async (req = request, res = response) => {

    const { idArtista } = req.params;
    const { rows: result } = await pool.query("SELECT * FROM artista WHERE idArtista = $1", [idArtista]); //Query dinamica

    if (result.length === 0) {
        return res.status(404).json({ msg: 'Artista no encontrado' })
    }

    res.status(200).json({
        result
    })
}

const postArtista = async (req = request, res = response) => {
    try {
        const { idArtista, nameArtista, pais, dateFormacion, descripcion } = req.body;

        const { rows: result } = await pool.query(
            "INSERT INTO artista (idArtista, nameArtista, pais, dateFormacion, descripcion) VALUES ($1, $2, $3, $4, $5) RETURNING *",
            [idArtista, nameArtista, pais, dateFormacion, descripcion]
        );

        res.status(200).json({
            result
        })

    } catch (error) {
        return res.status(500).json({ error: error.message });
    }
}

const deleteArtista = async (req = request, res = response) => {

    const { idArtista } = req.params;
    const { rows: result } = await pool.query("DELETE FROM artista WHERE idArtista = $1 RETURNING *", [idArtista]);

    if (result.length === 0) { //Si es igual a cero significa que no borro ningún registro
        return res.status(404).json({ msg: 'Artista no encontrado' })
    }

    res.status(200).json({
        msg: `Artista con ID ${idArtista} fue eliminado con éxito`,
        result
    })

}

module.exports = {
    getAllArtistas,
    getByIDArtistas,
    postArtista,
    deleteArtista
}