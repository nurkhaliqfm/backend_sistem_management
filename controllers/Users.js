const Users = require("../models/UserModel.js");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");

const getUsers = async (req, res) => {
  try {
    const users = await Users.findAll({
      attributes: ["id", "username", "role"],
    });
    res.json(users);
  } catch (error) {
    console.log(error);
  }
};

const Register = async (req, res) => {
  try {
    const { username, password, role, id_prodi } = req.body;

    if (!username || !password || !role || !id_prodi) {
      return res.status(400).json({ msg: "Username, password, role, dan id_prodi diperlukan." });
    }

    const existingUser = await Users.findOne({
      where: {
        username: username,
      },
    });

    if (existingUser) {
      return res.status(400).json({ msg: "Username sudah ada." });
    }

    // Hash password
    const salt = await bcrypt.genSalt(10);
    const hashedPassword = await bcrypt.hash(password, salt);

    const newUser = await Users.create({
      username: username,
      password: hashedPassword,
      role: role,
      id_prodi: id_prodi,
    });

    return res.status(201).json({ msg: "Pengguna berhasil didaftarkan." });
  } catch (error) {
    console.error("Error saat proses registrasi:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan saat registrasi" });
  }
};

const Login = async (req, res) => {
  try {
    const { username, password } = req.body;

    if (!username || !password) {
      return res.status(400).json({ msg: "Username dan password diperlukan." });
    }

    const user = await Users.findOne({
      where: {
        username: username,
      },
    });

    if (!user) {
      console.log(`User dengan username: ${username} tidak ditemukan.`);
      return res.status(404).json({ msg: "Username tidak ditemukan" });
    }

    const isMatch = await bcrypt.compare(password, user.password);

    if (!isMatch) {
      console.log(`Password tidak cocok untuk user: ${username}`);
      return res.status(400).json({ msg: "Password salah" });
    }

    const accessToken = jwt.sign(
      { id: user.id, username: user.username, role: user.role },
      process.env.ACCESS_TOKEN_SECRET,
      {
        expiresIn: "20s",
      }
    );

    const refreshToken = jwt.sign(
      { id: user.id, username: user.username, role: user.role },
      process.env.REFRESH_TOKEN_SECRET,
      {
        expiresIn: "1d",
      }
    );

    await Users.update(
      { refresh_token: refreshToken },
      {
        where: {
          id: user.id,
        },
      }
    );

    res.cookie("jwt", refreshToken, {
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000,
    });

    return res.status(200).json({ accessToken, refreshToken });
  } catch (error) {
    console.error("Error saat proses login:", error);
    return res.status(500).json({ msg: "Terjadi kesalahan saat login" });
  }
};

const Logout = async (req, res) => {
  const refreshToken = req.cookies.jwt;

  if (!refreshToken)
    return res.status(401).json({ msg: "Tidak ada token yang diberikan." });

  const user = await Users.findOne({
    where: {
      refresh_token: refreshToken,
    },
  });

  if (!user) return res.status(400).json({ msg: "Token tidak valid." });

  await Users.update(
    { refresh_token: null },
    {
      where: {
        id: user.id,
      },
    }
  );

  res.clearCookie("jwt");

  return res.status(200).json({ msg: "Berhasil logout." });
};

module.exports = { getUsers, Login, Logout, Register };
