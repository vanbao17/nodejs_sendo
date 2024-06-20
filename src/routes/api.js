const express = require("express");
const multer = require("multer");
const jwt = require("jsonwebtoken");
const path = require("path");
const fs = require("fs");
const PORT = 3001;
const {
  getProductsOfShop,
  getDetailProds,
  getAllProducts,
  getProductsCate,
  getFavoriteProd,
  getFindProduct,
  createProduct,
  addDetailProduct,
  deleteProduct,
  deleteDetailProduct,
  getSizesProduct,
  getColorsProduct,
} = require("../controllers/ProductControllers");
const {
  getDanhMuc1,
  getDanhMuc2All,
  getDanhMuc2Detail,
  getDanhMuc3All,
  getCateFive,
  getDanhMuc3WithDm2,
  getCateFindPage,
  getAttributeValues,
  getAllAttributeValues,
} = require("../controllers/CatetoryControllers");
const {
  getInforShop,
  createShop,
  getShop,
  createTypeShop,
  getShopSendo,
  getShopSendmail,
} = require("../controllers/ShopControllers");
const {
  addToCart,
  handleDeleteCart,
  checkProdInCart,
  updateCart,
  cart,
} = require("../controllers/CartControllers");
const { getCustomer } = require("../controllers/CustomerControllers");
const { uploadFileImage } = require("../controllers/FileControllers");
const {
  addValueAttrProduct,
  deleteValueAttr,
  getColorSize,
} = require("../controllers/AttributeValues");
const router = express.Router();
const storage_images_product = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "src/assets/image/images_product");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});

const authenticateToken = (req, res, next) => {
  const authHeader = req.headers["authorization"];
  const token = authHeader && authHeader.split(" ")[1];

  if (token == null) return res.sendStatus(401);

  jwt.verify(token, secretKey, (err, user) => {
    if (err) return res.sendStatus(403);
    req.user = user;
    next();
  });
};
const upload_images_product = multer({ storage: storage_images_product });
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
  router.get("/getColorSize/:id", getColorSize);
  router.post("/addtocart", addToCart);
  router.get("/gio-hang/:id", cart);
  router.delete("/delete-cart", handleDeleteCart);
  router.get("/check-prods-select/:id", checkProdInCart);
  router.post("/update-cart", updateCart);
  router.get("/tim-kiem/:id", getCateFindPage);
  router.get("/danhmuc1single/:id", getCateFindPage);
  router.get("/getAttributeValues/:id", getAttributeValues);
  router.get("/getColorsProduct/:id", getColorsProduct);
  router.get("/getSizesProduct/:id", getSizesProduct);
  router.get("/getProductsLetters", getFindProduct);
  router.get("/getAllAttributeValues", getAllAttributeValues);
  router.post("/create-shop", createShop);
  router.post("/get-shop", getShop);
  router.post("/create-type-shop", createTypeShop);
  router.post("/get-shopSendo", getShopSendo);
  router.post("/get-shopSendmail", getShopSendmail);
  router.post("/get-customer", getCustomer);
  router.post("/createProduct", createProduct);
  router.post("/addDetailProduct", addDetailProduct);
  router.post("/createAttrProduct", addValueAttrProduct);
  router.post("/deleteValueAttr", deleteValueAttr);
  router.post("/deleteProduct", deleteProduct);
  router.post("/deleteDetailProduct", deleteDetailProduct);
  router.post(
    "/upload_images_product",
    upload_images_product.single("file"),
    uploadFileImage
  );
  app.get("/files", (req, res) => {
    fs.readdir("src/assets/image/images_product", (err, files) => {
      if (err) {
        return res.status(500).send("Unable to scan files.");
      }
      const fileInfos = files.map((file) => ({
        name: file,
        url: `http://localhost:3001/uploads/${file}`,
      }));
      res.json(fileInfos);
    });
  });
  return app.use("/api/v1/", router);
};
module.exports = initAPIRoute;
