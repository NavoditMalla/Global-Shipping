package com.islington.model;

public class TrackModel {
    private String trackingId;
    private String status;
    private String currentLocation;
    private String lastUpdated;

    public TrackModel() {
        // default constructor
    }

    public TrackModel(String trackingId, String status, String currentLocation, String lastUpdated) {
        this.trackingId = trackingId;
        this.status = status;
        this.currentLocation = currentLocation;
        this.lastUpdated = lastUpdated;
    }

    public String getTrackingId() {
        return trackingId;
    }

    public void setTrackingId(String trackingId) {
        this.trackingId = trackingId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCurrentLocation() {
        return currentLocation;
    }

    public void setCurrentLocation(String currentLocation) {
        this.currentLocation = currentLocation;
    }

    public String getLastUpdated() {
        return lastUpdated;
    }

    public void setLastUpdated(String lastUpdated) {
        this.lastUpdated = lastUpdated;
    }
}
