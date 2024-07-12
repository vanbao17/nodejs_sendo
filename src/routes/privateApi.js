const {
  addDanhMuc1,
  fetchData,
} = require("../controllers/api/CateApiController");
const express = require("express");
const multer = require("multer");
const jwt = require("jsonwebtoken");
const path = require("path");
const fs = require("fs");
const PORT = 3001;
const bodyParser = require("body-parser");
const privateApi = (app) => {
  const router = express.Router();
  app.use(bodyParser.urlencoded({ extended: true }));
  app.get("/Catetory", fetchData);
  app.post("/addDanhMuc1", addDanhMuc1);
  return app.use("/", router);
};
module.exports = privateApi;
