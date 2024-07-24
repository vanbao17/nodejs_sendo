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
  getProductsCateDanhmuc2,
  getProductsCateDanhmuc3,
  updateProduct,
  getImageProduct,
} = require("../controllers/ProductControllers");
const {
  getDanhMuc1,
  getDanhMuc2All,
  getDanhMuc2Detail,
  getDanhMuc3All,
  getCateFive,
  getDanhMuc3AllCate,
  getDanhMuc3WithDm2,
  getCateFindPage,
  getAttributeValues,
  getAllAttributeValues,
  updateDanhMuc1,
  updateDanhMuc2,
  updateDanhMuc3,
  getDanhMuc1WithId,
} = require("../controllers/CatetoryControllers");
const {
  getInforShop,
  createShop,
  getShop,
  createTypeShop,
  getShopSendo,
  getShopSendmail,
  getShops,
  getAllShop,
} = require("../controllers/ShopControllers");
const {
  addToCart,
  handleDeleteCart,
  checkProdInCart,
  updateCart,
  cart,
} = require("../controllers/CartControllers");
const {
  getCustomer,
  getAddressCustomer,
  addAddressCustomers,
  checkAddressCustomer,
  getCustomerId,
  signIn,
  updateInforCustomer,
  updatePassword,
  getAllCustomer,
} = require("../controllers/CustomerControllers");
const { uploadFileImage } = require("../controllers/FileControllers");
const {
  addValueAttrProduct,
  deleteValueAttr,
  getColorSize,
  getAttrVaulueProduct,
  getFullAttribute,
  getAllAttribute,
  createAttrCate,
  createAttrValues,
  getAttrDetailProduct,
} = require("../controllers/AttributeValues");
const {
  getTransformCate,
  getTransformWithCate,
  getTransformOptions,
} = require("../controllers/MethodTrasnform");
const {
  getCatePayment,
  getPaymentWithCate,
  getPaymentWithId,
} = require("../controllers/Payments");
const {
  addOderProduct,
  getOrderCustomer,
  getOrderIdCustomer,
  getOrderIdOrder,
  getOrderItems,
  getOrderShop,
  updateStateOrder,
  deleteOrder,
  getOrderFinal,
} = require("../controllers/OrderControllers");
const {
  getChatUser,
  getChatIdShop,
  addChatUser,
  getMessIdConve,
  getChatIdShopCustomer,
  deleteChat,
} = require("../controllers/ChatController");
const {
  getCommentForProduct,
  checkStateComment,
  addComment,
  updateComment,
  deleteComment,
} = require("../controllers/CommentControllers");
const router = express.Router();
const storage_images_product = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "src/assets/image/images_product");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
const storage_images_product_parent = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "src/assets/image/images_product");
  },
  filename: function (req, file, cb) {
    cb(null, file.originalname);
  },
});
// const secretKey = "PhamVanBao_0123";
// const verifyToken = (req, res, next) => {
//     const token = req.headers["authorization"];

//     if (!token) {
//         return res.status(403).send("Xì mười nghìn đây bố mày mở cho  :))))");
//     }

//     jwt.verify(token.split(" ")[1], secretKey, (err, decoded) => {
//         if (err) {
//             return res.status(500).send("Failed to authenticate token");
//         }

