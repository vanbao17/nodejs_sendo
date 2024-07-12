const pool = require("../configs/connectDB");
let addValueAttrProduct = (req, res) => {
  const { idProduct, dataDetail } = req.body;
  dataDetail.forEach((element) => {
    if (!Array.isArray(element)) {
      pool.query(
        "insert into psomwqdghosting_sendo.valuesAttr_product(idProduct,attribute_value_id) values(?,?)",
        [idProduct, element],
        (err, result) => {
          if (err) {
            console.error("Error executing query:", err);
          }
        }
      );
    } else {
      element.forEach((e) => {
        pool.query(
          "insert into psomwqdghosting_sendo.valuesAttr_product(idProduct,attribute_value_id) values(?,?)",
          [idProduct, e.attribute_value_id],
          (err, result) => {
            if (err) {
              console.error("Error executing query:", err);
            }
          }
        );
      });
    }
  });
  return res.status(200).send("Detail product inserted successfully");
};
let deleteValueAttr = (req, res) => {
  const { idProduct } = req.body;
  let errors = [];

  // Sử dụng Promise.all để đợi tất cả các truy vấn hoàn thành
  Promise.all(
    idProduct.map((item) => {
      return new Promise((resolve, reject) => {
        pool.query(
          "DELETE FROM psomwqdghosting_sendo.valuesAttr_product WHERE idProduct = ?",
          [item],
          (err, result) => {
            if (err) {
              console.error("Error executing query:", err);
              errors.push(
                `Error deleting value attribute for product with id: ${item}`
              );
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
          message: "Some value attributes could not be deleted",
          errors,
        });
      } else {
        return res.status(200).send("Value attributes deleted successfully");
      }
    })
    .catch((error) => {
      console.error("Error executing query:", error);
      return res
        .status(500)
        .send("An error occurred while deleting value attributes");
    });
};
let getColorSize = (req, res) => {
  const id = req.params.id;
  pool.query(
    "select * from psomwqdghosting_sendo.Attribute_Values where attribute_value_id=?",
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
let getFullAttribute = (req, res) => {
  pool.query(
    "select * from psomwqdghosting_sendo.Attribute_Values",
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getAllAttribute = (req, res) => {
  pool.query(
    "select * from psomwqdghosting_sendo.Attributes",
    (err, result) => {
      if (err) {
        console.log(err);
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
let getAttrVaulueProduct = (req, res) => {
  const { idProduct } = req.body;
  pool.query(
    "select * from psomwqdghosting_sendo.valuesAttr_product where idProduct = ?",
    [idProduct],
    (err, result) => {
      if (err) {
        return res.status(500).send("loi cmnr");
      }
      return res.send(JSON.stringify(result));
    }
  );
};
module.exports = {
  addValueAttrProduct,
  deleteValueAttr,
  getColorSize,
  getAttrVaulueProduct,
  getFullAttribute,
  getAllAttribute,
};
