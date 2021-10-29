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
import java.sql.Statement;
import java.sql.Timestamp;
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
        
        List<Post> posts = new ArrayList();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String query = "select top 3 * from Post";
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
        
        List<Post> posts = new ArrayList();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String query = "select * from Post where postUserID=?";
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
    
    public static int insertPost(int postUserID, String postTitle, Timestamp postDate, String postDescription, String postThumbnailURL) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        int postID = -1; //postid for the return value
        try {
            con = DBConnection.makeConnection();
                    
            if (con != null) {
                String query = "insert into\n"
                + "Post(postUserID,postTitle,postDate,postDescription,postLike,postThumbnailURL)\n"
                + "values(?,?,?,?,0,?)";
                stm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                stm.setInt(1, postUserID);
                stm.setString(2, postTitle);
                stm.setTimestamp(3, postDate);
                stm.setString(4, postDescription);
                stm.setString(5, postThumbnailURL);

                int row = stm.executeUpdate();

                if (row == 0) {
                    return -1; //if add product failed, key return is -1
                }

                ResultSet generatedKeys = stm.getGeneratedKeys(); //get the key result set of added items

                if (generatedKeys.next()) {
                    postID = generatedKeys.getInt(1); //get the key of the row after inserting
                    System.out.println("postID: " + postID);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
        return postID; //return the postID
    }
    
    public static boolean disablePost(int postID) throws SQLException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try{
            con = DBConnection.makeConnection();
            
            if (con != null) {
                String query = "update Post set isDisable=1 where postId=?";
                stm = con.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
                stm.setInt(1, postID);

                return stm.executeUpdate() > 0;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stm != null) stm.close();
            if (con != null) con.close();
        }
        return false;
    }
}
