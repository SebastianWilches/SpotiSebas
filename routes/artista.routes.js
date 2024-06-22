const { Router } = require("express");
const { getAllArtistas, getByIDArtistas, postArtista, deleteByIDArtista, updateByIDArtista } = require("../controllers/artistaController");

const router = Router();

//  PETICIONES
//GET
router.get('/', getAllArtistas);
router.get('/:idArtista', getByIDArtistas);

//POST
router.post('/', postArtista)

//PUT
router.put('/:idArtista', updateByIDArtista)

//DELETE
router.delete('/:idArtista', deleteByIDArtista);

module.exports = router;