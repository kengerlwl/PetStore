<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>



<%@ include file="../common/IncludeTop.jsp"%>


<script src="https://cdn.staticfile.org/jquery/1.10.2/jquery.min.js"></script>
<div id="Catalog">
	<form action="viewShippingForm" method="post">
	<table>
		<tr>
			<th colspan=2>Payment Details</th>
		</tr>

		<tr>
			<td>Card Type:</td>

			<td>
				<select name="order.cardType">
					<c:forEach var="item" items="${sessionScope.cardtype}">
						<option value="${item}">
								${item}
						</option>
					</c:forEach>
				</select>
			</td>
		</tr>

		<tr>
			<td>Card Number:</td>
			<td><input type="text" name="order.creditCard" value="6666666666666"/>* Use a fake number!</td>
		</tr>







		<tr>
			<td>Expiry Date (MM/YYYY):</td>
			<td><input type="text" name="order.expiryDate" value="11/11"/></td>
		</tr>
		<tr>
			<th colspan=2>Billing Address</th>
		</tr>

		<tr>
			<td>First name:</td>
			<td><input type="text" name="order.billToFirstName" value="${sessionScope.account.firstName}"/></td>
		</tr>
		<tr>
			<td>Last name:</td>
			<td><input type="text" name="order.billToLastName" value="${sessionScope.account.lastName}"/></td>
		</tr>
		<tr>
			<td>Address 1:</td>
			<td><input type="text" size="40" name="order.billAddress1" value="${sessionScope.account.address1}"/></td>
		</tr>
		<tr>
			<td>Address 2:</td>
			<td><input type="text" size="40" name="order.billAddress2" value="${sessionScope.account.address2}"/></td>
		</tr>
		<tr>
			<td>City:</td>
			<td><input type="text" name="order.billCity" value="${sessionScope.account.city}"/></td>
		</tr>
		<tr>
			<td>State:</td>
			<td><input type="text" size="4" name="order.billState" value="${sessionScope.account.state}"/></td>
		</tr>
		<tr>
			<td>Zip:</td>
			<td><input type="text" size="10" name="order.billZip" value="${sessionScope.account.zip}"/></td>
		</tr>
		<tr>
			<td>Country:</td>
			<td><input type="text" size="15" name="order.billCountry" value="${sessionScope.account.country}"/></td>
		</tr>


		<tr>
			<td colspan="2"><input type="checkbox" name="shippingAddressRequired" >Ship to different address...</td>

		</tr>

	</table>

	<input type="submit" name="newOrder" value="Continue"/>
	</form>
</div>

<%@ include file="../common/IncludeBottom.jsp"%>