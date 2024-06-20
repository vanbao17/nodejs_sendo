const pool = require("../configs/connectDB");
let getCustomer = (req, res) => {
  let value = req.body;
  pool.query(
    "SELECT * FROM sendo.customers where phoneNumber=?",
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
module.exports = {
  getCustomer,
};
