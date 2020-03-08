//XMLHttpRequest 对象
var xmlHttpRequest;
function createXMLHttpRequest()
{
    if (window.XMLHttpRequest) //非IE浏览器
    {
        xmlHttpRequest = new XMLHttpRequest();
    }
    else if (window.ActiveObject)//IE6以上版本的IE浏览器
    {
        xmlHttpRequest = new ActiveObject("Msxml2.XMLHTTP");
    }
    else //IE6及以下版本IE浏览器
    {
        xmlHttpRequest = new ActiveObject("Microsoft.XMLHTTP");
    }
}

//用户名是否存在
function usernameIsExist() {
    var username = document.registerForm.username.value;
    sendRequest("usernameIsExistServlet?username=" + username);
}

//url:是servlet的注册名（你用哪一个servlet处理当前数据就写哪一个servlet）
function sendRequest(url) {
    createXMLHttpRequest();

    //如需将请求发送到服务器，我们使用 XMLHttpRequest 对象的 open() 和 send() 方法
    xmlHttpRequest.open("GET", url, true);
    xmlHttpRequest.onreadystatechange = processResponse;
    xmlHttpRequest.send(null);
}

function processResponse() {
    if (xmlHttpRequest.readyState == 4) {
        if (xmlHttpRequest.status == 200)
        {
            var responseInfo = xmlHttpRequest.responseXML.getElementsByTagName("msg")[0].firstChild.data;

            var div1 = document.getElementById('usernameMsg');

            if (responseInfo == "Exist") {
                div1.innerHTML = "<font color='red'>用户名已存在</font>";
            } else {
                div1.innerHTML = "<font color='green'>用户名可用</font>";
            }
        }
    }
}
