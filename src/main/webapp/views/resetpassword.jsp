<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Reset Password</title>

<!-- Bootstrap CSS for styling -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Custom CSS -->
<style>
body {
	background-color: #f0f2f5;
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
}

.reset-password-container {
	max-width: 400px;
	margin: 100px auto;
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.reset-password-container h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

.form-group label {
	font-weight: bold;
	color: #555;
}

.form-control {
	border-radius: 5px;
	border: 1px solid #ddd;
	padding: 10px;
}

.form-control:focus {
	border-color: #007bff;
	box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
	padding: 12px;
	font-size: 16px;
	width: 100%; /* Make button full-width */
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.back-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	font-size: 0.9em;
}

.back-link a {
	color: #007bff;
	text-decoration: none;
}

.back-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">
		<div class="reset-password-container">
			<h2>Reset Password</h2>
			<form action="${pageContext.request.contextPath}/resetpassword"
				method="post">
				<div class="form-group">
					<label for="username">Username</label>
					<!-- Hiển thị username từ form 1 (readonly) -->
					<input type="text" class="form-control" id="username"
						name="username" value="${username}" readonly>
				</div>
				<div class="form-group">
					<label for="newpassword">New Password</label> <input
						type="password" class="form-control" id="newpassword"
						name="newPassword" required placeholder="Enter new password">
				</div>
				<div class="form-group">
					<label for="confirmNewPassword">Confirm New Password</label> <input
						type="password" class="form-control" id="confirmNewPassword"
						name="confirmNewPassword" required
						placeholder="Confirm new password">
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Submit</button>
				</div>
			</form>
			<div class="back-link">
				<span><a href="${pageContext.request.contextPath}/login">Back
						to Login</a></span>
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
