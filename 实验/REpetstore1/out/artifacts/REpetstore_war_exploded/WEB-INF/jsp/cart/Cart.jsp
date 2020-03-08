<%@ include file="../common/IncludeTop.jsp"%>

<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<script type="text/javascript">
    function loadXMLDoc()
    {
        console.log("show the data");
        var xmlhttp;
        if (window.XMLHttpRequest)
        {// code for IE7+, Firefox, Chrome, Opera, Safari
            xmlhttp=new XMLHttpRequest();
        }
        else
        {// code for IE6, IE5
            xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
        }

                $(".item").each(function(){

                    var price = $(this).parent().next().text();
                    var s = price.split("$");
                    price = s[1];

                    var num = $(this).val();

                    var ans = num * price
                    $(this).parent().next().next().html("$" + ans.toFixed(2));

                    xmlhttp.open("GET","/REpetstore_war_exploded/cartS?name="+$(this).attr("name") + "&num=" +$(this).val(),true);
                    xmlhttp.send();
                })
    }

    $("#item").blur(loadXMLDoc());
</script>


<%--<div id="BackLink">--%>
	<%--<a href="main">Return to Main Menu</a>--%>
<%--</div>--%>



<%--<div class="container">--%>
	<%--<div class="row clearfix">--%>
		<%--<div class="col-md-12 column">--%>
			<%--<blockquote class="pull-left">--%>
				<%--&lt;%&ndash;<p>&ndash;%&gt;--%>
					<%--&lt;%&ndash;Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer posuere erat a ante.&ndash;%&gt;--%>
				<%--&lt;%&ndash;</p> &ndash;%&gt;--%>
					<%--<a href="main">Return to Main Menu</a>--%>
				<%--<small>You can turn to the main</small>--%>
			<%--</blockquote>--%>
		<%--</div>--%>
	<%--</div>--%>
<%--</div>--%>


<span class="glyphicon glyphicon-home pull-right" style="color: rgb(0, 0, 0); font-size: 17px; text-shadow: none;">
	<a href="main" style="color: #92a1ba">To Main Menu</a>
</span>









<div id="Catalog">

<div id="Cart">

<h2>Shopping Cart</h2>
	<form action="updateCart" method="post">
		<table>
		<%--<tr>--%>
			<%--<th><b>Item ID</b></th>--%>
			<%--<th><b>Product ID</b></th>--%>
			<%--<th><b>Description</b></th>--%>
			<%--<th><b>In Stock?</b></th>--%>
			<%--<th><b>Quantity</b></th>--%>
			<%--<th><b>List Price</b></th>--%>
			<%--<th><b>Total Cost</b></th>--%>
			<%--<th>&nbsp;</th>--%>
		<%--</tr>--%>

<%--//==========================================================================================================================================--%>

		<c:if test="${sessionScope.cartListSize == 0}">
			<tr>
				<td colspan="8"><b>Your cart is empty.</b></td>
			</tr>
		</c:if>

<%--//==========================================================================================================================================--%>

		<%--<c:forEach var="cartItem" items="${sessionScope.cartList}">--%>
			<%--<tr>--%>
				<%--<td>--%>
					<%--<a href="viewItem?itemId=${cartItem.itemId}">${cartItem.itemId}</a>--%>
				<%--</td>--%>

				<%--<td>--%>
						<%--${cartItem.productId}--%>
				<%--</td>--%>

				<%--<td>${cartItem.name}</td>--%>

				<%--<td>${cartItem.inStock}</td>--%>

				<%--<td>--%>
					<%--<input type="text" id="item" class="item" onblur="loadXMLDoc()" onchange="loadXMLDoc()" onkeyup="loadXMLDoc()" name="${cartItem.itemId}" value="${cartItem.quantity}"/>--%>
				<%--</td>--%>

				<%--<td>--%>
					<%--<fmt:formatNumber value="${cartItem.listPrice}" pattern="$#,##0.00" />--%>
				<%--</td>--%>

				<%--<td>--%>
					<%--<fmt:formatNumber value="${cartItem.total}" pattern="$###0.00" />--%>
				<%--</td>--%>

				<%--<td>--%>
					<%--<a href="removeItemFromCart?workingItemId=${cartItem.itemId}" class="Button" >Remove</a>--%>
				<%--</td>--%>
			<%--</tr>--%>
		<%--</c:forEach>--%>
<%--//==========================================================================================================================================--%>
			<div class="container">
				<div class="row-md-2">
					<div class="col-md-offset-4 col-md-4">
						<table class="table table-striped">
							<thead>
							<tr class="warning">
								<th>
									Item ID
								</th>
								<th>
									Product ID
								</th>
								<th>
									Description
								</th>
								<th>
									In Stock
								</th>

								<th>
									Quantity
								</th>

								<th>
									List Price
								</th>

								<th>
									Total Cost
								</th>

								<th>
									Remove Product
								</th>

							</tr>
							</thead>




							<c:forEach var="cartItem" items="${sessionScope.cartList}">
								<tr class="success">
									<td>
										<a href="viewItem?itemId=${cartItem.itemId}">${cartItem.itemId}</a>
									</td>

									<td>
											${cartItem.productId}
									</td>

									<td>${cartItem.name}</td>

									<td>${cartItem.inStock}</td>

									<td>
										<input type="text" id="item" class="item" onblur="loadXMLDoc()" onchange="loadXMLDoc()" onkeyup="loadXMLDoc()" name="${cartItem.itemId}" value="${cartItem.quantity}"/>
									</td>

									<td>
										<fmt:formatNumber value="${cartItem.listPrice}" pattern="$#,##0.00" />
									</td>

									<td>
										<fmt:formatNumber value="${cartItem.total}" pattern="$###0.00" />
									</td>

									<td>
										<a href="removeItemFromCart?workingItemId=${cartItem.itemId}" class="btn btn-danger active" >Remove</a>
									</td>

									<%--<button type="button" class="btn btn-danger active">危险</button>--%>


								</tr>
							</c:forEach>


							<%--<tbody>--%>
							<%--<tr class="success">--%>
								<%--<td>--%>
									<%--1--%>
								<%--</td>--%>
								<%--<td>--%>
									<%--TB - Monthly--%>
								<%--</td>--%>
								<%--<td>--%>
									<%--01/04/2012--%>
								<%--</td>--%>
								<%--<td>--%>
									<%--Approved--%>
								<%--</td>--%>
							<%--</tr>--%>
							<%--</tbody>--%>

						</table>
						<%--<button class="btn btn-block btn-default btn-success" type="button">按钮</button>--%>
						<%--<tr>--%>
							<%--<a href="viewNewOrderForm">--%>
						<%--<c:if test="${sessionScope.cartListSize > 0}">--%>

								<%--<button class="btn btn-success active">Process to Checkout</button>--%>

						<%--</c:if></a>--%>
						<%--</tr>--%>
						<c:if test="${sessionScope.cartListSize > 0}">
						<a href="viewNewOrderForm" class="btn btn-success active">Process to Checkout</a>
						</c:if>

					</div>
				</div>
			</div>

			<%--<tr>--%>
				<%--<c:if test="${sessionScope.cartListSize > 0}">--%>
					<%--<a href="viewNewOrderForm" class="Button">Process to Checkout</a>--%>
				<%--</c:if>--%>
			<%--</tr>--%>

		<tr>
			<td colspan="7">
				<%--<input type="submit"  value="Update Cart">--%>
			</td>
			<td>&nbsp;</td>
		</tr>
	</table>
	</form>

</div>

<div id="Separator">&nbsp;</div>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>