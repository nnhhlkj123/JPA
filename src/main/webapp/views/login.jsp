<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Login</title>

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

.login-container {
	max-width: 400px;
	margin: 100px auto;
	padding: 30px;
	border: 1px solid #ddd;
	border-radius: 10px;
	background-color: #ffffff;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

.login-container h2 {
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

.register-link {
	display: block;
	text-align: center;
	margin-top: 20px;
	font-size: 0.9em;
}

.register-link a {
	color: #007bff;
	text-decoration: none;
}

.register-link a:hover {
	text-decoration: underline;
}

.form-check {
	position: relative;
	display: flex;
	align-items: center;
	margin-bottom: 10px; /* Add spacing between checkbox and button */
	color: #555;
	cursor: pointer;
}

.form-check-input {
	position: absolute;
	opacity: 0;
	cursor: pointer;
	height: 0;
	width: 0;
}

.form-check-label {
	display: flex;
	align-items: center;
	margin-bottom: 0;
	padding-left: 25px;
	position: relative;
	cursor: pointer;
}

.form-check-label::before {
	content: '';
	position: absolute;
	left: 0;
	top: 50%;
	transform: translateY(-50%);
	width: 18px;
	height: 18px;
	border: 1px solid #ddd;
	border-radius: 3px;
	background-color: #fff;
	transition: background-color 0.3s, border-color 0.3s;
	display: flex;
	align-items: center;
	justify-content: center;
}

.form-check-input:checked+.form-check-label::before {
	background-color: #007bff;
	border-color: #007bff;
}

.form-check-label::after {
	content: '✓'; /* Checkmark symbol */
	color: white;
	font-size: 14px;
	position: absolute;
	left: 4px; /* Center the checkmark */
	top: 50%;
	transform: translateY(-50%) scale(0);
	transition: transform 0.3s ease-in-out;
}

.form-check-input:checked+.form-check-label::after {
	transform: translateY(-50%) scale(1);
}
</style>
</head>
<body>

	<div class="container">
		<div class="login-container">
			<h2>Login</h2>
			<form action="${pageContext.request.contextPath}/login" method="post">
				<div class="form-group">
					<label for="username">Username</label> <input type="text"
						class="form-control" id="username" name="username" required
						placeholder="Enter your username">
				</div>
				<div class="form-group">
					<label for="password">Password</label> <input type="password"
						class="form-control" id="password" name="password" required
						placeholder="Enter your password">
				</div>

				<div class="form-group">
					<input type="checkbox" class="form-check-input" id="rememberMe">
					<label class="form-check-label" for="rememberMe">Remember
						Me</label>
				</div>
				<div class="form-group">
					<button type="submit" class="btn btn-primary">Login</button>
				</div>
			</form>
			<div class="register-link">
				<span>Don't have an account? <a
					href="${pageContext.request.contextPath}/register">Register
						here</a></span>
			</div>
			<div class="register-link">
				<span><a
					href="${pageContext.request.contextPath}/forgotpassword">Forgot
						Password?</a></span>
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
