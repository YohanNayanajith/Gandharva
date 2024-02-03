package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.UUID;

public class LoginDAO {
    public static ParentUser getLoginData(Login login) throws SQLException, ClassNotFoundException {
        ParentUser parentUser = new ParentUser();
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "SELECT * FROM user WHERE email=? AND password=?";
        PreparedStatement pst = connection.prepareStatement(query);
        pst.setString(1,login.getEmail());
        pst.setString(2,login.getPassword());

        ResultSet resultSet = pst.executeQuery();

        if(resultSet.next()){
            parentUser.setId(UUID.fromString(resultSet.getString(1)));
            parentUser.setFirstName(resultSet.getString(2));
            parentUser.setLastName(resultSet.getString(3));
            parentUser.setEmail(resultSet.getString(4));
            parentUser.setUserType(UserType.valueOf(resultSet.getString(5)));
            parentUser.setPassword(resultSet.getString(6));
            parentUser.setCountryOfResidence(resultSet.getString(7));
            parentUser.setDistrict(resultSet.getString(8));

            if(parentUser.getUserType().equals(UserType.USER) || parentUser.getUserType().equals(UserType.PREMIUM_USER) || parentUser.getUserType().equals(UserType.STANDARD_USER)){
                User user = new User(parentUser);
                user.setNic(resultSet.getString(9));
                user.setBirthday(resultSet.getDate(10).toLocalDate());
                return user;
            } else if (parentUser.getUserType().equals(UserType.ASTROLOGER)) {
                Astrologer astrologer = new Astrologer(parentUser);
                astrologer.setNumberOfCasesHandled(resultSet.getInt(9));
                astrologer.setYearsOfExperience(resultSet.getInt(10));
                astrologer.setCertificateFileUpload(resultSet.getBytes(11));
                return astrologer;
            } else if (parentUser.getUserType().equals(UserType.EVENT_PLANNER)) {
                EventPlanner eventPlanner = new EventPlanner(parentUser);
                eventPlanner.setNumberOfCasesHandled(resultSet.getInt(9));
                eventPlanner.setYearsOfExperience(resultSet.getInt(10));
                eventPlanner.setBrFileUpload(resultSet.getBytes(11));
            }else {
                throw new RuntimeException("UserType not present in the database");
            }
        }
        return null;
    }
}
