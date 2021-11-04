/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.PostImage;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Minky
 */
public class PostImageDAO {
    public static int insertPostImage(int PostID, String[] postImageURL) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            
            if (con != null) {
                
                String query = "insert into\n"
                    + "PostImage(postID,postImageURL)\n"
                    + "values(?,?)";
                
                int successCount = 0;
                for (String imgURL : postImageURL) {
                    stm = con.prepareStatement(query);
                    stm.setInt(1, PostID);
                    stm.setString(2, imgURL);
                    if (stm.executeUpdate() > 0) {
                        successCount++;
                    }
                }
                return successCount;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }
    
    public static int updatePostImageDeleteFirst(int PostID, String[] postImageURL) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            
            if (con != null) {
                String insertQuery = "insert into\n"
                    + "PostImage(postID,postImageURL)\n"
                    + "values(?,?);";
                String deleteQuery = "delete from PostImage where postID=?;";
                
                stm = con.prepareStatement(deleteQuery);
                stm.setInt(1, PostID);
                if(stm.executeUpdate() == 0){
                    return -2; //delete fault
                }
                
                int successCount = 0;
                for (String imgURL : postImageURL) {
                    stm = con.prepareStatement(insertQuery);
                    stm.setInt(1, PostID);
                    stm.setString(2, imgURL);
                    if (stm.executeUpdate() > 0) {
                        successCount++;
                    }
                }
                return successCount;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1; //fault
    }    
}
