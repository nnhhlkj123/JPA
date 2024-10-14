<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<form action="<c:url value="/admin/user/insert"/>" method="post"
	enctype="multipart/form-data">
	<label for="email">Email:</label><br> <input type="email"
		id="email" name="email" required><br> <label
		for="userName">User Name:</label><br> <input type="text"
		id="userName" name="userName" required><br> <label
		for="fullName">Full Name:</label><br> <input type="text"
		id="fullName" name="fullName"><br> <label for="password">Password:</label><br>
	<input type="password" id="password" name="password" required><br>

	<label for="phone">Phone:</label><br> <input type="text"
		id="phone" name="phone"><br> <label for="roleid">Role:</label><br>
	<input type="number" id="roleid" name="roleid" min="1"><br>

	<label for="avatar">Upload Avatar:</label><br> <input type="file"
		id="avatar" name="avatar"><br> <br> <input
		type="submit" value="Insert">
</form>
