const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const Notification = db.define(
    "notification",
    {
        id_user_from: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        id_user_to: {
            type: DataTypes.INTEGER,
            allowNull: false,
        },
        notif_content: {
            type: DataTypes.TEXT,
            allowNull: false,
        },
        date: {
            type: DataTypes.DATE,
            allowNull: false,
            defaultValue: Sequelize.NOW
        }
    },
    {
        freezeTableName: true,
    }
);

Notification.associate = (models) => {
    Notification.belongsTo(models.Users, {
        foreignKey: "id_user_from",
        as: "userFrom",
    });
    Notification.belongsTo(models.Users, {
        foreignKey: "id_user_to",
        as: "userTo",
    });
}

module.exports = Notification;
