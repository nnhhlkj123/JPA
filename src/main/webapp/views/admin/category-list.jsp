<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<a href="<c:url value="/admin/category/add"/>">Add Category</a>
<br>

<hr>
<table border="I" width="100%">
	<tr>
		<th>STT</th>
		<th>Images</th>
		<th>CategoryID</th>
		<th>CategoryName</th>
		<th>Status</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listcate}" var="cate" varStatus="STT">
		<tr>
			<td>${STT.index+1 }</td>
			<c:url value="/image?fname=${cate.images}" var="imgUrl"></c:url>
			<td><img height="150" width="200" src="${imgUrl}" /></td>
			<td>${cate.categoryid }</td>
			<td>${cate.categoryname }</td>
			<td>${cate.status}</td>
			<td><a
				href="<c:url value='/admin/category/edit?id=${cate.categoryid}'/>"
				class="center">Sửa</a> | <a
				href="<c:url value='/admin/category/delete?id=${cate.categoryid}'/>"
				class="center">Xóa</a></td>
		</tr>
	</c:forEach>
</table>