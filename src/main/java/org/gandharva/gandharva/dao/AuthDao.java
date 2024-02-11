package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.*;

import java.sql.*;
import java.util.UUID;

public class AuthDao {
    public static boolean astrologerRegistration(Astrologer astrologer) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,numberOfCasesHandled,yearsOfExperience,certificateFileUpload,userImage) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, astrologer.getId().toString());
        pst.setString(2, astrologer.getFirstName());
        pst.setString(3, astrologer.getLastName());
//        pst.setDate(3, Date.valueOf(register.getDate_of_birth()));
        pst.setString(4, astrologer.getEmail());
        pst.setString(5, astrologer.getUserType().toString());
        pst.setString(6, astrologer.getPassword());
        pst.setString(7, astrologer.getCountryOfResidence());
        pst.setString(8, astrologer.getDistrict());
        pst.setInt(9, astrologer.getNumberOfCasesHandled());
        pst.setInt(10, astrologer.getYearsOfExperience());
        pst.setBytes(11, astrologer.getCertificateFileUpload());
        pst.setBytes(12, astrologer.getUserImage());

        return pst.executeUpdate() > 0;
    }

    public static boolean userRegistration(User user) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,nic,birthday,userImage) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, user.getId().toString());
        pst.setString(2, user.getFirstName());
        pst.setString(3, user.getLastName());
        pst.setString(4, user.getEmail());
        pst.setString(5, user.getUserType().toString());
        pst.setString(6, user.getPassword());
        pst.setString(7, user.getCountryOfResidence());
        pst.setString(8, user.getDistrict());
        pst.setString(9, user.getNic());
        pst.setDate(10, Date.valueOf(user.getBirthday()));
        pst.setBytes(11, user.getUserImage());

        return pst.executeUpdate() > 0;
    }

    public static boolean eventPlannerRegistration(EventPlanner eventPlanner) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,numberOfCasesHandled,yearsOfExperience,brFileUpload,userImage) VALUES(?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, eventPlanner.getId().toString());
        pst.setString(2, eventPlanner.getFirstName());
        pst.setString(3, eventPlanner.getLastName());
        pst.setString(4, eventPlanner.getEmail());
        pst.setString(5, eventPlanner.getUserType().toString());
        pst.setString(6, eventPlanner.getPassword());
        pst.setString(7, eventPlanner.getCountryOfResidence());
        pst.setString(8, eventPlanner.getDistrict());
        pst.setInt(9, eventPlanner.getNumberOfCasesHandled());
        pst.setInt(10, eventPlanner.getYearsOfExperience());
        pst.setBytes(11, eventPlanner.getBrFileUpload());
        pst.setBytes(12, eventPlanner.getUserImage());

        return pst.executeUpdate() > 0;
    }

    public static AllUser getUser(String id) throws SQLException, ClassNotFoundException {
        AllUser allUser = new AllUser();
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT * FROM user WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1, id);

        ResultSet resultSet = pst.executeQuery();

        if (resultSet.next()) {
            allUser.setId(UUID.fromString(resultSet.getString(1)));
            allUser.setFirstName(resultSet.getString(2));
            allUser.setLastName(resultSet.getString(3));
            allUser.setEmail(resultSet.getString(4));
            allUser.setUserType(UserType.valueOf(resultSet.getString(5)));
            allUser.setPassword(resultSet.getString(6));
            allUser.setCountryOfResidence(resultSet.getString(7));
            allUser.setDistrict(resultSet.getString(8));
            allUser.setUserImage(resultSet.getBytes(15));

            if(allUser.getUserType().equals(UserType.USER) || allUser.getUserType().equals(UserType.PREMIUM_USER) || allUser.getUserType().equals(UserType.STANDARD_USER)){
                allUser.setNic(resultSet.getString(9));
                allUser.setBirthday(resultSet.getDate(10).toLocalDate());
            } else if (allUser.getUserType().equals(UserType.ASTROLOGER)) {
                allUser.setNumberOfCasesHandled(resultSet.getInt(11));
                allUser.setYearsOfExperience(resultSet.getInt(12));
                allUser.setCertificateFileUpload(resultSet.getBytes(13));
            } else if (allUser.getUserType().equals(UserType.EVENT_PLANNER)) {
                allUser.setNumberOfCasesHandled(resultSet.getInt(11));
                allUser.setYearsOfExperience(resultSet.getInt(12));
                allUser.setBrFileUpload(resultSet.getBytes(14));
            }else {
                throw new RuntimeException("UserType not present in the database");
            }
            return allUser;
        }

        return null;
    }

    public static boolean updateAstrologer(Astrologer astrologer) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE user SET firstName=?, lastName=?, district=?, email=?, yearsOfExperience=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, astrologer.getFirstName());
        pst.setString(2, astrologer.getLastName());
        pst.setString(3, astrologer.getDistrict());
        pst.setString(4, astrologer.getEmail());
        pst.setInt(5, astrologer.getYearsOfExperience());
        pst.setString(6, astrologer.getId().toString());

        return pst.executeUpdate() > 0;
    }

    public static boolean updateAstrologerPassword(String id, String password) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE user SET password=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1, password);
        pst.setString(2, id);

        return pst.executeUpdate() > 0;
    }

    public static boolean updateProfileImage(String id, byte[] userImage) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "UPDATE user SET userImage=? WHERE id=?";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setBytes(1, userImage);
        pst.setString(2, id);

        return pst.executeUpdate() > 0;
    }
}
