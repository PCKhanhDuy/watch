var express = require('express');
var router = express.Router();
var db = require('../models/database');
const bcrypt = require("bcrypt");

router.get('/dangky', function (req, res) {
    res.render("dangky.ejs");
});

router.post('/luu', function (req, res) {
    let u = req.body.username;
    let p = req.body.password;
    let em = req.body.email;
    let ho = req.body.ho;
    let ten = req.body.ten;
    let st = req.body.sothich;

    var salt = bcrypt.genSaltSync(10);
    var pass_mahoa = bcrypt.hashSync(p, salt);

    let user_info = { username: u, password: pass_mahoa, email: em, ho: ho, ten: ten, sothich: st };
    let sql = 'INSERT INTO user SET ?';
    db.query(sql, user_info, (err, result) => {
        if (err) {
            console.log("Lỗi khi đăng ký");
            res.redirect("/users/dangky");
            return;
        }
        console.log("Đăng ký thành công");
        res.render("dangkythanhcong.ejs"); // Trang dangkythanhcong.ejs chứa thông báo đăng ký thành công
    });
});

router.get('/dangnhap', function (req, res) {
    res.render("dangnhap.ejs");
});

router.post('/dangnhap_', async function (req, res) {
  let u = req.body.username;
  let p = req.body.password;
  let sql = 'SELECT * FROM user WHERE username = ?';
  db.query(sql, [u], (err, rows) => {
      if (err) {
          console.log(err);
          res.redirect("/users/dangnhap");
          return;
      }
      if (rows.length <= 0) {
          let errMsg = "Username hoặc mật khẩu không chính xác.";
          res.render("dangnhap.ejs", { error: errMsg });
          return;
      }
      let user = rows[0];
      let pass_fromdb = user.password;
      const bcrypt = require("bcrypt");
      var kq = bcrypt.compareSync(p, pass_fromdb);
      if (kq) {
          console.log("OK");
          var sess = req.session;
          sess.daDangNhap = true;
          sess.username = user.username;
          sess.ho = user.ho;       // Thêm dòng này
          sess.ten = user.ten;     // Thêm dòng này
          sess.sothich = user.sothich; // Thêm dòng này
          if (sess.back) {
              console.log(sess.back);
              res.redirect(sess.back);
          } else {
              res.redirect("/users/download");
          }
      } else {
          let errMsg = "Username hoặc mật khẩu không chính xác.";
          res.render("dangnhap.ejs", { error: errMsg });
      }
  });
});


router.get('/download', function (req, res) {
  if (req.session.daDangNhap) {
      let userInfo = {
          un: req.session.username,
          hoTen: req.session.ho + ' ' + req.session.ten, // Kết hợp họ và tên
          soThich: req.session.sothich
      };
      res.render("download.ejs", userInfo);
  } else {
      req.session.back = "/users/download";
      res.redirect("/users/dangnhap");
  }
});

router.get('/thoat', function (req, res) {
    req.session.destroy();
    res.redirect("/users/dangnhap");
});

router.get('/doimatkhau', function (req, res) {
    if (req.session.daDangNhap) {
        res.render("doimatkhau.ejs");
    }
    else {
        req.session.back = "/users/doimatkhau";
        res.redirect("/users/dangnhap");
    }
});

router.post('/doimatkhau', async function (req, res) {
    if (!req.session.daDangNhap) {
        res.redirect("/users/dangnhap");
        return;
    }

    let u = req.session.username;
    let oldPass = req.body.oldPassword;
    let newPass = req.body.newPassword;
    let confirmNewPass = req.body.confirmNewPassword;

    let sql = 'SELECT * FROM user WHERE username = ?';
    db.query(sql, [u], async (err, rows) => {
        if (err || rows.length <= 0) {
            console.log("Lỗi khi tải thông tin người dùng");
            res.redirect("/users/doimatkhau");
            return;
        }

        let user = rows[0];
        let pass_fromdb = user.password;
        const bcrypt = require("bcrypt");
        var isPasswordCorrect = bcrypt.compareSync(oldPass, pass_fromdb);

        if (!isPasswordCorrect) {
            let errMsg = "Mật khẩu cũ không đúng";
            res.render("doimatkhau.ejs", { error: errMsg });
            return;
        }

        if (newPass !== confirmNewPass) {
            let errMsg = "Xác nhận mật khẩu mới không khớp";
            res.render("doimatkhau.ejs", { error: errMsg });
            return;
        }

        var salt = bcrypt.genSaltSync(10);
        var newPassHash = bcrypt.hashSync(newPass, salt);

        let updateSql = 'UPDATE user SET password = ? WHERE username = ?';
        db.query(updateSql, [newPassHash, u], (err, result) => {
            if (err) {
                console.log("Lỗi khi cập nhật mật khẩu mới");
                res.redirect("/users/doimatkhau");
                return;
            }

            console.log("Đổi mật khẩu thành công");
            res.redirect("/users/download");
        });
    });
});
// Thêm route để hiển thị trang quên mật khẩu


module.exports = router;
