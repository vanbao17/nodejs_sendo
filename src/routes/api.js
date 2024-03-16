const express = require("express");
const {
  getAllProducts,
  getDanhMuc1,
  getDanhMuc2All,
  getDanhMuc2Detail,
  getDanhMuc3All,
  getCateFive,
  getProductsCate,
  getDetailProds,
  getInforShop,
  getProductsOfShop,
  getFavoriteProd,
} = require("../controllers/APIController");
const router = express.Router();
const initAPIRoute = (app) => {
  router.get("/products", getAllProducts);
  router.get("/danhmuc1", getDanhMuc1);
  router.get("/danhmuc2", getDanhMuc2All);
  router.get("/danhmuc2/:madm1", getDanhMuc2Detail);
  router.get("/productswithcate/:cateid", getProductsCate);
  router.get("/danhmuc2rand5", getCateFive);
  router.get("/danhmuc3/:cateid", getDanhMuc3All);
  router.get("/detail/:id", getDetailProds);
  router.get("/inforShop/:id", getInforShop);
  router.get("/prodShop/:id", getProductsOfShop);
  router.get("/favoriteProdShop/:id", getFavoriteProd);
  return app.use("/api/v1/", router);
};
module.exports = initAPIRoute;