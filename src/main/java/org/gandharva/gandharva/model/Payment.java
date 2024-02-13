package org.gandharva.gandharva.model;

import java.sql.Date;
import java.util.UUID;

public class Payment {
    private UUID id;
    private Date paymentDate;
    private String paymentMethod;
    private Date previousExpireDate;
    private String currency;
    private double paymentAmount;
    private String authorizationToken;
    private String paymentStatus;
    private String cusFirstName;
    private String cusLastName;
    private String cusAddress;
    private String cusCity;
    private Date newExpireDate;
    private UUID userId;
    private UUID requestId;

    public Payment() {}

    public Payment(Date paymentDate, String paymentMethod, Date previousExpireDate, String currency, double paymentAmount, String authorizationToken, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, Date newExpireDate, UUID requestId, UUID userId) {
        this.id = UUID.randomUUID();
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
        this.previousExpireDate = previousExpireDate;
        this.currency = currency;
        this.paymentAmount = paymentAmount;
        this.authorizationToken = authorizationToken;
        this.paymentStatus = paymentStatus;
        this.cusFirstName = cusFirstName;
        this.cusLastName = cusLastName;
        this.cusAddress = cusAddress;
        this.cusCity = cusCity;
        this.newExpireDate = newExpireDate;
        this.requestId = requestId;
        this.userId = userId;
    }

    public Payment(UUID id, Date paymentDate, String paymentMethod, Date previousExpireDate, String currency, double paymentAmount, String authorizationToken, String paymentStatus, String cusFirstName, String cusLastName, String cusAddress, String cusCity, Date newExpireDate, UUID userId, UUID requestId) {
        this.id = id;
        this.paymentDate = paymentDate;
        this.paymentMethod = paymentMethod;
        this.previousExpireDate = previousExpireDate;
        this.currency = currency;
        this.paymentAmount = paymentAmount;
        this.authorizationToken = authorizationToken;
        this.paymentStatus = paymentStatus;
        this.cusFirstName = cusFirstName;
        this.cusLastName = cusLastName;
        this.cusAddress = cusAddress;
        this.cusCity = cusCity;
        this.newExpireDate = newExpireDate;
        this.userId = userId;
        this.requestId = requestId;
    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public Date getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(Date paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentMethod() {
        return paymentMethod;
    }

    public void setPaymentMethod(String paymentMethod) {
        this.paymentMethod = paymentMethod;
    }

    public Date getPreviousExpireDate() {
        return previousExpireDate;
    }

    public void setPreviousExpireDate(Date previousExpireDate) {
        this.previousExpireDate = previousExpireDate;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public double getPaymentAmount() {
        return paymentAmount;
    }

    public void setPaymentAmount(double paymentAmount) {
        this.paymentAmount = paymentAmount;
    }

    public String getAuthorizationToken() {
        return authorizationToken;
    }

    public void setAuthorizationToken(String authorizationToken) {
        this.authorizationToken = authorizationToken;
    }

    public String getPaymentStatus() {
        return paymentStatus;
    }

    public void setPaymentStatus(String paymentStatus) {
        this.paymentStatus = paymentStatus;
    }

    public String getCusFirstName() {
        return cusFirstName;
    }

    public void setCusFirstName(String cusFirstName) {
        this.cusFirstName = cusFirstName;
    }

    public String getCusLastName() {
        return cusLastName;
    }

    public void setCusLastName(String cusLastName) {
        this.cusLastName = cusLastName;
    }

    public String getCusAddress() {
        return cusAddress;
    }

    public void setCusAddress(String cusAddress) {
        this.cusAddress = cusAddress;
    }

    public String getCusCity() {
        return cusCity;
    }

    public void setCusCity(String cusCity) {
        this.cusCity = cusCity;
    }

    public Date getNewExpireDate() {
        return newExpireDate;
    }

    public void setNewExpireDate(Date newExpireDate) {
        this.newExpireDate = newExpireDate;
    }

    public UUID getRequestId() {
        return requestId;
    }

    public void setRequestId(UUID requestId) {
        this.requestId = requestId;
    }

    public UUID getUserId() {
        return userId;
    }

    public void setUserId(UUID userId) {
        this.userId = userId;
    }
}
