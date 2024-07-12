const pool = require("../configs/connectDB");
let addOderProduct = async (req, res) => {
  const {
    idCustomers,
    total_price,
    status,
    payment_method_id,
    address_id,
    transform_method_id,
    transform_option_id,
    idShop,
    order_item,
  } = req.body;

  pool.query(
    "INSERT INTO psomwqdghosting_sendo.Orders (idCustomers, total_price, status, payment_method_id, transform_method_id, transform_option_id, address_id,state,idShop) VALUES (?, ?, ?, ?, ?, ?, ?,?,?);",
    [
      idCustomers,
      total_price,
      status,
      payment_method_id,
      transform_method_id,
      transform_option_id,
      address_id,
      1,
      idShop,
    ],
    (err, result) => {
      if (err) {
        return res.status(500).send("errr");
      }
      const orderId = result.insertId;
      order_item.forEach((i) => {
        pool.query(
          "INSERT INTO psomwqdghosting_sendo.OrderItems (order_id, idProduct, quantity, price) VALUES (?, ?, ?, ?);",
          [orderId, i.idProduct, i.quantity, i.price],
          (err, results) => {
            if (err) {
              return res.status(500).send(err);
            }
          }
        );
      });
      // const orderItemsData = order_item.map(item => []);
      res.send(JSON.stringify(orderId));
    }
  );
};
let getOrderCustomer = (req, res) => {
  const { id } = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.Orders where id=?",
    [id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getOrderShop = (req, res) => {
  const { idShop } = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.Orders where idShop=?",
    [idShop],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getOrderIdCustomer = (req, res) => {
  const { idCustomers, state } = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.Orders AS od WHERE od.idCustomers=?  ",
    [idCustomers, state],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getOrderItems = (req, res) => {
  const { order_id } = req.body;
  pool.query(
    "SELECT * FROM psomwqdghosting_sendo.OrderItems AS od,psomwqdghosting_sendo.shop AS s, psomwqdghosting_sendo.products AS pd WHERE od.order_id=? and pd.idProduct=od.idProduct and s.idShop=pd.idShop ",
    [order_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getOrderIdOrder = (req, res) => {
  const { order_id } = req.body;
  pool.query(
    "SELECT od.id AS order_id, od.*,od.state AS state_payment,  odi.id AS order_item_id, odi.*, pd.idProduct AS product_id, pd.*, ad.id AS address_id, ad.*, s.idShop AS shop_id, s.*, pm.id AS payment_method_id, pm.method_name AS payment_method_name, pm.image AS payment_image, pm.*, dm.id AS delivery_method_id, dm.* FROM psomwqdghosting_sendo.Orders AS od, psomwqdghosting_sendo.OrderItems AS odi, psomwqdghosting_sendo.products AS pd, psomwqdghosting_sendo.addressGetPro AS ad, psomwqdghosting_sendo.shop AS s, psomwqdghosting_sendo.payment_methods AS pm, psomwqdghosting_sendo.delivery_methods AS dm WHERE od.id=? AND od.id=odi.order_id AND odi.idProduct=pd.idProduct AND pd.idShop=s.idShop AND od.payment_method_id=pm.id AND dm.id=od.transform_method_id;",
    [order_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let updateStateOrder = (req, res) => {
  const { order_id, state } = req.body;

  pool.query(
    "UPDATE  psomwqdghosting_sendo.Orders SET state = ? WHERE id = ?; ",
    [state, order_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("err");
      }
      return res.send(JSON.stringify({ order_id, state }));
    }
  );
};
let deleteOrder = (req, res) => {
  const { order_id } = req.body;

  pool.query(
    "DELETE FROM psomwqdghosting_sendo.OrderItems WHERE order_id = ?;",
    [order_id],
    (err, result) => {
      if (err) {
        return res.status(500).send("Error deleting from OrderItems: " + err);
      }

      pool.query(
        "DELETE FROM psomwqdghosting_sendo.Orders WHERE id = ?;",
        [order_id],
        (err, result) => {
          if (err) {
            return res.status(500).send("Error deleting from Orders: " + err);
          }

          return res.status(200).send("Deleted order successfully");
        }
      );
    }
  );
};

module.exports = {
  addOderProduct,
  getOrderCustomer,
  getOrderIdCustomer,
  getOrderIdOrder,
  getOrderItems,
  getOrderShop,
  updateStateOrder,
  deleteOrder,
};
