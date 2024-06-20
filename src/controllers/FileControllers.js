const pool = require("../configs/connectDB");
function uploadFileImage(req, res) {
  // const fileName = req.file.filename;
  // const sql = "INSERT INTO images_product (filename) VALUES (?)";
  // pool.query(sql, [fileName], (err, result) => {
  //   if (err) {
  //     console.error("Error inserting into MySQL:", err);
  //     return res
  //       .status(500)
  //       .send("Error uploading file and saving to database.");
  //   }
  //   console.log("File inserted into MySQL:", fileName);
  //   res.status(200).send("File uploaded and saved to database.");
  // });
}
module.exports = {
  uploadFileImage,
};
