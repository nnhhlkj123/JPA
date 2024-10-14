<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<form action="<c:url value="/admin/user/update"/>" method="post"
	enctype="multipart/form-data">
	<input type="hidden" name="id" value="${user.id}"> <label
		for="email">Email:</label><br> <input type="email" id="email"
		name="email" value="${user.email}" required><br> <label
		for="userName">User Name:</label><br> <input type="text"
		id="userName" name="userName" value="${user.userName}" required><br>

	<label for="fullName">Full Name:</label><br> <input type="text"
		id="fullName" name="fullName" value="${user.fullName}"><br>

	<label for="phone">Phone:</label><br> <input type="text"
		id="phone" name="phone" value="${user.phone}"><br> <label
		for="roleid">Role:</label><br> <input type="number" id="roleid"
		name="roleid" min="1" value="${user.roleid}"><br>

	<c:url value="${user.avatar}" var="imgUrl"></c:url>
	<img height="100" width="100" src="${imgUrl}" /><br> <label
		for="avatar">Upload New Avatar:</label><br> <input type="file"
		id="avatar" name="avatar"><br> <br> <input
		type="submit" value="Update">
</form>
