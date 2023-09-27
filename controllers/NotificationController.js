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

const getPaginationNotification = async (req, res) => {
    const { page } = req.query;
    const { id_user_to } = req.params;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 10;
    const startIndex = (pageNumber - 1) * pageSize;

    try {
        const totalCount = await Notification.count({
            where: { id_user_to: id_user_to }
        });

        const notificationData = await Notification.findAll({
            where: { id_user_to: id_user_to },
            offset: startIndex,
            limit: pageSize,
        });

        res.json({
            item: notificationData,
            page: pageNumber,
            per_page: pageSize,
            totalItems: totalCount,
            totalPages: Math.ceil(totalCount / pageSize),
        });
    } catch (error) {
        console.error("Error retrieving paginated notifications:", error);
        res.status(500).json("Error retrieving paginated notifications");
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
    getPaginationNotification,
    updateNotification,
};
