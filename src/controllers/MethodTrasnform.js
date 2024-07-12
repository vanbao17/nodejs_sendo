const pool = require("../configs/connectDB");
let getTransformCate = (req, res) => {
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.delivery_methods; ",
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getTransformWithCate = (req, res) => {
  const { attribute_value_id, idProduct } = req.body;
  pool.query(
    "SELECT * FROM   psomwqdghosting_sendo.valuesAttr_product as vlp, psomwqdghosting_sendo.delivery_methods as dlm where vlp.attribute_value_id=? and  vlp.attribute_value_id=dlm.id and vlp.idProduct=?;",
    [attribute_value_id, idProduct],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getTransformOptions = (req, res) => {
  const { delivery_method_id } = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.delivery_options as a where a.delivery_method_id=?;",
    [delivery_method_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  getTransformCate,
  getTransformWithCate,
  getTransformOptions,
};
