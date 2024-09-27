const Comment = require('../models/commentModel');

// Add a new comment to a task
exports.addComment = async (req, res) => {
  const { taskId, content, userId } = req.body;

  try {
    const comment = new Comment({
      taskId,
      content,
      userId,
    });

    await comment.save();

    // Emit the new comment event to all connected clients
    req.io.emit('newComment', comment);

    res.status(201).json({ message: 'Comment added', comment });
  } catch (error) {
    res.status(500).json({ message: 'Server error', error });
  }
};

// Get comments for a task
exports.getComments = async (req, res) => {
  const { taskId } = req.params;

  try {

    const comments = await Comment.find({ taskId });
    res.status(200).json(comments);
  } catch (error) {
    res.status(500).json({ message: 'Server error', error });
  }
};