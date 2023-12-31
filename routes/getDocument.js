const express = require("express");

const { getDocument } = require("../controllers/DocumentController.js");

const router = express.Router();

router.get("/document/proposal/:fileName", getDocument);

module.exports = router;
