const express = require("express");
const {
    createNotification,
    updateNotification,
    getAllNotification,
    getPaginationNotification
} = require("../controllers/NotificationController.js");

const router = express.Router();

router.post("/notification", createNotification);
router.get("/notification", getAllNotification);
router.get('/notification/pagination/:id_user_to', getPaginationNotification);
router.patch("/notification/:id", updateNotification);

module.exports = router;
