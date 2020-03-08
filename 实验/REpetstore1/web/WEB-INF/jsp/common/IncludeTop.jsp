<%--下面一句就是一段报头，告诉浏览器，你的文档以HTML格式遵循W3C标准XHTML1.0协议--%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>

<html xmlns="http://www.w3.org/1999/xhtml">

<head>

    <style type="text/css">
        #context1{
            line-height:25px;
            position: fixed;
        }
    </style>


    <meta charset="UTF-8" />
    <meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script src="js/jquery-3.3.1.js"></script>


    <script>
        $(document).ready(function(){

            //
            // function changeBackColor_over(div){
            //     $(div).css("background-color","#CCCCCC");
            // }
            // //鼠标离开内容
            // function changeBackColor_out(div){
            //     $(div).css("background-color","");
            // }
            // //将点击的内容放到搜索框
            // function setSearch_onclick(div){
            //     $(".inputtable").val(div.innerText);
            //     $("#context1").css("display","none");
            // }


            $("#name").keyup(function(){

                console.log("notice！");
                var content=$(this).val();
                //如果当前搜索内容为空，无须进行查询
                if(content==""){
                    $("#context1").css("display","none");
                    return ;
                }
                //由于浏览器的缓存机制 所以我们每次传入一个时间
                var time=new Date().getTime();
                $.ajax({
                    type:"get",
                    //新建一个名为findBooksAjaxServlet的servlet
                    url:"demo",
                    data:{name:content,time:time},
                    success:function(data){
                        console.log(data);
                        //拼接html
                        var res=data.split(",");
                        console.log(res)
                        var html="";
                        for(var i=0;i<res.length;i++){
                            //每一个div还有鼠标移出、移入点击事件
                            html+="&lt;div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>"+res[i]+"</div>";

                        }
                        $("#context1").html(html)

                        console.log($("#context1").innerHTML)
                        //显示为块级元素
                        $("#context1").css("display","block", "width:164px","height:16px");

                    }
                });
            });

            //鼠标移动到内容上




            $("#btn1").click(function(){
                console.log("ashdfjkasd")
                alert("Text: " + $("#test").text());
            });
            $("#btn2").click(function(){
                alert("HTML: " + $("#test").html());
            });
        });
    </script>


    <link rel="StyleSheet" href="css/jpetstore.css" type="text/css"
          media="screen" />

    <meta name="generator" content="HTML Tidy for Linux/x86 (vers 1st November 2002), see www.w3.org" />
    <title>MyPetStore</title>
    <meta content="text/html; charset=windows-1252" http-equiv="Content-Type" />
    <meta http-equiv="Cache-Control" content="max-age=0" />
    <meta http-equiv="Cache-Control" content="no-cache" />
    <meta http-equiv="expires" content="0" />
    <meta http-equiv="Expires" content="Tue, 01 Jan 1980 1:00:00 GMT" />
    <meta http-equiv="Pragma" content="no-cache" />
</head>

<body>

<div id="Header">

    <div id="Logo">
        <div id="LogoContent">
            <a href="main"><img src="images/logo-topbar.png" /></a>
        </div>
    </div>


    <div id="Menu">
        <div id="MenuContent">
            <a href="viewCart">
                <%--<img align="middle" name="img_cart" src="images/cart.gif" />--%>
                <button type="button" class="btn btn-warning btn-xs" ><span class="glyphicon glyphicon-shopping-cart"></span> Cart</button>
            </a>

            <img align="middle" src="images/separator.gif" />
            <c:if test="${sessionScope.account == null}">
                <%--<a href="viewSignon">Sign In</a>--%>
                <a href="viewSignon">
                    <%--<span class="glyphicon glyphicon-log-in" style="color: rgb(0, 0, 0); font-size: 17px; text-shadow: none;">Log in</span>--%>
                    <button type="button" class="btn btn-success btn-xs" ><span class="glyphicon glyphicon-log-in"></span> Log in</button>
                </a>
            </c:if>

            <c:if test="${sessionScope.account != null}">
                <%--<a href="signout">Sign Out</a>--%>
                <a href="signout">
                <button type="button" class="btn btn-danger btn-xs" ><span class="glyphicon glyphicon-log-out"></span> Log out</button>
                </a>
            </c:if>
            <img align="middle" src="images/separator.gif" />
            <c:if test="${sessionScope.account != null}">
                <a href="editAccount">
                    <button type="button" class="btn btn-default btn-xs" style="text-shadow: #9E9C9C 5px 3px 3px;"><span class="glyphicon glyphicon-user"></span> User</button>
                </a>
                <img align="middle" src="images/separator.gif" />
            </c:if>

            <!-- 按钮触发模态框 -->
            <button class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal" style="text-shadow: #9E9C9C 5px 3px 3px;">
                <span class="glyphicon glyphicon-exclamation-sign" ></span>
                About
            </button>
            <!-- 模态框（Modal） -->
            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-hidden="true">×
                            </button>
                            <h4 class="modal-title" id="myModalLabel">
                                --About--
                            </h4>
                        </div>
                        <div class="modal-body" style="line-height: normal">
<div style="text-indent: each-line">
    <div style="color: #0f0f0f">
                                Life in modern cities becomes busier.
                                Some people think we cannot raise pets such as cats or dogs. We should spend our time on other things such as work. In my opinion, I think raising pets can relieve our burden of life. Pets such as cats and dogs can bring us more pleasure when we feel lonely, and need a company. Pets can entertain us. Maybe some people think we have no time to raise pets. But raising pets doesn't need a lot of time if we are not too lazy. In fact, raising pets is not complicated. What we have to do to raise them is washing them, taking food to them and so on. Even if they have no use for anything, they will not take you much time or energy.
                                In a word, pets will become our friends. We shouldn't be afraid of spending much time raising them. If you try to raise them, you will find the interest in busy life.
                        </div>
                        </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-danger"
                                    data-dismiss="modal">close
                            </button>
                        </div>
                    </div><!-- /.modal-content -->
                </div><!-- /.modal-dialog -->
            </div><!-- /.modal -->



        </div>
    </div>

    <%--<div id="Search">--%>
        <%--<div id="SearchContent">--%>
            <%--<form action="searchProduct" method="post">--%>
                <%--<input type="text" name="keyword" size="14" class="inputtable" id="name" name="name"/>--%>
                <%--<input type="submit" name="searchProducts" value="Search" />--%>


                <%--<ul id = "context1">--%>

                <%--</ul>--%>
            <%--</form>--%>
        <%--</div>--%>
    <%--</div>--%>



    <div id="Search">
        <div id="SearchContent">
            <form class="navbar-form navbar-left" role="search" action="searchProduct" method="post">
                <div class="form-group">
                    <input type="text" name="keyword" size="14" class="form-control" class id="name" name="name"/>
                </div>


                <button class="btn btn-default" type="submit" name="searchProducts">Submit</button>

                <ul id = "context1"></ul>

            </form>

        </div>
    </div>

    <div id="QuickLinks">
        <a href="viewCategory?categoryId=FISH"><img
                src="images/sm_fish.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=DOGS"><img
                src="images/sm_dogs.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=REPTILES"><img
                src="images/sm_reptiles.gif" /></a>
        <img
                src="images/separator.gif" />
        <a href="viewCategory?categoryId=CATS"><img src="images/sm_cats.gif" /></a> <img src="images/separator.gif" />
        <a href="viewCategory?categoryId=BIRDS"><img src="images/sm_birds.gif" /></a>
    </div>

</div>

<div id="Content">