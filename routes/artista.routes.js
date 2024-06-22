const { Router } = require("express");
const { getAllArtistas } = require("../controllers/artistaController");

const router = Router();

//PETICIONES
//GET
router.get('/', getAllArtistas);

module.exports = router;