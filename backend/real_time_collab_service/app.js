const express = require('express');
const http = require('http');
const cors = require('cors');
const dotenv = require('dotenv');
const connectDB = require('./config/db');
const commentRoutes = require('./routes/commentRoutes');
const notificationSocket = require('./socket/notificationSocket');

dotenv.config();

connectDB();

const app = express();
app.use(express.json());
app.use(cors());

// Create server and attach Socket.io
const server = http.createServer(app);
const io = notificationSocket(server);

// Pass Socket.io instance to middleware
app.use((req, res, next) => {
  req.io = io;
  next();
});

// Routes
app.use('/api', commentRoutes);

// Start server
const PORT = process.env.PORT || 5000;
server.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});