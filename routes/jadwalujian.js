const express = require('express');
const { createJadwalUjian, updateJadwalUjian, getAllJadwalUjian } = require('../controllers/JadwalUjianController.js');

const router = express.Router();

router.post("/jadwal-ujian", createJadwalUjian);
router.get("/jadwal-ujian", getAllJadwalUjian);
router.patch("/jadwal-ujian/:id", updateJadwalUjian);

module.exports = router;