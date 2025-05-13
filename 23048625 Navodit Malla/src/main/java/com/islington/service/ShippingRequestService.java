package com.islington.service;

import com.islington.config.DbConfig;
import com.islington.model.ShippingRequestModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class ShippingRequestService {
    private Connection dbConn;

    public ShippingRequestService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            ex.printStackTrace();
        }
    }

    public boolean saveRequest(ShippingRequestModel request) {
        String query = "INSERT INTO shipping_requests (full_name, email, phone, origin, destination, package_details) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, request.getFullName());
            stmt.setString(2, request.getEmail());
            stmt.setString(3, request.getPhone());
            stmt.setString(4, request.getOrigin());
            stmt.setString(5, request.getDestination());
            stmt.setString(6, request.getPackageDetails());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Failed to insert shipping request: " + e.getMessage());
            return false;
        }
    }
}
