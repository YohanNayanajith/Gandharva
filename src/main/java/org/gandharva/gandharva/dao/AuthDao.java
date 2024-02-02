package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.Astrologer;
import org.gandharva.gandharva.model.EventPlanner;
import org.gandharva.gandharva.model.User;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AuthDao {
    public static boolean astrologerRegistration(Astrologer astrologer) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,numberOfCasesHandled,yearsOfExperience,certificateFileUpload) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
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

        return pst.executeUpdate() > 0;
    }

    public static boolean userRegistration(User user) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,nic,birthday) VALUES(?,?,?,?,?,?,?,?,?,?)";
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

        return pst.executeUpdate() > 0;
    }

    public static boolean eventPlannerRegistration(EventPlanner eventPlanner) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user(id,firstName,lastName,email,userType,password,countryOfResidence,district,numberOfCasesHandled,yearsOfExperience,brFileUpload) VALUES(?,?,?,?,?,?,?,?,?,?,?)";
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

        return pst.executeUpdate() > 0;
    }
}
