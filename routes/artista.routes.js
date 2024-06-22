const { Router } = require("express");
const { getAllArtistas, getByIDArtistas, postArtista, deleteArtista } = require("../controllers/artistaController");

const router = Router();

//PETICIONES
//GET
router.get('/', getAllArtistas);
router.get('/:idArtista', getByIDArtistas);

//POST
router.post('/', postArtista)

//DELETE
router.delete('/:idArtista', deleteArtista);

module.exports = router;