//         req.idCustomers = decoded.id;
//         next();
//     });
// };
const upload_images_product = multer({ storage: storage_images_product });
const upload_images_product_parent = multer({
  storage: storage_images_product_parent,
});
const initAPIRoute = (app) => {
  router.get("/products", getAllProducts);
  router.get("/getFullAttribute", getFullAttribute);
  router.post("/getCommentForProduct", getCommentForProduct);
  router.post("/getAllCustomer", getAllCustomer);
  router.post("/getAllShop", getAllShop);
  router.post("/deleteChat", deleteChat);
  router.post("/addComment", addComment);
  router.post("/getChatIdShopCustomer", getChatIdShopCustomer);
  router.post("/updateComment", updateComment);
  router.post("/getOrderFinal", getOrderFinal);
  router.post("/deleteComment", deleteComment);
  router.post("/createAttrCate", createAttrCate);
  router.post("/signIn", signIn);
  router.post("/checkStateComment", checkStateComment);
  router.get("/getAttrDetailProduct/:id", getAttrDetailProduct);
  router.get("/getImageProduct/:id", getImageProduct);
  router.post("/updateProduct", updateProduct);
  router.post("/createAttrValues", createAttrValues);
  router.get("/danhmuc1", getDanhMuc1);
  router.get("/danhmuc2", getDanhMuc2All);
  router.get("/danhmuc3", getDanhMuc3AllCate);
  router.get("/danhmuc2/:madm1", getDanhMuc2Detail);
  router.get("/danhmuc3withdm2/:madm2", getDanhMuc3WithDm2);
  router.get("/productswithcate/:cateid", getProductsCate);
  router.get("/getProductsCateDanhmuc2/:cateid", getProductsCateDanhmuc2);
  router.get("/getProductsCateDanhmuc3/:cateid", getProductsCateDanhmuc3);
  router.get("/danhmuc2rand5", getCateFive);
  router.get("/danhmuc3/:cateid", getDanhMuc3All);
  router.get("/detail/:id", getDetailProds);
  router.get("/inforShop/:id", getInforShop);
  router.get("/prodShop/:id", getProductsOfShop);
  router.get("/favoriteProdShop/:id", getFavoriteProd);
  router.get("/getColorSize/:id", getColorSize);
  router.get("/getAddressCustomer/:id", getAddressCustomer);
  router.post("/addtocart", addToCart);
  router.get("/gio-hang/:id", cart);
  router.get("/getCustomerId/:id", getCustomerId);
  router.delete("/delete-cart", handleDeleteCart);
  router.post("/check-prods-select", checkProdInCart);
  router.post("/update-cart", updateCart);
  router.get("/getDanhMuc1WithId/:id", getDanhMuc1WithId);
  router.get("/tim-kiem/:id", getCateFindPage);
  router.get("/danhmuc1single/:id", getCateFindPage);
  router.get("/getAttributeValues/:id", getAttributeValues);
  router.get("/getColorsProduct/:id", getColorsProduct);
  router.get("/getSizesProduct/:id", getSizesProduct);
  router.get("/getProductsLetters", getFindProduct);
  router.get("/getAllAttributeValues", getAllAttributeValues);
  router.get("/getAllAttribute", getAllAttribute);
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
  router.post("/addAddressCustomers", addAddressCustomers);
  router.post("/checkAddressCustomer", checkAddressCustomer);
  router.post("/updateDanhMuc1", updateDanhMuc1);
  router.post("/updateDanhMuc2", updateDanhMuc2);
  router.post("/updateDanhMuc3", updateDanhMuc3);
  router.get("/getTransformCate", getTransformCate);
  router.post("/getTransformWithCate", getTransformWithCate);
  router.post("/getTransformOptions", getTransformOptions);
  router.post("/getAttrVaulueProduct", getAttrVaulueProduct);

  router.get("/getCatePayment", getCatePayment);
  router.post("/getPaymentWithCate", getPaymentWithCate);
  router.post("/getPaymentWithId", getPaymentWithId);

  router.post("/addOderProduct", addOderProduct);
  router.post("/getOrderCustomer", getOrderCustomer);
  router.post("/getOrderIdCustomer", getOrderIdCustomer);
  router.post("/getOrderIdOrder", getOrderIdOrder);
  router.post("/getOrderItems", getOrderItems);
  router.post("/getOrderShop", getOrderShop);
  router.post("/updateStateOrder", updateStateOrder);
  router.post("/updateInforCustomer", updateInforCustomer);
  router.post("/deleteOrder", deleteOrder);
  router.post("/updatePassword", updatePassword);
  router.get("/getChatUser/:id", getChatUser);
  router.get("/getChatIdShop/:id", getChatIdShop);
  router.post("/addChatUser", addChatUser);
  router.get("/getMessIdConve/:id", getMessIdConve);
  router.get("/getShops", getShops);
  router.post(
    "/upload_images_product",
    upload_images_product.single("file"),
    uploadFileImage
  );
  router.post(
    "/upload_images_product_parent",
    upload_images_product_parent.single("file"),
    uploadFileImage
  );
  app.get("/files", (req, res) => {
    fs.readdir("src/assets/image/images_product", (err, files) => {
      if (err) {
        return res.status(500).send("Unable to scan files.");
      }
      const fileInfos = files.map((file) => ({
        name: file,
        url: `https://sdvanbao17.id.vn/uploads/${file}`,
      }));
      res.json(fileInfos);
    });
  });
  return app.use("/api/v1/", router);
};
module.exports = initAPIRoute;
