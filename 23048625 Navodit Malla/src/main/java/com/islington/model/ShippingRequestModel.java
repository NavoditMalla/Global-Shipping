package com.islington.model;

public class ShippingRequestModel {
    private String fullName;
    private String email;
    private String phone;
    private String origin;
    private String destination;
    private String packageDetails;

    public ShippingRequestModel() {}

    public ShippingRequestModel(String fullName, String email, String phone,
                                String origin, String destination, String packageDetails) {
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.origin = origin;
        this.destination = destination;
        this.packageDetails = packageDetails;
    }

    // Getters and setters
    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getOrigin() { return origin; }
    public void setOrigin(String origin) { this.origin = origin; }

    public String getDestination() { return destination; }
    public void setDestination(String destination) { this.destination = destination; }

    public String getPackageDetails() { return packageDetails; }
    public void setPackageDetails(String packageDetails) { this.packageDetails = packageDetails; }
}
