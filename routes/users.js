const express = require("express");
const { Login, getUsers } = require("../controllers/Users.js");
const { verifyToken } = require("../middleware/VerifyToken.js");
const { refreshToken } = require("../controllers/RefreshToken.js");


const router = express.Router();

router.get("/user", verifyToken, getUsers);
router.post("/login", Login);
router.get("/token", refreshToken);

module.exports = router;

