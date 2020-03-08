<%@include file="../common/IncludeTop.jsp"%>

<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<body>

<%--反复调试即可*（其实我也不懂）--%>
<div class="container">
<div class="row-md-2">
<div class="col-md-offset-4 col-md-4" >

    <%--<form action="signon" method="post" class="form-signin">--%>
        <form action="signon" method="post" class="form-signin">

            <%--<form class="navbar-form navbar-left" role="search" action="signon" method="post">--%>

        <h2 class="form-signin-heading">Please sign in</h2>


        <label class="sr-only">Put your username</label>
        <input type="text" id="username" name="username" class="form-control" placeholder="Input your username" required autofocus>


        <label for="password" class="sr-only">Put your password</label>
        <input type="password" id="password" name="password" class="form-control" placeholder="Input your Password" required>


        <tr>
            <input type="text" id="code" name="code" class="form-control" placeholder="Input your check code " required autofocus>
            <td><img src="validateCode" id="imgObj" alt="check code" onclick="this.src=this.src+'?'+Math.random()"></td>
        </tr>


        <%--<button class="btn btn-lg btn-primary btn-block" name="" type="submit"></button>--%>
                <%--<a href="signon" --%>

                    <%--<a name="signon"  >Sign in</a>--%>

                <input type="submit"class="btn btn-success active" name="signon" value="Login">
                <a href="viewNewAccount" class="btn btn-warning active">Register</a>

    </form>
</div>
</body> <!-- /container -->
</div>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>

<%--<a href="viewNewAccount">Register Now!</a>--%>

<%--<div class="container">--%>
    <%--<div class="row-md-2">--%>
        <%--<div class="col-md-offset-4 col-md-4" >--%>
            <%--&lt;%&ndash;<a href="viewNewAccount">Register Now!</a>&ndash;%&gt;--%>
            <%--<a href="viewNewAccount"> <button class="btn btn-lg btn-primary btn-block"type="submit">Register Now!</button></a>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</div>--%>




<%--<div id="Catalog">--%>
    <%--<form action="signon" method="post">--%>
        <%--<p>Please enter your username and password.</p>--%>
        <%--<table>--%>
            <%--<tr>--%>
                <%--<td>Username:</td>--%>
                <%--<td><input type="text" name="username"value="j2ee"></td>--%>
                <%--<td></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td>Password:</td>--%>
                <%--<td><input type="password" name="password" value="j2ee"></td>--%>
                <%--<td></td>--%>
            <%--</tr>--%>

            <%--<tr>--%>
                <%--<td>check code:</td>--%>
                <%--<td><input id="code" name="code" type="text"></td>--%>
                <%--<td><img src="validateCode" id="imgObj" alt="check code"  onclick="this.src=this.src+'?'+Math.random()"></td>--%>
            <%--</tr>--%>

            <%--<tr style="text-align: center">--%>
                <%--<td colspan="3" ><input type="submit" name="signon" value="Login"></td>--%>
            <%--</tr>--%>
        <%--</table>--%>
    <%--</form>--%>
    <%--<br>--%>

    <%--Need a user name and password?--%>


<%--</div>--%>


<%@include file="../common/IncludeBottom.jsp"%>
