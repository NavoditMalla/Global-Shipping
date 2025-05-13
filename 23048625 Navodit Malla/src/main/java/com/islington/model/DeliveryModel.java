package com.islington.model;

public class DeliveryModel {
    private String deliveryId;
    private String driverName;
    private String route;
    private String status;

    public DeliveryModel(String deliveryId, String driverName, String route, String status) {
        this.deliveryId = deliveryId;
        this.driverName = driverName;
        this.route = route;
        this.status = status;
    }

    public String getDeliveryId() {
        return deliveryId;
    }

    public String getDriverName() {
        return driverName;
    }

    public String getRoute() {
        return route;
    }

    public String getStatus() {
        return status;
    }

    public void setDeliveryId(String deliveryId) {
        this.deliveryId = deliveryId;
    }

    public void setDriverName(String driverName) {
        this.driverName = driverName;
    }

    public void setRoute(String route) {
        this.route = route;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
