<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<form action="<c:url value='/admin/video/update'/>" method="post" enctype="multipart/form-data">

    <input type="text" name="videoId" value="${video.videoId}" hidden="hidden">
    
    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" value="${video.title}" required><br>
    
    <label for="description">Description:</label><br>
    <textarea id="description" name="description" rows="4" cols="50">${video.description}</textarea><br>
    
    <label for="poster">Current Poster:</label><br>
    <c:url value="${video.poster}" var="imgUrl"></c:url>
    <img height="150" width="200" src="${imgUrl}" /><br>
    
    <label for="posterUpload">Upload New Poster:</label><br>
    <input type="file" id="posterUpload" name="poster" /><br>
    
    <label for="views">Views:</label><br>
    <input type="number" id="views" name="views" value="${video.views}" min="0"><br>
    
    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId" required>
        <c:forEach items="${listCategories}" var="category">
            <option value="${category.categoryid}" ${category.categoryid == video.categoryId ? 'selected' : ''}>
                ${category.categoryname}
            </option>
        </c:forEach>
    </select><br><br>
    
    <label for="active">Status:</label><br>
    <input type="radio" id="active" name="active" value="true" ${video.active ? 'checked' : ''}> 
    <label for="active">Active</label><br>
    <input type="radio" id="inactive" name="active" value="false" ${!video.active ? 'checked' : ''}> 
    <label for="inactive">Inactive</label><br><br>
    
    <input type="submit" value="Update">
</form>
