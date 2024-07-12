const express = require("express");
const configViewEngine = require("./src/configs/viewEngine");
const initAPIRoute = require("./src/routes/api");
const privateApi = require("./src/routes/privateApi");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const app = express();
const port = 3001;
const path = require("path");
const cors = require("cors");
const socketIo = require("socket.io");
const pool = require("./src/configs/connectDB");
const http = require("http").createServer(app);
const io = socketIo(http, {
  cors: {
    origin: "http://localhost:3000", // Đảm bảo đây là địa chỉ frontend của bạn
    methods: ["GET", "POST"],
  },
});
const corsOptions = {
  origin: "*",
  credentials: true, //access-control-allow-credentials:true
  optionSuccessStatus: 200,
};
app.use("/uploads", express.static("src/assets/image/images_product"));
app.use(
  "/uploadProfiles",
  express.static("src/assets/image/image_profile_product")
);
app.use(cors(corsOptions));
dotenv.config();
// configViewEngine(app);
app.use(bodyParser.json());
initAPIRoute(app);
privateApi(app);
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

// app.listen(port, () => {
//   console.log("server is runnning");
// });

http.listen(port, () => console.log(`Listening on port ${port}`));
app.get("/", (req, res) => {
  res.send("Hello World!");
});
app.use(express.static(path.join(__dirname, "build")));

// Handles any requests that don't match the ones above
// app.get("*", (req, res) => {
//   res.render(path.join(__dirname + "/src/views/index.ejs"));
// });
app.set("views", path.join(__dirname + "/src/views/"));
app.set("view engine", "ejs");

io.on("connection", (socket) => {
  socket.on("joinConversation", (userId) => {
    socket.join(userId);
  });
  socket.on("sendMessage", (data) => {
    const { userId, sender_type, senderId, content } = data;
    console.log({ userId, sender_type, senderId, content });
    io.to(userId).emit("receiveMessage", {
      userId,
      sender_type,
      senderId,
      content,
      timestamp: new Date(),
    });
    // const query =
    //   "INSERT INTO messages (conversation_id, sender_type, sender_id, content) VALUES (?, ?, ?, ?)";
    // pool.query(
    //   query,
    //   [conversationId, senderType, senderId, content],
    //   (err, result) => {
    //     if (err) throw err;

    // io.to(conversationId).emit("receiveMessage", {
    //   conversationId,
    //   senderType,
    //   senderId,
    //   content,
    //   timestamp: new Date(),
    // });
    //   }
    // );
  });
});
