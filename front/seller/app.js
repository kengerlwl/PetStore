var express = require('express');  //引入express模块
var app = express();  //创建express的实例
app.use(express.static('/home/lwl/Study/code/jsvascript/Node/petstore2.0/static/电商家具商城大气网站模板'));

  app.get('/seller', function (req, res) {
    res.sendFile(__dirname+"/static/电商家具商城大气网站模板/home.html");
  })


  app.get('/cart', function (req, res) {
    res.sendFile(__dirname+"/static/电商家具商城大气网站模板/cart.html");
  })

  app.get('/additem', function (req, res) {
    res.sendFile(__dirname+"/static/电商家具商城大气网站模板/additem.html");
  })


app.listen(3001,function(){   //监听3000端口
    console.log("Server running at 3001 port");
});