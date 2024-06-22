const { Router } = require("express");
const { getArtistas } = require("../controllers/artistaController");

const router = Router();

//PETICIONES
//GET
router.get('/', getArtistas);

module.exports = router;