const { json } = require("body-parser");
const pool = require("../configs/connectDB");
const moment = require("moment");
let getAllProducts = (req, res) => {
  pool.query("select * from products", (err, result) => {
    if (err) {
      return;
    }
    return res.send(JSON.stringify(result));
  });
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
let getFiltersFindProd = (req, res) => {
  let data = req.params.id;
  pool.query(
    "SELECT quanlityCart FROM sendo.cart as c where c.idProduct = ?",
    [data],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getFindProduct = (req, res) => {
  let data = req.query.query.toLowerCase();
  pool.query(
    "SELECT * FROM sendo.products as p where p.nameProduct LIKE '" +
      data +
      "%';",
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let createProduct = (req, res) => {
  const {
    nameProduct,
    imageProduct,
    video,
    selledQuality,
    QuanlityExists,
    status,
    priceDefault,
    priceSale,
    datePublic,
    madm1,
    madm2,
    madm3,
    idShop,
  } = req.body;
  pool.query(
    "insert into sendo.products(nameProduct,imageProduct,video,selledQuality,QuanlityExists,status,priceDefault,priceSale,datePublic,madm1,madm2,madm3,idShop) values(?,?,?,?,?,?,?,?,?,?,?,?,?)",
    [
      nameProduct,
      "http://localhost:3001/uploads/" + imageProduct,
      video,
      selledQuality,
      QuanlityExists,
      status,
      priceDefault,
      priceSale,
      datePublic,
      madm1,
      madm2,
      madm3,
      idShop,
    ],
    (err, result) => {
      const newProductId = result.insertId;
      if (err) {
        console.error("Error executing query:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(newProductId));
    }
  );
};
let addDetailProduct = (req, res) => {
  const {
    idProduct,
    finalData: {
      desc,
      code,
      stateProduct,
      beginDate,
      endDate,
      quanlity,
      length,
      width,
      height,
    },
  } = req.body;

  pool.query(
    `INSERT INTO detailProduct (idProduct,descriptionProduct,trademark,dateBegin,dateEnd,properties,unit,descriptionDetail,origin,mass,slmua,length,large,height,idComment,state) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)`,
    [
      idProduct,
      desc,
      code,
      moment(beginDate).format("YYYY-MM-DD"),
      moment(endDate).format("YYYY-MM-DD"),
      desc,
      0,
      desc,
      "Vietnam",
      0,
      Number(quanlity),
      Number(length),
      Number(width),
      Number(height),
      1,
      stateProduct,
    ],
    (err, result) => {
      if (err) {
        console.error("Error executing query:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.status(200).send("Detail product inserted successfully");
    }
  );
};
let deleteProduct = (req, res) => {
  const { idProduct } = req.body;
  let errors = [];
  Promise.all(
    idProduct.map((item) => {
      return new Promise((resolve, reject) => {
        pool.query(
          "DELETE FROM sendo.products WHERE idProduct = ?",
          [item],
          (err, result) => {
            if (err) {
              errors.push(`Error deleting product with id: ${item}`);
              reject(err);
            } else {
              resolve(result);
            }
          }
        );
      });
    })
  )
    .then(() => {
      if (errors.length > 0) {
        return res
          .status(500)
          .json({ message: "Some products could not be deleted", errors });
      } else {
        return res.status(200).send("Products deleted successfully");
      }
    })
    .catch((error) => {
      console.error("Error executing query:", error);
      return res.status(500).send("An error occurred while deleting products");
    });
};

let deleteDetailProduct = (req, res) => {
  const { idProduct } = req.body;
  let errors = [];

  // Sử dụng Promise.all để đợi tất cả các truy vấn hoàn thành
  Promise.all(
    idProduct.map((item) => {
      return new Promise((resolve, reject) => {
        pool.query(
          "DELETE FROM sendo.detailproduct WHERE idProduct = ?",
          [item],
          (err, result) => {
            if (err) {
              errors.push(`Error deleting detail product with id: ${item}`);
              reject(err);
            } else {
              resolve(result);
            }
          }
        );
      });
    })
  )
    .then(() => {
      if (errors.length > 0) {
        return res.status(500).json({
          message: "Some detail products could not be deleted",
          errors,
        });
      } else {
        return res.status(200).send("Detail products deleted successfully");
      }
    })
    .catch((error) => {
      console.error("Error executing query:", error);
      return res
        .status(500)
        .send("An error occurred while deleting detail products");
    });
};
let getColorsProduct = (req, res) => {
  let idProduct = req.params.id;
  pool.query(
    "select * from sendo.attribute_values as av, sendo.valuesattr_product as vp where av.attribute_value_id =  vp.attribute_value_id and av.attribute_id=6 and vp.idProduct=?;",
    [idProduct],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getSizesProduct = (req, res) => {
  let idProduct = req.params.id;
  pool.query(
    "select * from sendo.attribute_values as av, sendo.valuesattr_product as vp where av.attribute_value_id =  vp.attribute_value_id and av.attribute_id=12 and vp.idProduct=?;",
    [idProduct],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  getAllProducts,
  getProductsCate,
  getDetailProds,
  getProductsOfShop,
  getFavoriteProd,
  getFiltersFindProd,
  getFindProduct,
  createProduct,
  addDetailProduct,
  deleteDetailProduct,
  deleteProduct,
  getColorsProduct,
  getSizesProduct,
};
