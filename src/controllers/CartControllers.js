const pool = require("../configs/connectDB");
let addToCart = (req, res) => {
  let { idUser, idProd, quanlity, size, color } = req.body;
  pool.query(
    "INSERT INTO sendo.cart(idCustomer, idProduct,quanlityCart,size,color) VALUES (?, ?,?,?,?)",
    [
      idUser,
      idProd,
      quanlity,
      size.attribute_value_id,
      color.attribute_value_id,
    ],
    (err, result) => {
      if (err) {
        console.error("Error while inserting data into cart:", err);
        return res.status(500).send("Data insertion failed"); // Trả về mã lỗi 500 và thông báo lỗi
      }
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
module.exports = {
  addToCart,
  updateCart,
  checkProdInCart,
  handleDeleteCart,
  cart,
  getDm1Single,
};
