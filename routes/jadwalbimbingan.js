const express = require('express');
const { createJadwalBimbingan, updateJadwalBimbingan } = require('../controllers/JadwalBimbinganController.js');

const router = express.Router();

router.post("/jadwal-bimbingan", createJadwalBimbingan);
router.patch("/jadwal-bimbingan/:id", updateJadwalBimbingan);

module.exports = router;