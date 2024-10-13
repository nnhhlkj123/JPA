<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	Trang chủ của user
	<div>
		<form action="${pageContext.request.contextPath}/logout" method="post">
			<button type="submit">Logout</button>
		</form>
	</div>

	<div>
		<form action="${pageContext.request.contextPath}/movetouploadfile"
			method="POST">
			<button type="submit">Upload File</button>
		</form>
	</div>



</body>
</html>