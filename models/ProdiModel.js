const Sequelize = require("sequelize").Sequelize;
const db = require("../config/Database.js");

const { DataTypes } = Sequelize;

const Prodi = db.define(
  "prodi",
  {
    id_neosia: {
      type: DataTypes.STRING,
      allowNull: false
    },
    nama_resmi: {
      type: DataTypes.STRING,
      allowNull: false
    },
    nama_singkat: {
      type: DataTypes.STRING,
      allowNull: false
    },
    nama_asing: {
      type: DataTypes.STRING,
      allowNull: false
    },
    nama_asing_singkat: {
      type: DataTypes.STRING,
      allowNull: false
    },
    is_eksakta: {
      type: DataTypes.BOOLEAN,
      allowNull: false
    },
    prodi_jenjang_kode: {
      type: DataTypes.STRING,
      allowNull: false
    },
    prodi_jenjang_nama: {
      type: DataTypes.STRING,
      allowNull: false
    }
  },
  {
    freezeTableName: true,
  }
);
Prodi.associate = (models) => {
  Prodi.hasMany(models.Mahasiswa, {
    foreignKey: "id_prodi",
    as: "mahasiswa",
  });
};

module.exports = Prodi;


// Sebuah prodi dapat memiliki banyak mahasiswa(relasi satu ke banyak).
