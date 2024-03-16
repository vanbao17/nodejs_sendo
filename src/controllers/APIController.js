const pool = require("../configs/connectDB");
let getAllProducts = (req, res) => {
  pool.query("select * from products", (err, result) => {
    if (err) {
      return;
    }
    return res.send(JSON.stringify(result));
  });
};
let getDanhMuc1 = (req, res) => {
  pool.query("select * from danhmuc1", (err, result) => {
    if (err) {
      return;
    }
    return res.send(JSON.stringify(result));
  });
};
let getDanhMuc2All = (req, res) => {
  pool.query("select * from danhmuc2", (err, result) => {
    if (err) {
      return;
    }
    return res.send(JSON.stringify(result));
  });
};
let getDanhMuc2Detail = (req, res) => {
  var madm1 = req.params.madm1;
  pool.query(
    "select * from danhmuc2 where madm1 = ?",
    [madm1],
    (err, result) => {
      if (err) {
        return;
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getDanhMuc3All = (req, res) => {
  let madm1 = req.params.cateid;
  pool.query(
    "select * from danhmuc3 WHERE madm1 = ?",
    [madm1],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getCateFive = (req, res) => {
  pool.query(
    "SELECT * FROM sendo.danhmuc2 ORDER BY RAND() LIMIT 5;",
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getProductsCate = (req, res) => {
  let madm1 = req.params.cateid;
  pool.query(
    "SELECT * FROM sendo.products where madm1=?;",
    [madm1],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getDetailProds = (req, res) => {
  let masp = req.params.id;
  pool.query(
    "SELECT * FROM sendo.products,sendo.shop,sendo.detailProduct,sendo.danhmuc1,sendo.danhmuc2,sendo.danhmuc3 where sendo.products.idProduct=sendo.detailProduct.idProduct and sendo.products.idProduct = ? and sendo.danhmuc1.madm1 = sendo.products.madm1 and sendo.danhmuc2.madm2 = sendo.products.madm2 and sendo.danhmuc3.madm3 = sendo.products.madm3 and sendo.shop.idShop = sendo.products.idShop ",
    [masp],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getInforShop = (req, res) => {
  let mashop = req.params.id;
  pool.query(
    "SELECT * FROM sendo.shop where idShop=?; ",
    [mashop],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getProductsOfShop = (req, res) => {
  let mashop = req.params.id;
  pool.query(
    "SELECT * FROM sendo.products where sendo.products.idShop=?;",
    [mashop],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getFavoriteProd = (req, res) => {
  let data = req.params.id;
  let arrayData = data.split("");
  pool.query(
    "SELECT * FROM sendo.products where sendo.products.madm1=? and sendo.products.madm2=?;",
    [arrayData[0], arrayData[1]],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  getAllProducts,
  getDanhMuc2Detail,
  getDanhMuc2All,
  getDanhMuc1,
  getDanhMuc3All,
  getCateFive,
  getProductsCate,
  getDetailProds,
  getInforShop,
  getProductsOfShop,
  getFavoriteProd,
};
