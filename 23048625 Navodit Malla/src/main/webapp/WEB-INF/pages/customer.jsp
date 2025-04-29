<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
    <title>Global Shipping | Home</title>
    <link rel="stylesheet" href="css/style2.css">
    <style>
        .profile-area {
            display: flex;
            align-items: center;
            gap: 10px;
            background-color: #2a273c;
            padding: 8px 15px;
            border-radius: 20px;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .profile-area:hover {
            background-color: #3a3750;
        }
        .profile-icon {
            width: 30px;
            height: 30px;
            background-color: #f7ac70;
            border-radius: 50%;
            display: flex;
            justify-content: center;
            align-items: center;
            font-weight: bold;
            color: #222132;
            font-size: 1rem;
        }
        .username-text {
            color: #fefefe;
            font-weight: bold;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <!-- Top Navigation Bar -->
    <nav class="top-nav">
        <div class="container">
            <ul class="nav-links">
                <li><a href="#">Personal</a></li>
                <li><a href="#">Business</a></li>
                <li><a href="#">Enterprise</a></li>
                <li>
                    <a href="profile" style="text-decoration: none;">
    				<div class="profile-area">
        			<div class="profile-icon"><%= username.substring(0,1).toUpperCase() %></div>
       			 	<div class="username-text"><%= username %></div>
    				</div>
					</a>


                </li>
            </ul>
        </div>
    </nav>

    <!-- Main Header with Logo -->
    <header class="main-header">
        <div class="container">
            <div class="logo">
                <a href="customer">Global Shipping</a>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="#">Shipping</a></li>
                    <li><a href="#">Tracking</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Support</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Hero Banner -->
    <section class="hero-banner">
        <div class="container">
            <h1>Welcome to Global Shipping</h1>
            <p>Fast, reliable shipping services worldwide</p>
            <a href="register" class="cta-button">Get Started</a>
        </div>
    </section>
    <!-- The rest of your page content remains the same -->
