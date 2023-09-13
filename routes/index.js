var express = require('express');
var router = express.Router();
var db=require('../models/database');


router.get("/", (req, res) => {
    let sqlLoai = "SELECT id, name FROM category"; // Thay đổi truy vấn lấy danh sách category
    db.query(sqlLoai, (err, listLoai) => {
        if (err) throw err;
        let sqlDh = "SELECT id, name, url_hinh, price FROM product"; // Vẫn giữ nguyên truy vấn lấy danh sách sách
        db.query(sqlDh, (err, list) => {
            if (err) throw err;
            res.render("index", { loaiDh: listLoai, list: list });
        });
    });
});
router.get("/spmoi", (req, res) => {
    db.query("SELECT * FROM product ORDER BY capnhat DESC LIMIT 0,3",
    (err, data) => {
        if (err) throw new Error(err);
        res.json(data);
    })
});
router.get("/spxemnhieu", (req, res) => {
    db.query("SELECT * FROM product ORDER BY solanxem DESC LIMIT 0,3",
    (err, data) => {
        if (err) throw new Error(err);
        res.json(data);
    })
});
router.get("/sphot", (req, res) => {
    db.query("SELECT * FROM product WHERE hot=1 ORDER BY capnhat DESC LIMIT 0,3",
    (err, data) => {
        if (err) throw new Error(err);
        res.json(data);
    })
});
router.get("/watch/:watchId", (req, res) => {
    let watchId = req.params.watchId;
    let sql = `SELECT * FROM product WHERE id = ${watchId}`;
    db.query(sql, (err, watch) => {
        if (err) throw err;
        res.render("pro_detail", { watch: watch[0] });
    });
});

router.get("/cat/:cateId",(req,res)=>{
    let id = req.params.cateId;
    let sql = `select * from category`; 
    let sqlDh = `select * from product WHERE id_cate=${id}`; 
    db.query(sql, function(err, listLoai) { 
        db.query(sqlDh, function(err, list) { 
            if (err) throw err; 
            res.render('shop',{loaiDh:listLoai, list:list});
        });
    });
})


module.exports = router;