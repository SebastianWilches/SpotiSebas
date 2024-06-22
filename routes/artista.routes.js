const { Router } = require("express");
const { getAllArtistas, getByIDArtistas } = require("../controllers/artistaController");

const router = Router();

//PETICIONES
//GET
router.get('/', getAllArtistas);

router.get('/:idArtista', getByIDArtistas);

module.exports = router;