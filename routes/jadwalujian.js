const express = require('express');
const { createJadwalUjian, updateJadwalUjian } = require('../controllers/JadwalUjianController.js');

const router = express.Router();

router.post("/jadwal-ujian", createJadwalUjian);
router.patch("/jadwal-ujian/:id", updateJadwalUjian);

module.exports = router;