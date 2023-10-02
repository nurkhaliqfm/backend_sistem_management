const express = require("express");

const { getBimbingan } = require("../controllers/BimbinganController.js");

const router = express.Router();

router.get("/document_name/proposal/:fileName", getBimbingan);

module.exports = router;
