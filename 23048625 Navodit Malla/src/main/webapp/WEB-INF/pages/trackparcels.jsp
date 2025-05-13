<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.islington.model.TrackModel" %>

<%
    List<TrackModel> parcels = (List<TrackModel>) request.getAttribute("parcels");
%>

<html>
<head>
    <title>Manage Parcel Tracking</title>
    <link rel="stylesheet" type="text/css" href="css/style3.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Admin Panel</div>
    <div class="nav-links">
        <a href="managedelivery">Deliveries</a>
        <a href="manageshipment">Shipments</a>
        <a href="trackparcel">Tracking</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="hero-section">
    <h1>Manage Parcel Tracking</h1>
    <p>Add, update, or remove parcel tracking records</p>
</div>

<div class="container">

    <!-- Add Parcel -->
    <form action="trackparcel" method="post" class="form-box">
        <input type="hidden" name="action" value="create">
        <input type="text" name="trackingId" placeholder="Tracking ID" required>
        <input type="text" name="status" placeholder="Status" required>
        <input type="text" name="currentLocation" placeholder="Current Location" required>
        <input type="text" name="lastUpdated" placeholder="Last Updated (YYYY-MM-DD HH:MM:SS)" required>
        <button type="submit">Add Parcel</button>
    </form>

    <!-- Edit Parcel -->
    <h2 style="text-align:center; color: #f7ac70; margin-top: 30px;">Edit Parcel</h2>
    <form action="trackparcel" method="post" class="form-box">
        <input type="hidden" name="action" value="edit">
        <label style="color:#fff;">Select Tracking ID</label>
        <select name="trackingId" required>
            <option value="">-- Select --</option>
            <%
                if (parcels != null) {
                    for (TrackModel p : parcels) {
            %>
            <option value="<%= p.getTrackingId() %>"><%= p.getTrackingId() %></option>
            <%
                    }
                }
            %>
        </select>
        <input type="text" name="status" placeholder="New Status" required>
        <input type="text" name="currentLocation" placeholder="New Location" required>
        <input type="text" name="lastUpdated" placeholder="New Timestamp (YYYY-MM-DD HH:MM:SS)" required>
        <button type="submit">Update Parcel</button>
    </form>

    <!-- Table -->
    <table class="styled-table">
        <thead>
            <tr>
                <th>Tracking ID</th>
                <th>Status</th>
                <th>Current Location</th>
                <th>Last Updated</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (parcels != null) {
                for (TrackModel p : parcels) {
        %>
        <tr>
            <td><%= p.getTrackingId() %></td>
            <td><%= p.getStatus() %></td>
            <td><%= p.getCurrentLocation() %></td>
            <td><%= p.getLastUpdated() %></td>
            <td>
                <form action="trackparcel" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="trackingId" value="<%= p.getTrackingId() %>">
                    <button type="submit">Delete</button>
                </form>
            </td>
        </tr>
        <%
                }
            }
        %>
        </tbody>
    </table>
</div>

<footer class="footer">
    <div class="footer-column">
        <h4>Admin Tools</h4>
        <ul>
            <li><a href="managedelivery">Deliveries</a></li>
            <li><a href="manageshipment">Shipments</a></li>
            <li><a href="trackparcel">Tracking</a></li>
        </ul>
    </div>
    <div class="footer-column">
        <h4>Support</h4>
        <ul>
            <li><a href="#">Contact Tech Team</a></li>
            <li><a href="#">System Status</a></li>
            <li><a href="#">Documentation</a></li>
        </ul>
    </div>
    <div class="footer-bottom">
        &copy; 2025 Global Shipping. Admin Panel.
    </div>
</footer>

</body>
</html>
