package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.Payment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class PaymentDAO {
    public static boolean addPaymentDetails(Payment payment) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
//        3- payment_method
//        7- authorization_token
//        8- payment_status
        String query = "INSERT INTO payment(id, paymentDate, paymentMethod, previousExpireDate, currency, paymentAmount, paymentStatus, cusFirstName, cusLastName, cusAddress, cusCity, newExpireDate, userId, requestId) VALUES(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1,payment.getId().toString());
        pst.setDate(2, payment.getPaymentDate());
        pst.setString(3,payment.getPaymentMethod());
        pst.setDate(4, payment.getPreviousExpireDate());
        pst.setString(5,payment.getCurrency());
        pst.setDouble(6,payment.getPaymentAmount());
//        pst.setString(7,null); //Authorization token
        pst.setString(7,payment.getPaymentStatus()); //payment.getPayment_status()
        pst.setString(8,payment.getCusFirstName());
        pst.setString(9,payment.getCusLastName());
        pst.setString(10,payment.getCusAddress());
        pst.setString(11,payment.getCusCity());
        pst.setDate(12, payment.getNewExpireDate());
        pst.setString(13,payment.getUserId().toString());
        pst.setString(14,payment.getRequestId().toString());

        System.out.println("Payment added!");

        return pst.executeUpdate() > 0;
    }

    public static List<Payment> getAllPaymentDetailsByUserId(String userId) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT * FROM payment WHERE userId = ?";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userId);

        ResultSet resultSet = pst.executeQuery();
        List<Payment> physicalPaymentList = new ArrayList<>();

        while (resultSet.next()) {
            if (resultSet != null) {
                physicalPaymentList.add(
                        new Payment(
                                UUID.fromString(resultSet.getString(1)),
                                resultSet.getDate(2),
                                resultSet.getString(3),
                                resultSet.getDate(4),
                                resultSet.getString(5),
                                resultSet.getDouble(6),
                                resultSet.getString(7),
                                resultSet.getString(8),
                                resultSet.getString(9),
                                resultSet.getString(10),
                                resultSet.getString(11),
                                resultSet.getString(12),
                                resultSet.getDate(13),
                                UUID.fromString(resultSet.getString(14)),
                                UUID.fromString(resultSet.getString(15))
                        )
                );
            }
        }
        return physicalPaymentList;
    }
}
