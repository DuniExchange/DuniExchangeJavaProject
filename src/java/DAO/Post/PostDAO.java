/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.Post;

import DAO.User.UserDAO;
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
public class PostDAO {
    public static List<Post> isHaveUsename(String username) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        String query = "select top 3 * from Post";
        List<Post> posts = new ArrayList();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);                

                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt(1);
                    int postUserID = rs.getInt(2);
                    String postUserFullname = UserDAO.getUserFullnameByID(postUserID+"");
                    String postTitle = rs.getString(3);
                    Date postDate = rs.getDate(4);
                    String postDescription = rs.getString(5);
                    int postLike = rs.getInt(6);
                    String postThumbnailURL = rs.getString(7);
                    boolean isDisable = rs.getBoolean(8);
                    
                    posts.add(new Post(postID, postUserID, postUserFullname, postTitle, postDate, postDescription, postLike, postThumbnailURL, isDisable));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null)con.close();
        }
        return posts;
    }
    
    public static List<Post> getPostByUserID(String userID) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        String query = "select * from Post where postUserID=?";
        List<Post> posts = new ArrayList();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);  
                stm.setString(1, userID);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt(1);
                    int postUserID = rs.getInt(2);
                    String postUserFullname = UserDAO.getUserFullnameByID(postUserID+"");
                    String postTitle = rs.getString(3);
                    Date postDate = rs.getDate(4);
                    String postDescription = rs.getString(5);
                    int postLike = rs.getInt(6);
                    String postThumbnailURL = rs.getString(7);
                    boolean isDisable = rs.getBoolean(8);
                    
                    posts.add(new Post(postID, postUserID, postUserFullname, postTitle, postDate, postDescription, postLike, postThumbnailURL, isDisable));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
        return posts;
    }
}
