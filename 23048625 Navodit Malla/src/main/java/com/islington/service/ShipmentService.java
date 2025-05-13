package com.islington.service;

import com.islington.config.DbConfig;
import com.islington.model.ShipmentModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ShipmentService {
    private Connection dbConn;

    public ShipmentService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public boolean addShipment(ShipmentModel shipment) {
        String query = "INSERT INTO shipments (shipment_id, origin, destination, status) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, shipment.getShipmentId());
            stmt.setString(2, shipment.getOrigin());
            stmt.setString(3, shipment.getDestination());
            stmt.setString(4, shipment.getStatus());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Insert error: " + e.getMessage());
            return false;
        }
    }

    public boolean updateShipment(ShipmentModel shipment) {
        String query = "UPDATE shipments SET origin=?, destination=?, status=? WHERE shipment_id=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, shipment.getOrigin());
            stmt.setString(2, shipment.getDestination());
            stmt.setString(3, shipment.getStatus());
            stmt.setString(4, shipment.getShipmentId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Update error: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteShipment(String shipmentId) {
        String query = "DELETE FROM shipments WHERE shipment_id=?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, shipmentId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Delete error: " + e.getMessage());
            return false;
        }
    }

    public List<ShipmentModel> getAllShipments() {
        List<ShipmentModel> shipments = new ArrayList<>();
        String query = "SELECT * FROM shipments";
        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                shipments.add(new ShipmentModel(
                    rs.getString("shipment_id"),
                    rs.getString("origin"),
                    rs.getString("destination"),
                    rs.getString("status")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Fetch error: " + e.getMessage());
        }
        return shipments;
    }
}
