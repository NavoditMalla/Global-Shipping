<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.islington.model.ShipmentModel" %>

<%
    List<ShipmentModel> shipments = (List<ShipmentModel>) request.getAttribute("shipments");
%>

<html>
<head>
    <title>Manage Shipments</title>
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
    <h1>Manage Shipments</h1>
    <p>Update, add, or remove shipment records</p>
</div>

<div class="container">

    <!-- Add Shipment -->
    <form action="manageshipment" method="post" class="form-box">
        <input type="hidden" name="action" value="create">
        <input type="text" name="shipmentId" placeholder="Shipment ID" required>
        <input type="text" name="origin" placeholder="Origin" required>
        <input type="text" name="destination" placeholder="Destination" required>
        <input type="text" name="status" placeholder="Status" required>
        <button type="submit">Add Shipment</button>
    </form>

    <!-- Edit Shipment -->
    <h2 style="text-align:center; color: #f7ac70; margin-top: 30px;">Edit Shipment</h2>
    <form action="manageshipment" method="post" class="form-box">
        <input type="hidden" name="action" value="edit">

        <label for="shipmentId" style="color:#fff;">Select Shipment ID</label>
        <select name="shipmentId" required>
            <option value="">-- Select --</option>
            <%
                if (shipments != null) {
                    for (ShipmentModel s : shipments) {
            %>
            <option value="<%= s.getShipmentId() %>"><%= s.getShipmentId() %></option>
            <%
                    }
                }
            %>
        </select>

        <input type="text" name="origin" placeholder="New Origin" required>
        <input type="text" name="destination" placeholder="New Destination" required>
        <input type="text" name="status" placeholder="New Status" required>

        <button type="submit">Update Shipment</button>
    </form>

    <!-- Shipments Table -->
    <table class="styled-table">
        <thead>
            <tr>
                <th>Shipment ID</th>
                <th>Origin</th>
                <th>Destination</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <%
            if (shipments != null) {
                for (ShipmentModel s : shipments) {
        %>
        <tr>
            <td><%= s.getShipmentId() %></td>
            <td><%= s.getOrigin() %></td>
            <td><%= s.getDestination() %></td>
            <td><%= s.getStatus() %></td>
            <td>
                <form action="manageshipment" method="post" style="display:inline;">
                    <input type="hidden" name="action" value="delete">
                    <input type="hidden" name="shipmentId" value="<%= s.getShipmentId() %>">
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
