const pool = require("../configs/connectDB");
let getCatePayment = (req, res) => {
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.payment_categories; ",
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getPaymentWithCate = (req, res) => {
  const { category_id } = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.payment_methods where category_id=?;",
    [category_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getPaymentWithId = (req, res) => {
  const { payment_method_id } = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.payment_methods where id=?;",
    [payment_method_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  getCatePayment,
  getPaymentWithCate,
  getPaymentWithId,
};
