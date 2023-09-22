const express = require("express");
const { createMahasiswa, getAllMahasiswa, getMahasiswabyUserId } = require("../controllers/MahasiswaController.js");


const router = express.Router();

router.get("/", getAllMahasiswa);
router.get("/:id_user", getMahasiswabyUserId);
router.post("/create", createMahasiswa);


module.exports = router;

