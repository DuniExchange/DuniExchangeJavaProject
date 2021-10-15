/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DBConnection;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author truon
 */
public class DBConnection {
        public static Connection makeConnection() throws Exception{
        String connectionUrl = "jdbc:sqlserver://localhost:1433;"
                +"databaseName=DuniExchange;User=sa;Password=admin";
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        Connection con = DriverManager.getConnection(connectionUrl);
        return con;
    }
    public static void main(String[] args) throws Exception {
        System.out.println(DBConnection.makeConnection());
    }
}
