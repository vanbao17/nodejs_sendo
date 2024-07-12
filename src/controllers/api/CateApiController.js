const axios = require("axios");
const pool = require("../../configs/connectDB");
async function fetchData(req, res) {
  try {
    const danhmuc1 = await axios.get(
      "https://sdvanbao17.id.vn/api/v1/danhmuc1"
    );
    const danhmuc2 = await axios.get(
      "https://sdvanbao17.id.vn/api/v1/danhmuc2"
    );
    const danhmuc3 = await axios.get(
      "https://sdvanbao17.id.vn/api/v1/danhmuc3"
    );
    const dm1 = danhmuc1.data;
    const dm2 = danhmuc2.data;
    const dm3 = danhmuc3.data;

    // Render template and pass data to client
    res.render("index", {
      title: "Hello from EJS in Node.js",
      message: "Welcome to EJS!",
      dm1,
      dm2,
      dm3,
    });
  } catch (error) {
    console.error("Error fetching data:", error);
    res.status(500).send("Error fetching data");
  }
}

function addDanhMuc1(req, res) {
  const { namedm1 } = req.body;
  pool.query(
    "insert into danhmuc1(tendm1) values(?)",
    [namedm1],
    (err, result) => {
      if (err) {
        return res.status(500).send("Error fetching data");
      }
      fetchData(req, res);
    }
  );
}
function addDanhMuc2(req, res) {
  const { namedm2, madm1 } = req.body;
  pool.query(
    "insert into danhmuc2(tendm2,madm1) values(?,?)",
    [namedm2, madm1],
    (err, result) => {
      if (err) {
        return res.status(500).send("Error fetching data");
      }
      fetchData(req, res);
    }
  );
}
module.exports = { fetchData, addDanhMuc1, addDanhMuc2 };
