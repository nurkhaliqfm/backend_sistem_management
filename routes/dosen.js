const express = require("express");
const {
    createDosen,
    updateDosen
} = require("../controllers/DosenController.js");

const router = express.Router();

router.post("/dosen", createDosen);
router.patch("/dosen/:id", updateDosen);

module.exports = router;
