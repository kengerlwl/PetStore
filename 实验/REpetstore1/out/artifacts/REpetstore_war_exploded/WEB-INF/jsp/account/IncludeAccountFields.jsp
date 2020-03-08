<h3>Account Information</h3>

<table>
	<tr>
		<td>First name:</td>
		<td><input type="text"style="border-radius: 9px" name="account.firstName"  value="${sessionScope.account.firstName}"/></td>
	</tr>
	<tr>
		<td>Last name:</td>
		<td><input type="text"style="border-radius: 9px" name="account.lastName" value="${sessionScope.account.lastName}"/></td>
	</tr>
	<tr>
		<td>Email:</td>
		<td><input type="text"style="border-radius: 9px" size="40" name="account.email" value="${sessionScope.account.email}"/></td>
	</tr>
	<tr>
		<td>Phone:</td>
		<td><input type="text"style="border-radius: 9px" name="account.phone" value="${sessionScope.account.phone}"/></td>
	</tr>
	<tr>
		<td>Address 1:</td>
		<td><input type="text"style="border-radius: 9px" size="40" name="account.address1" value="${sessionScope.account.address1}"/></td>
	</tr>
	<tr>
		<td>Address 2:</td>
		<td><input type="text"style="border-radius: 9px" size="40" name="account.address2" value="${sessionScope.account.address2}"/></td>
	</tr>
	<tr>
		<td>City:</td>
		<td><input type="text"style="border-radius: 9px" name="account.city" value="${sessionScope.account.city}"/></td>
	</tr>
	<tr>
		<td>State:</td>
		<td><input type="text"style="border-radius: 9px" size="4" name="account.state" value="${sessionScope.account.state}"/></td>
	</tr>
	<tr>
		<td>Zip:</td>
		<td><input type="text"style="border-radius: 9px" size="10" name="account.zip" value="${sessionScope.account.zip}"/></td>
	</tr>
	<tr>
		<td>Country:</td>
		<td><input type="text"style="border-radius: 9px" size="15" name="account.country" value="${sessionScope.account.country}"/></td>
	</tr>
</table>



<h3>Profile Information</h3>

<table>
	<tr>
		<td>Language Preference:</td>
		<td>
			<select name="account.languagePreference"   >
				<c:forEach var="item" items="${sessionScope.LANGUAGE_LIST}">

					<c:if test="${item == sessionScope.account.languagePreference}">
						<option value="${item}" selected id="multiSelect" multiple>
								${item}
						</option>
					</c:if>
					<c:if test="${item != sessionScope.account.languagePreference}">
						<option value="${item}" >
								${item}
						</option>
					</c:if>

				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>Favourite Category:</td>
		<td>
			<select name="account.favouriteCategoryId">
				<c:forEach var="item" items="${sessionScope.CATEGORY_LIST}">
					<c:if test="${item == sessionScope.account.favouriteCategoryId}">
						<option value="${item}" selected>
								${item}
						</option>
					</c:if>
					<c:if test="${item != sessionScope.account.favouriteCategoryId}">
						<option value="${item}" >
								${item}
						</option>
					</c:if>

				</c:forEach>
			</select>
		</td>
	</tr>
	<tr>
		<td>Enable MyList</td>
		<td><input type="checkbox" name="account.listOption"
			<c:if test="${sessionScope.account.listOption == true}">
				checked value="true"
			</c:if>
			<c:if test="${sessionScope.account.listOption == false}">
				value="false"
			</c:if>
			/>
		</td>
	</tr>
	<tr>
		<td>Enable MyBanner</td>
		<td><input type="checkbox" name="account.bannerOption"
			<c:if test="${sessionScope.account.bannerOption == true}">
				checked value="true"
			</c:if>
			<c:if test="${sessionScope.account.bannerOption == true}">
				value="false"
			</c:if>
			/>
		</td>
	</tr>

</table>
