const express = require("express");
const configViewEngine = require("./configs/viewEngine");
const initAPIRoute = require("./routes/api");
const dotenv = require("dotenv");
const app = express();
const port = process.env.PORT || 3001;
const cors = require("cors");
const corsOptions = {
  origin: "*",
  credentials: true, //access-control-allow-credentials:true
  optionSuccessStatus: 200,
};
app.use(cors(corsOptions));
dotenv.config();
configViewEngine(app);
initAPIRoute(app);
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.listen(port, () => {
  console.log("server is runnning");
});
app.get("/", (req, res) => {
  res.sendFile("/index.ejs");
});
