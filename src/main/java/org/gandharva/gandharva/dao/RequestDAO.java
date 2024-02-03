package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.Request;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

public class RequestDAO {
    public static boolean addRequest (Request request) throws SQLException, ClassNotFoundException{
        Connection connection= DBConnection.getInstance().getConnection();
        String query = "INSERT INTO request VALUES (?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, request.getId().toString());
        pst.setDate(2, request.getStartDate());
        pst.setDate(3, request.getDeadline());
        pst.setBytes(4, request.getHoroscope());
        pst.setString(5, request.getStatus().toString());
        pst.setString(6, request.getComments());
        pst.setString(7, request.getFeedback());
        pst.setString(8, request.getUserId().toString());

        return pst.executeUpdate()>0;
    }

//    public static Request getRequest (String requestId) throws SQLException, ClassNotFoundException{
//        Request request = new Request();
//
//        Connection connection = DBConnection.getInstance().getConnection();
//        String query = "SELECT * FROM request WHERE id =?";
//        PreparedStatement pst = connection.prepareStatement(query);
//        pst.setString(1,requestId);
//
//        ResultSet resultSet = pst.executeQuery();
//
//        if (resultSet.next()) {
//            request.setId(UUID.fromString(resultSet.getString(1)));
//            request.setStartDate(resultSet.getDate(2).toLocalDate());
//            request.setDeadline(resultSet.getDate(3).toLocalDate());
//            request.setHoroscope(resultSet.getBytes(4));
//            request.setStatus(RequestType.valueOf(resultSet.getString(5)));
//            request.setComments(resultSet.getString(6));
//            request.setFeedback(resultSet.getString(7));
//            request.setUserId(UUID.fromString(resultSet.getString(8)));
//        }
//
//        return request;
//    }

    public static List<Request> getRequests(String userId) throws SQLException, ClassNotFoundException {
        List<Request> requests = new ArrayList<>();
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT * FROM request WHERE userId=? ORDER BY deadline DESC";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userId);

        ResultSet resultSet = pst.executeQuery();

        while (resultSet.next()) {
            if(resultSet != null) {
                requests.add(new Request(
                        UUID.fromString(resultSet.getString(1)),
                        resultSet.getDate(2),
                        resultSet.getDate(3),
                        resultSet.getBytes(4),
                        RequestType.valueOf(resultSet.getString(5)),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        UUID.fromString(resultSet.getString(8))
                ));
            }
        }
        return requests;
    }

    public static boolean updateRequestStatus(String requestId, RequestType requestType) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE request SET status=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, String.valueOf(requestType));
        pst.setString(2,requestId);

        System.out.println("Request Status updated");

        return pst.executeUpdate() > 0;
    }

    public static List<Request> getRequestsCount(String userId, RequestType requestType) throws SQLException, ClassNotFoundException {
        List<Request> requests = new ArrayList<>();
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT * FROM request WHERE userId=? AND status=? ORDER BY deadline DESC";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userId);
        pst.setString(2, String.valueOf(requestType));

        ResultSet resultSet = pst.executeQuery();

        while (resultSet.next()) {
            if(resultSet != null) {
                requests.add(new Request(
                        UUID.fromString(resultSet.getString(1)),
                        resultSet.getDate(2),
                        resultSet.getDate(3),
                        resultSet.getBytes(4),
                        RequestType.valueOf(resultSet.getString(5)),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        UUID.fromString(resultSet.getString(8))
                ));
            }
        }
        return requests;
    }
}
