const pool = require("../configs/connectDB");
let getInforShop = (req, res) => {
  let mashop = req.params.id;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.shop where idShop=?; ",
    [mashop],
    (err, result) => {
      if (err) throw err;
      return res.send(JSON.stringify(result));
    }
  );
};
let getShops = (req, res) => {
  pool.query("SELECT * FROM psomwqdghosting_sendo.shop ; ", (err, result) => {
    if (err) throw err;
    return res.send(JSON.stringify(result));
  });
};
let createShop = (req, res) => {
  let data = req.body;
  pool.query(
    "insert psomwqdghosting_sendo.shop(phone,password)values (?,?)",
    [data.phone, data.pass],
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
    }
  );
};
let getShop = (req, res) => {
  let phone = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.shop where phone = ?",
    [phone.mail],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let createTypeShop = (req, res) => {
  let data = req.body;
  if (data.type == "shopSendo") {
    pool.query(
      "insert psomwqdghosting_sendo.shopSendo(idShop,taxcode,cccd,email)values (?,?,?,?)",
      [data.idshop, data.taxcode, data.cccd, data.email],
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
      }
    );
  } else {
    pool.query(
      "insert psomwqdghosting_sendo.shopSendmail(idShop,taxcode,cccd,email,nameshopowner,namecompany,businesstype,brandtype,codebusiness)values (?,?,?,?,?,?,?,?,?)",
      [
        data.idshop,
        data.taxcode,
        data.cccd,
        data.email,
        data.nameshopowner,
        data.namecompany,
        data.businesstype,
        data.brandtype,
        data.codebusiness,
      ],
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
      }
    );
  }
};
let getShopSendo = (req, res) => {
  let value = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.shopSendo where idShop=?",
    [value.id],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getShopSendmail = (req, res) => {
  let value = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.shopSendmail where idShop=?",
    [value.id],
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
  getInforShop,
  createShop,
  getShopSendmail,
  getShopSendo,
  getShop,
  createTypeShop,
  getShops,
};
