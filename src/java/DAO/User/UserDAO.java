/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.User;

import DBConnection.DBConnection;
import Entity.Post;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Minky
 */
public class UserDAO {
    public static String getUserFullnameByID(String userID) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        String query = "select * from UserAccount where UserID=?";
        
        String userFullname = "";
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);  
                stm.setString(1, userID);

                rs = stm.executeQuery();
                if (rs.next()) {
                    userFullname = rs.getString("userFullname");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
        return userFullname;
    }
}
