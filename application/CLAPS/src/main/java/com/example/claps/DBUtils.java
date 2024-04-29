package com.example.claps;

import java.sql.Connection;
import java.sql.DriverManager;

public class  DBUtils {
    Connection dbLink;

    public Connection getConnection() {
        String dbName = "claps";
        String url = "jdbc:mysql://localhost/" + dbName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            dbLink = DriverManager.getConnection(url);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return dbLink;
    }

}
