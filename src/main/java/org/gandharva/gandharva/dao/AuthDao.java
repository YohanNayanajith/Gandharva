package org.gandharva.gandharva.dao;

import org.gandharva.gandharva.constants.UserType;
import org.gandharva.gandharva.database.DBConnection;
import org.gandharva.gandharva.model.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AuthDao {
    public static boolean registration(User user) throws SQLException, ClassNotFoundException {
        Connection connection = DBConnection.getInstance().getConnection();
        String query = "INSERT INTO user VALUES(?,?,?,?,?,?)";
        PreparedStatement pst = connection.prepareStatement(query);

        pst.setString(1,user.getId().toString());
        pst.setString(2,user.getFirstName());
        pst.setString(3,user.getLastName());
//        pst.setDate(3, Date.valueOf(register.getDate_of_birth()));
        pst.setString(4,user.getEmail());
        pst.setString(5,user.getUserType().toString());
        pst.setString(6,user.getPassword());

        return pst.executeUpdate() > 0;
    }
}
