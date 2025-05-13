<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Track Your Parcel</title>
    <link rel="stylesheet" type="text/css" href="css/style3.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Parcel Tracker</div>
    <div class="nav-links">
        <a href="customer">Home</a>
        <a href="usertrackparcel">Track Parcel</a>
        <a href="logout">logout</a>
    </div>
</div>

<div class="hero-section">
    <h1>Track Your Parcel</h1>
    <p>Enter your tracking ID to get the latest status</p>
</div>

<div class="container">
    <!-- Tracking Form -->
    <form action="usertrackparcel" method="post" class="form-box">
        <input type="text" name="trackingId" placeholder="Enter Tracking ID" required>
        <input type="hidden" name="action" value="usertrack">
        <button type="submit">Track</button>
    </form>

    <!-- Tracking Results -->
    <div class="form-box" style="margin-top: 20px;">
        <h2 style="text-align:center; color:#f7ac70;">Tracking Information</h2>

        <%
            String trackingId = (String) request.getAttribute("trackingId");
            String status = (String) request.getAttribute("status");
            String location = (String) request.getAttribute("location");
            String updated = (String) request.getAttribute("lastUpdated");

            if (trackingId != null && status != null) {
        %>
            <p><strong>Tracking ID:</strong> <%= trackingId %></p>
            <p><strong>Status:</strong> <%= status %></p>
            <p><strong>Current Location:</strong> <%= location %></p>
            <p><strong>Last Updated:</strong> <%= updated %></p>
        <%
            } else if (trackingId != null) {
        %>
            <p style="color: #f77;">No parcel found for ID: <strong><%= trackingId %></strong></p>
        <%
            }
        %>
    </div>
</div>

<footer class="footer">
    <div class="footer-column">
        <h4>Quick Links</h4>
        <ul>
            <li><a href="home">Home</a></li>
            <li><a href="usertrackparcel">Track Parcel</a></li>
            <li><a href="logout">Logout</a></li>
        </ul>
    </div>
    <div class="footer-column">
        <h4>Support</h4>
        <ul>
            <li><a href="">Help Center</a></li>
            <li><a href="contactus">Contact Us</a></li>
        </ul>
    </div>
    <div class="footer-bottom">
        &copy; 2025 Global Shipping. All Rights Reserved.
    </div>
</footer>

</body>
</html>
