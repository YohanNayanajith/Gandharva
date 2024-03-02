<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.math.BigInteger, java.security.MessageDigest, java.security.NoSuchAlgorithmException, java.text.DecimalFormat" %>
<%@ page import="org.gandharva.gandharva.constants.HashGenerator" %>
<%@ page import="static org.gandharva.gandharva.constants.Constants.MERCHANT_SECRET" %>
<%@ page import="static org.gandharva.gandharva.constants.Constants.MERCHANT_ID" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Payment Checkout</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }
        .container {
            color: white;
            max-width: 600px;
            margin: 0 auto;
            background-color: rgba(36, 51, 62, 0.91);
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.5);
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        input[type="text"] {
            width: 90%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
<div class="container">
    <%
        String orderID = "12345";
        String amountParam = request.getParameter("amount");
        double amount = 0.0;
        if(amountParam != null && !amountParam.isEmpty()) {
            amount = Double.parseDouble(amountParam);
        }
        String currency = "LKR";
        DecimalFormat df = new DecimalFormat("0.00");
        String amountFormatted = df.format(amount);

        // Calculate hash
        String hash = HashGenerator.getMd5(MERCHANT_ID + orderID + amountFormatted + currency + HashGenerator.getMd5(MERCHANT_SECRET));
    %>
    <form method="post" action="https://sandbox.payhere.lk/pay/checkout">
        <input type="hidden" name="merchant_id" value="1225999">    <!-- Replace your Merchant ID -->
        <input type="hidden" name="return_url" value="http://sample.com/return">
        <input type="hidden" name="cancel_url" value="http://sample.com/cancel">
        <input type="hidden" name="notify_url" value="http://sample.com/notify">
        <h1>Item Details</h1>
        <div class="form-group">
            <label for="order_id">Order ID</label>
            <input type="text" id="order_id" name="order_id" value="<%= orderID %>">
        </div>
        <div class="form-group">
            <label for="items">Item Description</label>
            <input type="text" id="items" name="items" value="Door bell wireless">
        </div>
        <div class="form-group">
            <label for="currency">Currency</label>
            <input type="text" id="currency" name="currency" value="<%= currency %>">
        </div>
        <div class="form-group">
            <label for="amount">Amount</label>
            <input type="text" id="amount" name="amount" value="<%= amount %>">
        </div>
        <h1>Customer Details</h1>
        <div class="form-group">
            <label for="first_name">First Name</label>
            <input type="text" id="first_name" name="first_name" value="Saman">
        </div>
        <div class="form-group">
            <label for="last_name">Last Name</label>
            <input type="text" id="last_name" name="last_name" value="Perera">
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="text" id="email" name="email" value="samanp@gmail.com">
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="text" id="phone" name="phone" value="0771234567">
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <input type="text" id="address" name="address" value="No.1, Galle Road">
        </div>
        <div class="form-group">
            <label for="city">City</label>
            <input type="text" id="city" name="city" value="Colombo">
        </div>
        <input type="hidden" name="country" value="Sri Lanka">
        <input type="hidden" name="hash" value="<%= hash %>"> <!-- Replace with generated hash -->
        <input type="submit" value="Buy Now">
    </form>
</div>
</body>
</html>
