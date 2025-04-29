<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard | Global Shipping</title>
    <link rel="stylesheet" href="css/style2.css">
</head>
<body>
    <!-- Admin Header -->
    <header class="main-header">
        <div class="container">
            <div class="logo">
                <a href="adminDashboard.jsp">Admin Panel</a>
            </div>
            <nav class="main-nav">
                <ul>
                    <li><a href="manageDeliveries.jsp">Manage Deliveries</a></li>
                    <li><a href="manageShipments.jsp">Manage Shipments</a></li>
                    <li><a href="trackParcels.jsp">Track Parcels</a></li>
                    <li><a href="logout">Logout</a></li>
                </ul>
            </nav>
        </div>
    </header>

    <!-- Dashboard Content -->
    <section class="hero-banner" style="background: linear-gradient(135deg, #2a273c, #f7ac70);">
        <div class="container" style="text-align: center;">
            <h1>Welcome, Admin</h1>
            <p>Manage all shipping operations efficiently and securely</p>
        </div>
    </section>

    <section class="dashboard-section">
        <div class="container dashboard-grid">
            <div class="dashboard-card">
                <h2>Manage Deliveries</h2>
                <p>Update delivery status, assign drivers, and optimize routes.</p>
                <a href="manageDeliveries.jsp" class="explore-btn">Go to Deliveries</a>
            </div>

            <div class="dashboard-card">
                <h2>Manage Shipments</h2>
                <p>Create new shipments, update shipment details, and monitor shipments in real-time.</p>
                <a href="manageShipments.jsp" class="explore-btn">Go to Shipments</a>
            </div>

            <div class="dashboard-card">
                <h2>Track Parcels</h2>
                <p>View all parcel tracking updates, shipment statuses, and customer inquiries.</p>
                <a href="trackParcels.jsp" class="explore-btn">Go to Tracking</a>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="main-footer">
        <div class="container">
            <div class="footer-links">
                <div class="footer-column">
                    <h3>Admin Tools</h3>
                    <ul>
                        <li><a href="manageDeliveries.jsp">Deliveries</a></li>
                        <li><a href="manageShipments.jsp">Shipments</a></li>
                        <li><a href="trackParcels.jsp">Tracking</a></li>
                    </ul>
                </div>
                <div class="footer-column">
                    <h3>Support</h3>
                    <ul>
                        <li><a href="#">Contact Tech Team</a></li>
                        <li><a href="#">System Status</a></li>
                        <li><a href="#">Documentation</a></li>
                    </ul>
                </div>
            </div>
            <div class="copyright">
                <p>&copy; 2025 Global Shipping. Admin Panel.</p>
            </div>
        </div>
    </footer>
</body>
</html>