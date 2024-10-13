<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Topbar Example</title>
<!-- Bootstrap CSS for styling -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
.topbar {
	background-color: #343a40;
	padding: 10px 20px;
	border-bottom: 2px solid #495057;
	color: #ffffff;
	position: relative;
}

.container {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

.logo {
	font-weight: bold;
	color: #ffffff;
	font-size: 1.5em;
	text-align: center;
	flex-grow: 1;
}

.topbar-right {
	display: flex;
	align-items: center;
}

.topbar-right .btn {
	margin-left: 10px;
}

.btn-outline-primary, .btn-outline-secondary {
	border: 1px solid #ffffff;
	color: #ffffff;
}

.btn-outline-primary:hover {
	background-color: #007bff;
	border-color: #007bff;
}

.btn-outline-secondary:hover {
	background-color: #6c757d;
	border-color: #6c757d;
}
/* Remove any potential default browser styling or extra elements */
.form-control:focus {
	box-shadow: none;
}
</style>
</head>
<body>
	<!-- Topbar Section -->
	<div class="topbar">
		<div class="container">
			<div class="logo">Your Brand</div>
			<div class="topbar-right">
				<c:choose>
					<c:when test="${sessionScope.account == null}">
						<!-- Show Login and Register Links when Not Logged In -->
						<ul class="list-inline mb-0">
							<li class="list-inline-item"><a
								href="${pageContext.request.contextPath}/login"
								class="btn btn-outline-primary btn-sm">Đăng nhập</a></li>
							<li class="list-inline-item"><a
								href="${pageContext.request.contextPath}/register"
								class="btn btn-outline-secondary btn-sm">Đăng ký</a></li>
						</ul>
					</c:when>
					<c:otherwise>
						<!-- Show nothing when Logged In -->
						<!-- Only the brand text will be visible -->
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>

	<!-- Bootstrap JS and dependencies (Optional for interactive elements) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>



