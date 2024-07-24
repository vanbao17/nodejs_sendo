const pool = require("../configs/connectDB");

let getChatUser = (req, res) => {
  const userId = parseInt(req.params.id);
  pool.query(
    "select * from psomwqdghosting_sendo.conversations where idCustomers=?",
    [userId],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getChatIdShop = (req, res) => {
  const userId = parseInt(req.params.id);

  pool.query(
    "select * from psomwqdghosting_sendo.conversations where idShop=?",
    [userId],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let deleteChat = async (req, res) => {
  const { id } = req.body;
  await pool.query(
    "delete from psomwqdghosting_sendo.messages where conversation_id=?",
    [id],
    (err, result) => {
      if (err) {
        console.log(err);
      }
    }
  );
  await pool.query(
    "delete from psomwqdghosting_sendo.conversations where conversation_id=?",
    [id],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.status(200).send("oke");
    }
  );
};
let getChatIdShopCustomer = (req, res) => {
  const { idShop, idCustomer } = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.conversations where idShop=? and idCustomers=?",
    [idShop, idCustomer],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let addChatUser = (req, res) => {
  const { idCustomers, idShop } = req.body;
  const string = `INSERT INTO conversations(idCustomers, idShop) VALUES (?, ?);`;
  pool.query(string, [idCustomers, idShop], (err, result) => {
    if (err) {
      console.log(err);
      return res.status(500).send("loi cmnr");
    }
    return res.status(200).send("oke");
  });
};
let getMessIdConve = (req, res) => {
  const id = parseInt(req.params.id);
  pool.query(
    "select * from psomwqdghosting_sendo.messages where conversation_id=?",
    [id],
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  getChatUser,
  addChatUser,
  getChatIdShop,
  getMessIdConve,
  getChatIdShopCustomer,
  deleteChat,
};
