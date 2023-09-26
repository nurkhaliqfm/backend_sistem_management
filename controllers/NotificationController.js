const Notification = require("../models/NotificationModel.js");

const createNotification = async (req, res) => {
    const notificationData = req.body;

    try {
        await Notification.create({
            notif_content: notificationData.notif_content,
            date: notificationData.date,
            id_user_from: notificationData.id_user_from,
            id_user_to: notificationData.id_user_to,
        });
    } catch (error) {
        console.error("Error creating notification:", error);
        res.status(500).json("Error creating notification");
    }
};

const getAllNotification = async (req, res) => {
    try {
        const notificationData = await Notification.findAll();
        res.json(notificationData);
    } catch (error) {
        console.error("Kesalahan saat mengambil notification:", error);
        res.status(500).json("Kesalahan saat mengambil notification");
    }
};

const updateNotification = async (req, res) => {
    const notificationData = req.body;

    try {
        await Notification.update(notificationData, {
            where: {
                id: req.params.id,
            },
        });
        res.json("Data notification berhasil di-update.");
    } catch (error) {
        console.error("Error updating notification:", error);
        res.status(500).json("Error updating notification");
    }
};

module.exports = {
    createNotification,
    getAllNotification,
    updateNotification,
};
