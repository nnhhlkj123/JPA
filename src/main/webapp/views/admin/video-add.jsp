<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/commons/taglib.jsp"%>
<form action="<c:url value='/admin/video/insert'/>" method="post" enctype="multipart/form-data">

    <label for="title">Title:</label><br>
    <input type="text" id="title" name="title" required><br>
    
    <label for="description">Description:</label><br>
    <textarea id="description" name="description" rows="4" cols="50"></textarea><br>
    
    <label for="poster">Upload Poster:</label><br>
    <input type="file" id="poster" name="poster" required/><br>
    
    <label for="views">Views:</label><br>
    <input type="number" id="views" name="views" value="0" min="0"><br>
    
    <label for="categoryId">Category:</label><br>
    <select id="categoryId" name="categoryId" required>
        <c:forEach items="${listCategories}" var="category">
            <option value="${category.categoryid}">${category.categoryname}</option>
        </c:forEach>
    </select><br><br>
    
    <input type="submit" value="Add Video">
</form>
