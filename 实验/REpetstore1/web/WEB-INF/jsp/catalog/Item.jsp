<%@ include file="../common/IncludeTop.jsp"%>

<div id="BackLink">
	<a href="viewProduct?productId=${sessionScope.product.productId}">Return to ${sessionScope.product.productId}</a>
</div>

<div id="Catalog">

<table>
	<tr>
		<td align="center"class="img-thumbnail" style="color: #4da9bc">${sessionScope.item.descn}</td>
	</tr>

	<%--<img src="/wp-content/uploads/2014/06/download.png" >--%>


	<tr>
		<td><b> ${sessionScope.item.itemId} </b></td>
	</tr>

	<tr>
		<td>${sessionScope.item.name}</td>
	</tr>

	<tr>
		<td>
			<c:if test="${sessionScope.item.quantity <= 0}">Back ordered.</c:if>
			<c:if test="${sessionScope.item.quantity > 0}">${sessionScope.item.quantity} in stock.</c:if>
		</td>
	</tr>

	<tr>
		<td><fmt:formatNumber value="${sessionScope.item.listPrice}" pattern="$#,##0.00" /></td>
	</tr>

	<tr>
		<td>
			<a class="Button" href="addItemToCart?workingItemId=${item.itemId}">Add to Cast</a>
		</td>
	</tr>
</table>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>



