const express = require('express');
const { createNotification, updateNotification } = require('../controllers/NotificationController.js');

const router = express.Router();

router.post('/notification', createNotification);
router.patch('/notification/:id', updateNotification);

module.exports = router;