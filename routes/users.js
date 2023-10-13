const express = require("express");
const {
  Login,
  getUsers,
  getUsersById,
  Logout,
  Register,
} = require("../controllers/Users.js");
const { verifyToken } = require("../middleware/VerifyToken.js");
const { refreshToken } = require("../controllers/RefreshToken.js");

const router = express.Router();

router.get("/user", verifyToken, getUsers);
router.get("/user/:id", verifyToken, getUsersById);
router.post("/login", Login);
router.post("/register", Register);
router.get("/token", refreshToken);
router.delete("/logout", Logout);

module.exports = router;
