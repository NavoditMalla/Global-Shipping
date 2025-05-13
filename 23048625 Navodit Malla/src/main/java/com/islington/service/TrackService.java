package com.islington.service;

import com.islington.config.DbConfig;
import com.islington.model.TrackModel;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TrackService {
    private Connection dbConn;

    public TrackService() {
        try {
            this.dbConn = DbConfig.getDbConnection();
        } catch (SQLException | ClassNotFoundException ex) {
            System.err.println("Database connection error: " + ex.getMessage());
            ex.printStackTrace();
        }
    }

    public boolean addParcel(TrackModel parcel) {
        String query = "INSERT INTO parcel_tracking (tracking_id, status, current_location, last_updated) VALUES (?, ?, ?, ?)";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, parcel.getTrackingId());
            stmt.setString(2, parcel.getStatus());
            stmt.setString(3, parcel.getCurrentLocation());
            stmt.setString(4, parcel.getLastUpdated());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Insert error: " + e.getMessage());
            return false;
        }
    }

    public boolean updateParcel(TrackModel parcel) {
        String query = "UPDATE parcel_tracking SET status = ?, current_location = ?, last_updated = ? WHERE tracking_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, parcel.getStatus());
            stmt.setString(2, parcel.getCurrentLocation());
            stmt.setString(3, parcel.getLastUpdated());
            stmt.setString(4, parcel.getTrackingId());
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Update error: " + e.getMessage());
            return false;
        }
    }

    public boolean deleteParcel(String trackingId) {
        String query = "DELETE FROM parcel_tracking WHERE tracking_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, trackingId);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            System.err.println("Delete error: " + e.getMessage());
            return false;
        }
    }

    public List<TrackModel> getAllParcels() {
        List<TrackModel> parcels = new ArrayList<>();
        String query = "SELECT * FROM parcel_tracking ORDER BY last_updated DESC";
        try (PreparedStatement stmt = dbConn.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {
            while (rs.next()) {
                parcels.add(new TrackModel(
                    rs.getString("tracking_id"),
                    rs.getString("status"),
                    rs.getString("current_location"),
                    rs.getString("last_updated")
                ));
            }
        } catch (SQLException e) {
            System.err.println("Fetch error: " + e.getMessage());
        }
        return parcels;
    }
    public TrackModel getParcelByTrackingId(String trackingId) {
        String query = "SELECT * FROM parcel_tracking WHERE tracking_id = ?";
        try (PreparedStatement stmt = dbConn.prepareStatement(query)) {
            stmt.setString(1, trackingId);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new TrackModel(
                    rs.getString("tracking_id"),
                    rs.getString("status"),
                    rs.getString("current_location"),
                    rs.getString("last_updated")
                );
            }
        } catch (SQLException e) {
            System.err.println("Query error in getParcelByTrackingId: " + e.getMessage());
        }

        return null; // Not found
    }

}
