<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login</title>
<link rel="stylesheet" type="text/css" 
href="${pageContext.request.contextPath}/css/style.css"/>
</head>
<body>
    <div class="container">
        <div class="left-pane">
    <div>
        <h1>Welcome Back!</h1>
        <p>Access your dashboard and stay connected.</p>
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
    </div>
</div>
        <div class="right-pane">
            <h2>Login</h2>
            <form action="login" method="post">
                <label for="username">Username:</label><br>
                <input type="text" id="username" name="username"><br>

                <label for="password">Password:</label><br>
                <input type="password" id="password" name="password"><br><br>

                <div class="form-actions">
    <input type="submit" value="Login">
<a href="register" class="register-link">Register</a>
</div>

            </form>
        </div>
    </div>
</body>
</html>
