package org.gandharva.gandharva.database;

import org.gandharva.gandharva.configuration.AppConfig;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    AppConfig appConfig = new AppConfig();
//    private final String host = appConfig.getDatabaseHost();
//    private final String port = appConfig.getDatabasePort();
//    private final String database = appConfig.getDatabaseName();
//    private final String username = appConfig.getDatabaseUsername();
//    private final String password = appConfig.getDatabasePassword();

    private final String host = "localhost";
    private final String port = "3306";
    private final String database = "gandharva";
    private final String username = "root";
    private final String password = "password";

    private Connection connection;
    private static DBConnection dbconnection;

    public DBConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://"+host+":"+port+"/"+database;
        connection = DriverManager.getConnection(url,username,password);
    }
    public static DBConnection getInstance() throws SQLException, ClassNotFoundException {
        if(dbconnection == null){
            dbconnection = new DBConnection();
        }
        return dbconnection;
    }
    public Connection getConnection() {
        return connection;
    }
}
