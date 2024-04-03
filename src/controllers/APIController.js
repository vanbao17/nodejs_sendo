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
let getDanhMuc3WithDm2 = (req, res) => {
  let madm2 = req.params.madm2;
  pool.query(
    "select * from danhmuc3 WHERE madm2 = ?",
    [madm2],
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
let addToCart = (req, res) => {
  let data = req.body;
  pool.query(
    "INSERT INTO sendo.cart(idCustomer, idProduct,quanlityCart) VALUES (?, ?,?)",
    [data.idUser, data.idProd, data.quanlity],
    (err, result) => {
      if (err) {
        console.error("Error while inserting data into cart:", err);
        return res.status(500).send("Data insertion failed"); // Trả về mã lỗi 500 và thông báo lỗi
      }
      console.log("Data inserted into cart successfully");
      return res.status(200).send("Data received successfully"); // Trả về mã thành công 200 và thông báo thành công
    }
  );
};
let cart = (req, res) => {
  let idUser = req.params.id;
  pool.query(
    "SELECT * FROM sendo.cart as c,sendo.products as p,sendo.shop as s where c.idProduct = p.idProduct and c.idCustomer = ? and p.idShop=s.idShop;    ",
    [idUser],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let handleDeleteCart = (req, res) => {
  let data = req.body;
  if (!data.idProduct || !data.idUser) {
    return res.status(400).send("Invalid request data");
  }
  console.log(data.idProduct + "||" + data.idUser);
  pool.query(
    "delete from sendo.cart where idProduct = ? and idCustomer = ?",
    [data.idProduct, data.idUser],
    (err, result) => {
      if (err) {
        console.error("Error executing query:", err);
        return res.status(500).send("Internal Server Error");
      }
      pool.query(
        "SELECT * FROM sendo.cart as c,sendo.products as p,sendo.shop as s where c.idProduct = p.idProduct and c.idCustomer = ? and p.idShop=s.idShop;    ",
        [data.idUser],
        (err, result1) => {
          if (err) {
            console.error("Error executing SELECT query:", err);
            return res.status(500).send("Internal Server Error");
          }
          return res.send(JSON.stringify(result1));
        }
      );
    }
  );
};

let checkProdInCart = (req, res) => {
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

let updateCart = (req, res) => {
  let data = req.body;
  console.log(data.idProduct);
  pool.query(
    "update sendo.cart as c set c.quanlityCart = c.quanlityCart + ? where c.idProduct = ?",
    [data.quanlity, data.idProduct],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      if (result.affectedRows > 0) {
        return res.status(200).send("Update susscess !!");
      } else {
        return res.status(404).send("Update failed !!");
      }
      // pool.query(
      //   "SELECT * FROM sendo.cart as c,sendo.products as p,sendo.shop as s where c.idProduct = p.idProduct and c.idCustomer = ? and p.idShop=s.idShop;    ",
      //   [data.idUser],
      //   (err, result1) => {
      //     if (err) {
      //       console.error("Error executing SELECT query:", err);
      //       return res.status(500).send("Internal Server Error");
      //     }
      //     return res.send(JSON.stringify(result1));
      //   }
      // );
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
let getCateFindPage = (req, res) => {
  let data = req.params.id;
  pool.query(
    "SELECT * FROM sendo.Category_Attributes as m,sendo.Attributes as a,sendo.Type_Attributes as t  where a.attribute_id = m.attribute_id and  m.madm1 = ? and a.type_attribute_id = t.type_attribute_id;",
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
let getDm1Single = (req, res) => {
  let data = req.params.id;
  pool.query(
    "SELECT * FROM sendo.danhmuc1 as m where m.madm1= ?",
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
let getAttributeValues = (req, res) => {
  let data = req.params.id;
  pool.query(
    "select * from sendo.Attribute_Values as a where a.attribute_id =?",
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
  addToCart,
  cart,
  handleDeleteCart,
  checkProdInCart,
  updateCart,
  getFiltersFindProd,
  getCateFindPage,
  getDm1Single,
  getAttributeValues,
  getFindProduct,
  getDanhMuc3WithDm2,
};
