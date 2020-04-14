var express = require('express');  //引入express模块
var app = express();  //创建express的实例
app.use(express.static('static/cpts_1444_cgx/'));
app.use(express.static('static/html/'));
app.use(express.static('static/user/'));
var session = require('express-session')
const Vue = require('vue')
let a = require('./vueApp.js');

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
        res.send(req.session.account)
      })
    

    app.get('/session_des', function (req, res) {
        req.session.destroy;
        res.send("success");
    })


app.get('/home', function (req, res) {
    const app = a.app;

    const renderer = a.renderer;
  
  
  // 第 3 步：将 Vue 实例渲染为 HTML
  
  renderer.renderToString(app, (err, html) => {
      if (err) {
        res.status(500).end('Internal Server Error')
        return
      }
      res.writeHead(200, {
        "Content-Type": "text/html;charset=utf-8"
    });
      res.end(html)
    })
})    


app.get('/', function (req, res) {
    res.sendFile(__dirname+"/static/test.html");
  })

app.get('/user', function (req, res) {
    res.sendFile(__dirname+"/static/user/user2.html");
  })
app.get('/main',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/index.html")
}
)
app.get('/clasify',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/clasify.html")
}
)
app.get('/kind',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/kind.html")
}
)
app.get('/single',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/single.html")
}
)
app.get('/search',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/search.html")
}
)
app.get('/login',function(req, res){
    res.sendFile(__dirname+"/static/html/index.html")
}
)
app.get('/bill',function(req, res){
    res.sendFile(__dirname+"/static/cpts_1444_cgx/bill.html")
}
)

app.listen(3000,function(){   //监听3000端口
    console.log("Server running at 3000 port");
});

