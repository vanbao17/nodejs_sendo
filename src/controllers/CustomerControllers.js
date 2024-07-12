const pool = require("../configs/connectDB");
let signIn = (req, res) => {
  let { phone, password } = req.body;
  pool.query(
    "insert into psomwqdghosting_sendo.customers (phoneNumber,password) values(?,?)",
    [phone, password],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      const insertedId = result.insertId;
      const selectQuery =
        "SELECT * FROM psomwqdghosting_sendo.customers WHERE idCustomers = ?";
      pool.query(selectQuery, [insertedId], (error, rows) => {
        if (error) {
          return console.error("Error retrieving data: ", error);
        }
        return res.status(200).send(JSON.stringify(rows));
      });
    }
  );
};
let getCustomer = (req, res) => {
  let value = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.customers where phoneNumber=?",
    ["0" + value.phone_data.slice(3)],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let updatePassword = (req, res) => {
  const { idCustomers, password } = req.body;
  pool.query(
    "update psomwqdghosting_sendo.customers set password=? where idCustomers=?",
    [password, idCustomers],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.status(200).send("update success");
    }
  );
};
let getCustomerId = (req, res) => {
  const idCustomer = req.params.id;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.customers where idCustomers=?",
    [idCustomer],
    (err, result) => {
      if (err) {
        console.error("Error querying cart:", err);
        return res.status(500).send("Internal Server Error");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getAddressCustomer = (req, res) => {
  const idCustomer = req.params.id;
  pool.query(
    "select * from psomwqdghosting_sendo.addressGetPro where idCustomers=?",
    [idCustomer],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("lỗi CMNR");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let addAddressCustomers = (req, res) => {
  const { tt, qh, px, loaidiachi, idCustomers, address } = req.body;
  pool.query(
    "insert into psomwqdghosting_sendo.addressGetPro(tt,qh,px,loaidiachi,idCustomers,address) values(?,?,?,?,?,?)",
    [tt, qh, px, loaidiachi, idCustomers, address],
    (err, result) => {
      if (err) {
        return res.status(500).send("lỗi CMNR");
      }
      return res.status(200).send("oke");
    }
  );
};
const checkAddressCustomer = (req, res) => {
  const { idCustomer } = req.body;

  if (!idCustomer) {
    return res.status(400).send("Customer ID is required");
  }

  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.addressGetPro WHERE idCustomers = ?",
    [idCustomer],
    (err, result) => {
      if (err) {
        return res.status(500).send("Database query error");
      }

      if (result.length === 0) {
        return res.status(404).send("Customer address not found");
      }

      return res.status(200).json(result);
    }
  );
};
let updateInforCustomer = (req, res) => {
  const {
    idCustomers,
    imageUser,
    nameCustomers,
    phoneNumber,
    emailUser,
    dateOB,
  } = req.body;

  pool.query(
    "UPDATE psomwqdghosting_sendo.customers SET imageUser = ?, nameCustomers = ?, phoneNumber = ?, emailUser = ?, dateOB = ? WHERE idCustomers = ?",
    [imageUser, nameCustomers, phoneNumber, emailUser, dateOB, idCustomers],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send(err);
      }
      return res.status(200).send("oke");
    }
  );
};

module.exports = {
  getCustomer,
  getAddressCustomer,
  addAddressCustomers,
  checkAddressCustomer,
  getCustomerId,
  signIn,
  updateInforCustomer,
  updatePassword,
};
