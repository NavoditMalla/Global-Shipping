<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Shipping Request</title>
    <link rel="stylesheet" type="text/css" href="css/style3.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Parcel Service</div>
    <div class="nav-links">
        <a href="customer">Home</a>
        <a href="usertrackparcel">Track Parcel</a>
        <a href="shippingrequest">Request Shipping</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="hero-section">
    <h1>Shipping Request Form</h1>
    <p>Fill in your package and destination details</p>
</div>

<div class="container">
    <form action="shippingrequest" method="post" class="form-box">
        <input type="text" name="fullName" placeholder="Your Full Name" required>
        <input type="email" name="email" placeholder="Email Address" required>
        <input type="text" name="phone" placeholder="Phone Number" required>
        <input type="text" name="origin" placeholder="Pickup Location" required>
        <input type="text" name="destination" placeholder="Destination Address" required>
        <textarea name="packageDetails" placeholder="Describe your package (size, weight, type)" rows="4" required></textarea>
        <button type="submit">Submit Request</button>
    </form>
</div>

<footer class="footer">
    <div class="footer-column">
        <h4>Links</h4>
        <ul>
            <li><a href="home.jsp">Home</a></li>
            <li><a href="usertrackparcel">Track Parcel</a></li>
            <li><a href="shippingrequest.jsp">Request Shipping</a></li>
        </ul>
    </div>
    <div class="footer-column">
        <h4>Support</h4>
        <ul>
            <li><a href="#">Help Center</a></li>
            <li><a href="#">Contact Us</a></li>
        </ul>
    </div>
    <div class="footer-bottom">
        &copy; 2025 Global Shipping. All Rights Reserved.
    </div>
</footer>

</body>
</html>
