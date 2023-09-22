const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");


const { DataTypes } = Sequelize;

const Users = db.define(
  "users",
  {
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
};

module.exports = Users;
