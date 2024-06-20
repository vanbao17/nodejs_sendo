const express = require("express");
const configViewEngine = require("./src/configs/viewEngine");
const initAPIRoute = require("./src/routes/api");
const dotenv = require("dotenv");
const bodyParser = require("body-parser");
const app = express();
const port = process.env.PORT || 3001;
const cors = require("cors");
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
configViewEngine(app);
app.use(bodyParser.json());
initAPIRoute(app);
app.use(express.urlencoded({ extended: true }));
app.use(express.json());

app.listen(port, () => {
  console.log("server is runnning");
});
app.get("/", (req, res) => {
  res.sendFile("/index.ejs");
});
