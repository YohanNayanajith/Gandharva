package org.gandharva.gandharva.controller;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import static org.gandharva.gandharva.constants.Constants.MERCHANT_SECRET;
import static org.gandharva.gandharva.constants.Constants.MERCHANT_ID;

public class PaymentHashvalueGeneratorController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        String merchant_id = req.getParameter("merchant_id");
        PrintWriter out = resp.getWriter();
        String order_id = req.getParameter("order_id");
        double amount = Double.parseDouble(req.getParameter("amount"));
        String currency = req.getParameter("currency");

        String formatted_amount = String.format("%.2f", amount);

        // Generating hash
        String hash = generateHash(order_id, formatted_amount, currency);

        System.out.println("Generated Hash: " + hash);
        out.print(hash);
    }

    private String generateHash(String order_id, String amount, String currency) {
        try {
            // Concatenating values
            String concatenated = MERCHANT_ID + order_id + amount + currency + MERCHANT_SECRET;

            // Hashing the concatenated string
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(concatenated.getBytes());
            byte[] hashBytes = md.digest();

            // Converting bytes to hexadecimal representation
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString().toUpperCase();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
