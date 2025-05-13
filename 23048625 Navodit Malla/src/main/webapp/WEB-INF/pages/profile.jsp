<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="jakarta.servlet.http.HttpSession" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        username = "Guest";
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | Global Shipping</title>
    <link rel="stylesheet" href="css/style2.css">
    <style>
        .profile-section {
            padding: 60px 0;
            background-color: #2a273c;
            min-height: 90vh;
        }
        .profile-card {
            background-color: #1e1c2a;
            max-width: 600px;
            margin: 0 auto;
            padding: 40px 30px;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.4);
        }
        .profile-card h2 {
            color: #f7ac70;
            margin-bottom: 20px;
            text-align: center;
        }
        .profile-form .form-row {
            margin-bottom: 20px;
        }
        .profile-form label {
            display: block;
            margin-bottom: 8px;
            color: #fefefe;
            font-weight: bold;
        }
        .profile-form input {
            width: 100%;
            padding: 10px;
            border-radius: 6px;
            border: 1px solid #555;
            background-color: #2a273c;
            color: #fff;
            font-size: 1rem;
        }
        .profile-btn {
            margin-top: 20px;
            width: 100%;
            background-color: #f7ac70;
            color: #222132;
            padding: 12px 0;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        .profile-btn:hover {
            background-color: #e69c60;
        }
		 .alert-success {
		    background-color: #d4edda;
		    color: #155724;
		    padding: 12px 20px;
		    border-radius: 8px;
		    margin-bottom: 20px;
		    text-align: center;
		    font-weight: bold;
		}
		
		.alert-error {
		    background-color: #f8d7da;
		    color: #721c24;
		    padding: 12px 20px;
		    border-radius: 8px;
		    margin-bottom: 20px;
		    text-align: center;
		    font-weight: bold;
		}
    </style>
</head>
<body>

    <!-- Main Header (Same as homepage) -->
    <header class="main-header">
        <div class="container">
            <div class="logo">
                <a href="customer">Global Shipping</a>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="home">Home</a></li>
                    <li><a href="shippingrequest">Shipping</a></li>
                    <li><a href="usertrackparcel">Tracking</a></li>
                    <li><a href="#">Support</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Profile Content -->
    <section class="profile-section">
        <div class="container">
            <div class="profile-card">
                <h2>My Profile</h2>
				<% if (request.getAttribute("success") != null) { %>
				    <div class="alert-success">
				        <%= request.getAttribute("success") %>
				    </div>
				<% } else if (request.getAttribute("error") != null) { %>
				    <div class="alert-error">
				        <%= request.getAttribute("error") %>
				    </div>
				<% } %>
                
                <form class="profile-form" action="profile" method="post">
                    <div class="form-row">
                        <label for="username">Username</label>
                        <input type="text" id="username" name="username" value="<%= username %>" readonly>
                    </div>
                    <div class="form-row">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="your@email.com">
                    </div>
                    <div class="form-row">
                        <label for="phone">Phone Number</label>
                        <input type="text" id="phone" name="phone" placeholder="98XXXXXXXX">
                    </div>
                    <div class="form-row">
                        <label for="password">New Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter new password">
                    </div>

                    <button type="submit" class="profile-btn">Update Profile</button>
                </form>
            </div>
        </div>
    </section>

    <!-- Footer (Same as homepage) -->
    <footer class="main-footer">
        <div class="container">
            <div class="footer-links">
                <div class="footer-column">
                    <h3>Shipping Services</h3>
                    <ul>
                        <li><a href="#">Domestic Shipping</a></li>
                        <li><a href="#">International Shipping</a></li>
                        <li><a href="#">Same Day Delivery</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="#">Contact Us</a></li>
                        <li><a href="#">FAQs</a></li>
                        
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 Global Shipping. All rights reserved.</p>
            </div>
        </div>
    </footer>

</body>
</html>
