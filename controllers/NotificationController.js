const Notification = require("../models/NotificationModel.js");
const User = require("../models/UserModel.js");

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

const getListNotification = async (req, res) => {
    const { id_user } = req.params;

    const dataUser = await User.findByPk(id_user);
    if (!dataUser) {
        return res.status(404).json({ error: "User not found" });
    }

    try {
        let notifications = [];
        const getNotif = await Notification.findAll({
            where: { id_user_to: id_user },
            attributes: ['id_user_from', [Notification.sequelize.fn('COUNT', Notification.sequelize.col('id_user_from')), 'numberOfNotifs']],
            group: ['id_user_from'],
            order: [[Notification.sequelize.fn('COUNT', Notification.sequelize.col('id_user_from')), 'DESC']]
        });

        notifications.push(...getNotif);

        if (dataUser.role == 'mahasiswa') {
            const notificationsByMahasiswa = await Notification.findAll({
                where: { id_user_from: id_user },
                attributes: ['id_user_from', [Notification.sequelize.fn('COUNT', Notification.sequelize.col('id_user_from')), 'numberOfNotifs']],
                group: ['id_user_from'],
                order: [[Notification.sequelize.fn('COUNT', Notification.sequelize.col('id_user_from')), 'DESC']]
            });

            notifications.push(...notificationsByMahasiswa);
        }

        res.json({
            item: notifications
        });
    } catch (error) {
        console.error("Error retrieving grouped notifications:", error);
        res.status(500).json("Error retrieving grouped notifications");
    }
};


const getListDetailNotification = async (req, res) => {
    const { id_user_to, id_user_from } = req.params;

    const recipientUser = await User.findOne({
        where: { id: id_user_to }
    });
    if (!recipientUser) {
        return res.status(404).json({ error: "Recipient user not found" });
    }

    const senderUser = await User.findOne({
        where: { id: id_user_from }
    });
    if (!senderUser) {
        return res.status(404).json({ error: "Sender user not found" });
    }

    try {
        let notifications = [];

        if (senderUser.role == 'mahasiswa') {
            if (id_user_to === id_user_from) {
                const notificationsByMahasiswa = await Notification.findAll({
                    where: { id_user_from: id_user_to },
                });
                notifications.push(...notificationsByMahasiswa);
            } else {
                const getNotif = await Notification.findAll({
                    where: {
                        id_user_to: id_user_to,
                        id_user_from: id_user_from
                    }
                });
                notifications.push(...getNotif);
            }
        } else {
            const getNotif = await Notification.findAll({
                where: {
                    id_user_to: id_user_to,
                    id_user_from: id_user_from
                }
            });
            notifications.push(...getNotif);
        }

        if (notifications.length === 0) {
            return res.status(404).json({ error: "No notifications found between the specified users." });
        }

        res.json({
            item: notifications
        });

    } catch (error) {
        console.error("Error retrieving detailed notifications:", error);
        res.status(500).json("Error retrieving detailed notifications");
    }
};



const getPaginationNotification = async (req, res) => {
    const { page } = req.query;
    const { id_user_to } = req.params;

    const pageNumber = parseInt(page, 10) || 1;
    const pageSize = 5;
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
            total_items: totalCount,
            total_pages: Math.ceil(totalCount / pageSize),
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
    getListNotification,
    getListDetailNotification,
    getPaginationNotification,
    updateNotification,
};
