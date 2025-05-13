package com.islington.model;

public class ShipmentModel {
    private String shipmentId;
    private String origin;
    private String destination;
    private String status;

    public ShipmentModel() {
        // Default constructor
    }

    public ShipmentModel(String shipmentId, String origin, String destination, String status) {
        this.shipmentId = shipmentId;
        this.origin = origin;
        this.destination = destination;
        this.status = status;
    }

    public String getShipmentId() {
        return shipmentId;
    }

    public void setShipmentId(String shipmentId) {
        this.shipmentId = shipmentId;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public String getDestination() {
        return destination;
    }

    public void setDestination(String destination) {
        this.destination = destination;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
