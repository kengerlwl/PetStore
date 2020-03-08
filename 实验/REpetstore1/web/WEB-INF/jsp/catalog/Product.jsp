<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="viewCategory?categoryId=${sessionScope.category.name}">Return to ${sessionScope.category.name} </a>
</div>



<div id="Product">

<h2>product:${sessionScope.product.name}</h2>

<table>
	<tr>
		<th>Item ID</th>
		<th>Product ID</th>
		<th>Description</th>
		<th>List Price</th>
		<th>&nbsp;</th>
	</tr>
	<c:forEach var="item" items="${sessionScope.itemList}">
		<tr>
			<td>
				<a href="viewItem?itemId=${item.itemId}">${item.itemId}</a>
			</td>
			<td>
				${item.productId}
			</td>
			<td>
				${item.name}
			</td>

			<td>
				<fmt:formatNumber value="${item.listPrice}" pattern="$#,##0.00"/>
			</td>


			<td>
				<%--<a class="Button" href="addItemToCart?workingItemId=${item.itemId}">Add to Cart</a>--%>

				<a href="addItemToCart?workingItemId=${item.itemId}" class="btn btn-warning active">
					<span class="glyphicon glyphicon-shopping-cart">
						<%--<a>Add to Cart</a>--%>
					</span>

					<%--<button type="button" class="btn btn-warning btn-xs" > Cart</button>--%>
			</td>
		</tr>
	</c:forEach>
	<tr>
		<td>
		</td>
	</tr>
</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>





