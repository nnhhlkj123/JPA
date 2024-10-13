<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Register</title>
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

.register-container {
	max-width: 500px;
	margin: 80px auto;
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
}

.register-container h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

.form-group label {
	font-weight: bold;
	color: #555;
}

.btn-primary {
	background-color: #007bff;
	border-color: #007bff;
	border-radius: 5px;
	padding: 12px;
	font-size: 16px;
}

.btn-primary:hover {
	background-color: #0056b3;
	border-color: #004085;
}

.login-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	font-size: 0.9em;
	color: #333;
}

.login-link a {
	color: #007bff;
	text-decoration: none;
}

.login-link a:hover {
	text-decoration: underline;
}
</style>
</head>
<body>

	<div class="container">
		<div class="register-container">
			<h2>Register</h2>
			<form action="${pageContext.request.contextPath}/register"
				method="post">

				<div class="form-group">
					<label for="email">Email address</label> <input type="email"
						class="form-control" id="email" name="email" required
						placeholder="Enter your email">
				</div>
				<div class="form-group">
					<label for="userName">Username</label> <input type="text"
						class="form-control" id="username" name="username" required
						placeholder="Enter a username">
				</div>
				<div class="form-group">
					<label for="fullName">Full Name</label> <input type="text"
						class="form-control" id="fullname" name="fullname" required
						placeholder="Enter your full name">
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password" required
						placeholder="Enter your password">
				</div>
				<div class="form-group">
					<label for="confirmPassword">Confirm Password</label> <input
						type="password" class="form-control" id="confirmPassword"
						name="confirmPassword" required
						placeholder="Confirm your password">
				</div>
				<div class="form-group">
					<label for="phone">Phone Number</label> <input type="text"
						class="form-control" id="phone" name="phone" required
						placeholder="Enter your phone number">
				</div>
				<button type="submit" class="btn btn-primary">Register</button>
			</form>
			<div class="login-link">
				<span>Already have an account? <a
					href="${pageContext.request.contextPath}/login">Login here</a></span>
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



