const express = require("express");
const {
    createDocumentLogbook
} = require("../controllers/DocumentLogbookController.js");

const router = express.Router();

router.post("/document-logbook", createDocumentLogbook)

module.exports = router