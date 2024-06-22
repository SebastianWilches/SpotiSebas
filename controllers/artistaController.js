const { request, response } = require('express');
const { pool } = require('../database/configDB');

// Controlador de las peticiones HTTP
const getAllArtistas = async (req = request, res = response) => {

    const { rows: result } = await pool.query('SELECT * FROM artista');

    if(result.length === 0){
        return res.status(404).json({msg:'Artista no encontrado'})
    }

    res.status(200).json({
        result
    })
}

const getByIDArtistas = async (req = request, res = response) => {

    const { idArtista } = req.params;
    const { rows: result } = await pool.query("SELECT * FROM artista WHERE idArtista = $1", [idArtista]); //Query dinamica

    if(result.length === 0){
        return res.status(404).json({msg:'Artista no encontrado'})
    }

    res.status(200).json({
        result
    })
}

const deleteArtista = async (req = request, res = response) => {

    const { idArtista } = req.params;
    const { rowCount: result } = await pool.query("DELETE * FROM artista WHERE idArtista = $1", [idArtista]);

    if(rowCount === 0){ //Si es igual a cero significa que no borro ningún registro
        return res.status(404).json({msg:'Artista no encontrado'})
    }

    res.status(200).json({
        result:`Artista con ID ${idArtista} fue eliminado con éxito`
    })

}

module.exports = {
    getAllArtistas,
    getByIDArtistas,
    deleteArtista
}