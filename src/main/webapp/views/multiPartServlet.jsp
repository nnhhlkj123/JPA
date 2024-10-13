<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
</head>
<body>

	<div>Servlet Multipart</div>
	<form action="${pageContext.request.contextPath}/updateUser" method="POST">
        <label for="fullname">FullName:</label>
        <input type="text" id="fullname" name="fullname" value="${fullname}" required>
        
        <label for="phone">Phone:</label>
        <input type="text" id="phone" name="phone" value="${phone}" required>
        
        <button type="submit">Update</button>
    </form>
		<form method="post" action="${pageContext.request.contextPath}/multiPartServlet"
			enctype="multipart/form-data">

			Choose a file: <input type="file" name="multiPartServlet" /> <input
				type="submit" value="Upload" />
	</form>
</body>
</html>