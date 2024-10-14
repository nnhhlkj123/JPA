<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<a href="<c:url value='/admin/video/add'/>">Add Video</a>
<br>
<hr>
<!-- Form tìm kiếm -->
<form action="<c:url value='/admin/videos'/>" method="get">
    <input type="text" name="keyword" placeholder="Search by title or description" required>
    <input type="submit" value="Search">
</form>
<table border="1" width="100%">
	<tr>
		<th>STT</th>
		<th>Poster</th>
		<th>Video ID</th>
		<th>Title</th>
		<th>Description</th>
		<th>Status</th>
		<th>Views</th>
		<th>Action</th>
	</tr>
	<c:forEach items="${listvideo}" var="video" varStatus="STT">
		<tr>
			<td>${STT.index + 1}</td>
			<c:url value="/image?fname=${video.poster}" var="imgUrl"></c:url>
			<td><img height="150" width="200" src="${imgUrl}" /></td>
			<td>${video.videoId}</td>
			<td>${video.title}</td>
			<td>${video.description}</td>
			<td>${video.active ? 'Active' : 'Inactive'}</td>
			<td>${video.views}</td>
			<td><a
				href="<c:url value='/admin/video/edit?id=${video.videoId}'/>"
				class="center">Sửa</a> | <a
				href="<c:url value='/admin/video/delete?id=${video.videoId}'/>"
				class="center">Xóa</a></td>
		</tr>
	</c:forEach>
</table>
