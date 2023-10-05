const express = require("express");
const {
    createNotification,
    updateNotification,
    getAllNotification,
    getListNotification,
    getListDetailNotification,
    getPaginationNotification,
} = require("../controllers/NotificationController.js");

const router = express.Router();

router.post("/notification", createNotification);
router.get("/notification", getAllNotification);
router.get('/notification/pagination/:id_user_to', getPaginationNotification);
router.get('/notification/:id_user', getListNotification);
router.get('/notifications/detail/:id_user_to/:id_user_from', getListDetailNotification);
router.patch("/notification/:id", updateNotification);

module.exports = router;
