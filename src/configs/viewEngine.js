const path = require("path");
const express = require("express");
const configViewEngine = (app) => {
  app.use(express.static("./src/public"));
  // app.set("views", path.join(__dirname + "/src/views/"));
  // app.set("view engine", "ejs");
};
module.exports = configViewEngine;
