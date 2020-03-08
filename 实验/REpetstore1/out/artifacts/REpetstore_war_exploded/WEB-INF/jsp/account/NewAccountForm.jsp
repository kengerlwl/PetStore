<%@ include file="../common/IncludeTop.jsp"%>



<div id="Catalog">

<form action="newAccount" method="post" name="registerForm">
	<h3>User Information</h3>

	<table>
		<tr>
			<td>User ID:</td>
			<%--//onblur="usernameIsExist()选项--%>
			<%--判断用户名是否有重复的，用了js--%>
			<td><input type="text" name="username" id="username"  onblur="usernameIsExist();"/></td>
			<div id="usernameMsg"></div>
			<script type="text/javascript" src="${pageContext.request.contextPath }/js/register.js"></script>
		</tr>


		<tr>
			<td>New password:</td>
			<td><input type="password" name="password" /></td>
		</tr>


		<tr>
			<td>Repeat password:</td>
			<td><input type="text" name="repeatedPassword" /></td>
		</tr>



		<tr>
			<td>check code:</td>
			<td><input id="code" name="code" type="text"></td>
			<td><img src="validateCode" id="imgObj" alt="check code"  onclick="this.src=this.src+'?'+Math.random()"></td>
		</tr>


	</table>

	<%@ include file="IncludeAccountFields.jsp"%>

	<input type="submit" name="newAccount" value="Save Account Information" />
</form>

</div>

<%@ include file="../common/IncludeBottom.jsp"%>
<script>


</script>