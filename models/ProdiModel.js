const Sequelize = require("sequelize").Sequelize;
const { DataTypes } = Sequelize;

const Prodi = db.define(
  "prodi",
  {
    nama_prodi: {
      type: DataTypes.STRING,
      allowNull: false,
    },
  },
  {
    freezeTableName: true,
  }
);

export default Prodi;
