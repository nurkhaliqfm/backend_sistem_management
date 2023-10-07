const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");


const { DataTypes } = Sequelize;

const Users = db.define(
  "users",
  {
    id_prodi: {
      type: DataTypes.INTEGER,
      allowNull: false,
    },
    username: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    password: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    role: {
      type: DataTypes.STRING,
      allowNull: false,
    },
    refresh_token: {
      type: DataTypes.STRING,
    },
    session_date: {
      type: DataTypes.DATE,
    },
  },
  {
    freezeTableName: true,
  }
);

Users.associate = (models) => {
  Users.hasOne(models.Mahasiswa, {
    foreignKey: "id_user",
    as: "mahasiswa",
  });
  Users.hasOne(models.Dosen, {
    foreignKey: "id_user",
    as: "dosen",
  });
  Users.hasMany(models.Notification, {
    foreignKey: "id_user_from",
    as: "notificationsFrom",
  });
  Users.hasMany(models.Notification, {
    foreignKey: "id_user_to",
    as: "notificationsTo",
  });

};

module.exports = Users;
