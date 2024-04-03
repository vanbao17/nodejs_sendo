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
  addToCart,
  cart,
  checkProdInCart,
  handleDeleteCart,
  updateCart,
  getCateFindPage,
  getAttributeValues,
  getFindProduct,
  getDanhMuc3WithDm2,
} = require("../controllers/APIController");
const router = express.Router();
const initAPIRoute = (app) => {
  router.get("/products", getAllProducts);
  router.get("/danhmuc1", getDanhMuc1);
  router.get("/danhmuc2", getDanhMuc2All);
  router.get("/danhmuc2/:madm1", getDanhMuc2Detail);
  router.get("/danhmuc3withdm2/:madm2", getDanhMuc3WithDm2);
  router.get("/productswithcate/:cateid", getProductsCate);
  router.get("/danhmuc2rand5", getCateFive);
  router.get("/danhmuc3/:cateid", getDanhMuc3All);
  router.get("/detail/:id", getDetailProds);
  router.get("/inforShop/:id", getInforShop);
  router.get("/prodShop/:id", getProductsOfShop);
  router.get("/favoriteProdShop/:id", getFavoriteProd);
  router.post("/addtocart", addToCart);
  router.get("/gio-hang/:id", cart);
  router.delete("/delete-cart", handleDeleteCart);
  router.get("/check-prods-select/:id", checkProdInCart);
  router.post("/update-cart", updateCart);
  router.get("/tim-kiem/:id", getCateFindPage);
  router.get("/danhmuc1single/:id", getCateFindPage);
  router.get("/getAttributeValues/:id", getAttributeValues);
  router.get("/getProductsLetters", getFindProduct);
  return app.use("/api/v1/", router);
};
module.exports = initAPIRoute;
