<%@include file="../common/IncludeTop.jsp"%>

<%--//定义CSS样式，是返回主页面的操作--%>
<div id="BackLink">
    <a href="main">Return to main Menu</a>
</div>

<div id="Catalog">
    <%--//注：${ }中的内容IDEA不能自动打出代码--%>
    <h2>${sessionScope.category.name}</h2>
    <table>
        <tr>
            <th>Product ID</th>
            <th>Name</th>
        </tr>

        <%--注意：items 用于接收集合对象，var 定义对象接收从集合里遍历出的每一个元素,同时其会自动转型--%>
        <c:forEach var="product" items="${sessionScope.productList}">
            <tr>
                <td>
                    <a href="viewProduct?productId=${product.productId}">${product.productId}</a>
                </td>
                
                <td>${product.name}</td>
                
            </tr>
        </c:forEach>
    </table>
</div>

<%@include file="../common/IncludeBottom.jsp"%>