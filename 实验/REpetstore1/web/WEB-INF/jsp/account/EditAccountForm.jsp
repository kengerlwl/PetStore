<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>




<%@ include file="../common/IncludeTop.jsp"%>


<div id="Catalog">
    <form action="saveAccount" method="post">
    <h3>User Information</h3>
    <table>
        <tr>
            <td>
                User ID:
            </td>
            <td><input type="text" style="border-radius: 9px" name="username" value="${sessionScope.account.username}" /> </td>
        </tr>

        <tr>
            <td>New password:</td>
            <td><input type="text"style="border-radius: 9px" name="password" /></td>

        </tr>
        <tr>
            <td>Repeat password:</td>
            <td><input type="text"style="border-radius: 9px" name="repeatedPassword" /></td>
        </tr>
    </table>

        <%--<div class="container-fluid">--%>
            <%--<div class="row-fluid">--%>
                <%--<div class="span12">--%>
                    <%--<span class="label">User ID</span>--%>
                    <%--<form class="form-search">--%>
                        <%--<input class="input-medium search-query" type="text" />--%>
                    <%--</form>--%>

                    <%--<span class="label">New password</span>--%>
                    <%--<form class="form-search">--%>
                        <%--<input class="input-medium search-query" type="text" />--%>
                    <%--</form>--%>

                    <%--<span class="label">Repeat password</span>--%>
                    <%--<form class="form-search">--%>
                        <%--<input class="input-medium search-query" type="text" />--%>
                    <%--</form>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>

    <%@ include file="IncludeAccountFields.jsp"%>
        <hr>
        <a href="saveAccount" class="btn btn-success active">Save Account Information</a>

    </form>

    <a href="viewListOrder?username=${sessionScope.account.username}" class="btn btn-warning active">My Orders</a>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>