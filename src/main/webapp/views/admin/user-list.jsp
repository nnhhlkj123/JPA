<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<a href="<c:url value="/admin/user/add"/>">Add User</a>
<br>
<hr>
<table border="1" width="100%">
	<tr>
		<th>STT</th>
		<th>Avatar</th>
		<th>UserID</th>
		<th>Email</th>
		<th>UserName</th>
		<th>FullName</th>
		<th>Phone</th>
		<th>RoleID</th>
		<th>Created Date</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listUser}" var="user" varStatus="STT">
		<tr>
			<td>${STT.index + 1}</td>
			<c:url value="/image?fname=${user.avatar}" var="imgUrl"></c:url>
			<td><img height="100" width="100" src="${imgUrl}" /></td>
			<td>${user.id}</td>
			<td>${user.email}</td>
			<td>${user.userName}</td>
			<td>${user.fullName}</td>
			<td>${user.phone}</td>
			<td>${user.roleid}</td>
			<td>${user.createdDate}</td>
			<td><a href="<c:url value='/admin/user/edit?id=${user.id}'/>">Edit</a>
				| <a href="<c:url value='/admin/user/delete?id=${user.id}'/>">Delete</a>
			</td>
		</tr>
	</c:forEach>
</table>
