package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.RequestType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.Request;
import org.gandharva.gandharva.model.RequestUserDAO;

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
        String query = "SELECT R.id, R.startDate, R.deadline, R.horoscope, R.status, R.comments, R.feedback, R.userId, R.astrologerId, U.firstName, U.lastName, U.email, U.userType FROM request R\n" +
                "INNER JOIN user U ON U.id = R.userId \n" +
                "WHERE R.astrologerId=? ORDER BY deadline DESC;";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userId);

        ResultSet resultSet = pst.executeQuery();

        while (resultSet.next()) {
            if(resultSet != null) {
                requests.add(new RequestUserDAO(
                        UUID.fromString(resultSet.getString(1)),
                        resultSet.getDate(2),
                        resultSet.getDate(3),
                        resultSet.getBytes(4),
                        RequestType.valueOf(resultSet.getString(5)),
                        resultSet.getString(6),
                        resultSet.getString(7),
                        UUID.fromString(resultSet.getString(8)),
                        UUID.fromString(resultSet.getString(9)),
                        resultSet.getString(10),
                        resultSet.getString(11),
                        resultSet.getString(12),
                        resultSet.getString(13)
                ));
            }
        }
        return requests;
    }

    public static List<Request> getRequestsByStatus(String userId, RequestType requestType) throws SQLException, ClassNotFoundException {
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
                        UUID.fromString(resultSet.getString(8)),
                        UUID.fromString(resultSet.getString(9))
                ));
            }
        }
        return requests;
    }

    public static int getRequestsCount(String userId, RequestType requestType) throws SQLException, ClassNotFoundException {
        int requestCount = 0;
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT COUNT(*) as record_count FROM request WHERE astrologerId=? AND status=? ORDER BY deadline DESC";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,userId);
        pst.setString(2, String.valueOf(requestType));

        ResultSet resultSet = pst.executeQuery();

        if (resultSet.next()) {
            requestCount = resultSet.getInt(1);
        }
        return requestCount;
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

    public static boolean updateRequestComments(String requestId, String comments) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE request SET comments=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, comments);
        pst.setString(2,requestId);

        System.out.println("Request Comment updated");

        return pst.executeUpdate() > 0;
    }

    public static boolean updateRequestFeedback(String requestId, String feedback) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE request SET feedback=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, feedback);
        pst.setString(2,requestId);

        System.out.println("Request feedback updated");

        return pst.executeUpdate() > 0;
    }
}
