const mysql = require("mysql");
const pool = mysql.createConnection({
  host: "localhost",
  user: "root",
  password: "Phamvanbao_0123",
  database: "sendo",
  insecureAuth: true,
});
pool.connect(function (err) {
  if (err) throw err;
  console.log("Connected!");
});
module.exports = pool;
