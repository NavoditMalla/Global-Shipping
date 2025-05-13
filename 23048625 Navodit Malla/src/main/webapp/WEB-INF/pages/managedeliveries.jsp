<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.islington.model.DeliveryModel" %>

<%
    List<DeliveryModel> deliveries = (List<DeliveryModel>) request.getAttribute("deliveries");
%>

<html>
<head>
    <title>Manage Deliveries</title>
    <link rel="stylesheet" type="text/css" href="css/style3.css">
</head>
<body>

<div class="navbar">
    <div class="logo">Admin Panel</div>
    <div class="nav-links">
        <a href="managedelivery">Manage Deliveries</a>
        <a href="manageshipment">Manage Shipments</a>
        <a href="trackparcel">Track Parcels</a>
        <a href="logout">Logout</a>
    </div>
</div>

<div class="hero-section">
    <h1>Manage Deliveries</h1>
    <p>Update, add, or remove delivery records</p>
</div>

<div class="container">
    <!-- Add Delivery Form -->
    <form action="managedelivery" method="post" class="form-box">
        <input type="hidden" name="action" value="create">
        <input type="text" name="deliveryId" placeholder="Delivery ID" required>
        <input type="text" name="driverName" placeholder="Driver Name" required>
        <input type="text" name="route" placeholder="Route" required>
        <input type="text" name="status" placeholder="Status" required>
        <button type="submit">Add Delivery</button>
    </form>

    <!-- Edit Delivery Form -->
    <h2 style="text-align:center; color: #f7ac70; margin-top: 30px;">Edit Delivery</h2>
    <form action="managedelivery" method="post" class="form-box">
        <input type="hidden" name="action" value="edit">

        <label for="editId" style="color:#fff;">Select Delivery ID</label>
        <select name="deliveryId" required>
            <option value="">-- Select --</option>
            <%
                if (deliveries != null) {
                    for (DeliveryModel d : deliveries) {
            %>
            <option value="<%= d.getDeliveryId() %>"><%= d.getDeliveryId() %></option>
            <%
                    }
                }
            %>
        </select>

        <input type="text" name="driverName" placeholder="New Driver Name" required>
        <input type="text" name="route" placeholder="New Route" required>
        <input type="text" name="status" placeholder="New Status" required>

        <button type="submit">Update Delivery</button>
    </form>

    <!-- Deliveries Table -->
    <table class="styled-table">
        <thead>
            <tr>
                <th>Delivery ID</th>
                <th>Driver Name</th>
                <th>Route</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (deliveries != null) {
                for (DeliveryModel d : deliveries) {
        %>
        <tr>
            <td><%= d.getDeliveryId() %></td>
            <td><%= d.getDriverName() %></td>
            <td><%= d.getRoute() %></td>
            <td><%= d.getStatus() %></td>
            <td>
                <form action="managedelivery" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="deliveryId" value="<%= d.getDeliveryId() %>">
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

<!-- Footer -->
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
