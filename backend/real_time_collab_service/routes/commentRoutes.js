const express = require('express');
const { addComment, getComments } = require('../controllers/commentController');

const router = express.Router();

// Route to add a comment
router.post('/comments', addComment);

// Route to get comments for a task
router.get('/comments/:taskId', getComments);

module.exports = router;