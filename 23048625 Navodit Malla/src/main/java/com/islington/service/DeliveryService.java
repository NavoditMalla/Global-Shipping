package com.islington.service;

import com.islington.config.DbConfig;
import com.islington.model.DeliveryModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeliveryService {
    private Connection dbConn;

    public DeliveryService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public boolean addDelivery(DeliveryModel delivery) {
        String query = "INSERT INTO delivery_orders (delivery_id, driver_name, route, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, delivery.getDeliveryId());
            stmt.setString(2, delivery.getDriverName());
            stmt.setString(3, delivery.getRoute());
            stmt.setString(4, delivery.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Insert error: " + e.getMessage());
            return false;
        }
    }

    public List<DeliveryModel> getAllDeliveries() {
        List<DeliveryModel> deliveries = new ArrayList<>();
        String query = "SELECT * FROM delivery_orders";
        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                deliveries.add(new DeliveryModel(
                        rs.getString("delivery_id"),
                        rs.getString("driver_name"),
                        rs.getString("route"),
                        rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Fetch error: " + e.getMessage());
        }
        return deliveries;
    }

    public boolean updateDelivery(DeliveryModel delivery) {
        String query = "UPDATE delivery_orders SET driver_name=?, route=?, status=? WHERE delivery_id=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, delivery.getDriverName());
            stmt.setString(2, delivery.getRoute());
            stmt.setString(3, delivery.getStatus());
            stmt.setString(4, delivery.getDeliveryId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Update error: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteDelivery(String deliveryId) {
        String query = "DELETE FROM delivery_orders WHERE delivery_id=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, deliveryId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Delete error: " + e.getMessage());
            return false;
        }
    }
}
