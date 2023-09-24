const express = require("express");
const {
    createDosen,
    getPaginationDosen,
    updateDosen
} = require("../controllers/DosenController.js");

const router = express.Router();

router.post("/dosen", createDosen);
router.get("/dosen/:id_user", getPaginationDosen);
router.patch("/dosen/:id", updateDosen);

module.exports = router;
