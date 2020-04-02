var express = require('express');  //引入express模块
var app = express();  //创建express的实例
app.use(express.static('/home/lwl/Study/code/jsvascript/Node/petstore2.0/static/电商家具商城大气网站模板'));
app.use(express.static('static/html/'));

var session = require('express-session')
app.all("*",function(req,res,next){
    //设置允许跨域的域名，*代表允许任意域名跨域
    res.header("Access-Control-Allow-Origin","*");
    //允许的header类型
    res.header("Access-Control-Allow-Headers","content-type");
    //跨域允许的请求方式 
    res.header("Access-Control-Allow-Methods","DELETE,PUT,POST,GET,OPTIONS");
    if (req.method.toLowerCase() == 'options')
        res.send(200);  //让options尝试请求快速结束
    else
        next();
}
)
// 启用 session 中间件
app.use(session({
    secret: 'keyboard cat', // 相当于是一个加密密钥，值可以是任意字符串
    account: false,
    saveUninitialized: false, // 强制没有“初始化”的session保存到storage中
    }))

    app.get('/login_session', function(req, res) {
        var params = req.query;
        console.log(params);
        console.log(req.session);
        req.session.account=params.userid;

        res.send(req.session);

    })

    app.get('/get_session', function (req, res) {

        res.send(req.session.account);
      })
    

    app.get('/session_des', function (req, res) {
        req.session.destroy;
        res.send("success");
    })



    app.get('/login',function(req, res){
      res.sendFile(__dirname+"/static/html/index.html")
  }
    )

    
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