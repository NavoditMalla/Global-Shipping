<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <div class="container">
        <div class="left-pane">
            <div>
                <h1>Hello, New User!</h1>
                <p>Register below to get started.</p>
            </div>
        </div>
        <div class="right-pane">
            <h2>Registration Form</h2>
            <% String errorMessage = (String) request.getAttribute("error");
    String successMessage = (String) request.getAttribute("success");
    if(errorMessage != null && !errorMessage.isEmpty()) {
    	out.println("<p class=\"error-message\">"+ errorMessage + "</p>");
    }
    if(successMessage != null && !successMessage.isEmpty()){
    	%>
    	<p class="success-message"><%=successMessage%></p>
    	<%
    }%>
            <form action="register" method="post" enctype="multipart/form-data">
                <div class="form-group">
                <div>
            	<label for="id">ID:</label>
            	<input type="text" id="id" name="id" required>
        		</div>
                    <label for="firstname">First Name:</label>
                    <input type="text" id="firstname" name="firstname" required>
                </div>

                <div class="form-group">
                    <label for="lastname">Last Name:</label>
                    <input type="text" id="lastname" name="lastname" required>
                </div>

                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" required>
                </div>

                <div class="form-group">
                    <label for="birthday">Birthday:</label>
                    <input type="date" id="dob" name="dob" required>
                </div>

                <div class="form-group">
                    <label for="gender">Gender:</label>
                    <select id="gender" name="gender">
                        <option value="male">Male</option>
                        <option value="female">Female</option>
                        <option value="other">Other</option>
                    </select>
                </div>

                <div class="form-group">
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required>
                </div>

                <div class="form-group">
                    <label for="phone">Phone Number:</label>
                    <input type="tel" id="phone" name="phone" required>
                </div>

                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required>
                </div>

                <div class="form-group">
                    <label for="confirm-password">Retype Password:</label>
                    <input type="password" id="retypePassword" name="retypePassword" required>
                </div>
                <div class="form-group">
    				<label for="image">Profile Image:</label>
    				<input type="file" id="image" name="image" accept="image/*">
				</div>

                <input type="submit" value="Register">
            </form>
        </div>
    </div>
</body>
</html>
