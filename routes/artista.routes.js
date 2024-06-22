const { Router } = require("express");
const { getAllArtistas, getByIDArtistas, deleteArtista } = require("../controllers/artistaController");

const router = Router();

//PETICIONES
//GET
router.get('/', getAllArtistas);
router.get('/:idArtista', getByIDArtistas);

//DELETE
router.delete('/', deleteArtista);

module.exports = router;