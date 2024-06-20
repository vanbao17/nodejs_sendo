const pool = require("../configs/connectDB");
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
let getAllAttributeValues = (req, res) => {
  let data = req.params.id;
  pool.query(
    "select * from sendo.Attribute_Values as av, sendo.Attributes as a where av.attribute_id = a.attribute_id ; ",
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
  getCateFive,
  getDanhMuc3WithDm2,
  getDanhMuc3All,
  getDanhMuc2Detail,
  getDanhMuc2All,
  getDanhMuc1,
  getCateFindPage,
  getAttributeValues,
  getAllAttributeValues,
};
