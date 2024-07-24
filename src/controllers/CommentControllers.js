const pool = require("../configs/connectDB");
let getCommentForProduct = (req, res) => {
  const { idProduct } = req.body;
  const query = `SELECT c.nameCustomers,c.idCustomers,p.idProduct,p.nameProduct,cm.idComment,c.imageUser, cm.timePublic, cm.rateCount, c.imageUser, cm.contentComment, cm.imageComment, oi.size, oi.color,o.state
FROM customers AS c
JOIN comments AS cm ON c.idCustomers = cm.idCustomers
JOIN products as p ON p.idProduct = cm.idProduct
JOIN OrderItems AS oi ON p.idProduct  = oi.idProduct
JOIN Orders AS o ON o.id = oi.order_id and o.idCustomers = cm.idCustomers

WHERE oi.idProduct = ? AND o.state = 5;

    `;
  pool.query(query, [idProduct], (err, result) => {
    if (err) {
      res.status(500).send(err);
    }
    return res.send(JSON.stringify(result));
  });
};
let checkStateComment = (req, res) => {
  const { idCustomer, idProduct } = req.body;
  const query = `select c.idCustomers
    from customers as c,products as p, Orders as o,OrderItems as oi
    where c.idCustomers = ? and p.idProduct=? and o.state=5 and o.id = oi.order_id and oi.idProduct = p.idProduct and o.idCustomers = c.idCustomers`;
  pool.query(query, [idCustomer, idProduct], (err, result) => {
    if (err) {
      res.status(500).send(err);
    }
    return res.status(200).send(JSON.stringify(result));
  });
};
let addComment = (req, res) => {
  const { idCustomer, idProduct, contentComment, timePublic, rate, filename } =
    req.body;
  const query = `insert into comments(timePublic,contentComment,imageComment,idProduct,idCustomers,rateCount) values(?,?,?,?,?,?)`;
  pool.query(
    query,
    [timePublic, contentComment, filename, idProduct, idCustomer, rate],
    (err, result) => {
      if (err) {
        res.status(500).send(err);
      }
      return res.status(200).send("oke");
    }
  );
};
let deleteComment = (req, res) => {
  const { idComment } = req.body;
  const query = `delete from comments where idComment=?`;
  pool.query(query, [idComment], (err, result) => {
    if (err) {
      return res.status(500).send(err);
    }
    return res.status(200).send("delete successfully :))");
  });
};
let updateComment = (req, res) => {
  const {
    idCustomer,
    idProduct,
    contentComment,
    timePublic,
    rate,
    filename,
    idComment,
  } = req.body;
  const query = `update comments set timePublic=?,contentComment=?,imageComment=?,idProduct=?,idCustomers=?,rateCount=? where idComment=?`;
  pool.query(
    query,
    [
      timePublic,
      contentComment,
      filename,
      idProduct,
      idCustomer,
      rate,
      idComment,
    ],
    (err, result) => {
      if (err) {
        res.status(500).send(err);
      }
      return res.status(200).send("oke");
    }
  );
};
module.exports = {
  checkStateComment,
  getCommentForProduct,
  addComment,
  deleteComment,
  updateComment,
};
