const express = require("express");
const {
    createNotification,
    updateNotification,
    getAllNotification,
} = require("../controllers/NotificationController.js");

const router = express.Router();

router.post("/notification", createNotification);
router.get("/notification", getAllNotification);
router.patch("/notification/:id", updateNotification);

module.exports = router;
