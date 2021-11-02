/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Manager;

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
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author truon
 */
public class PostManagerDAO {

    public static List<Post> getAllPost() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        List<Post> posts = new ArrayList<>();
        try{
            con = DBConnection.makeConnection();

            if (con != null) {
                String query = "select * from Post";
                stm = con.prepareStatement(query);

                rs = stm.executeQuery();
                while (rs.next()) {
                    int postID = rs.getInt(1);
                    int postUserID = rs.getInt(2);
                    String postUsername = UserDAO.getUsernameByID(postUserID + "");
                    String postTitle = rs.getString(3);
                    Date postDate = rs.getDate(4);
                    String postDescription = rs.getString(5);
                    int postLike = rs.getInt(6);
                    String postThumbnailURL = rs.getString(7);
                    boolean isDisable = rs.getBoolean(8);

                    posts.add(new Post(postID, postUsername, postTitle, postDate, postDescription, postLike, postThumbnailURL, isDisable));
                }
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
        return posts;
    }
    public static void changePostState(String id, String oldState) throws SQLException {
        boolean newState = false;
        if (oldState.trim().equals("false")) {
            newState = true;
        }
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "update Post set isDisable = ? where postID = ?";

                stm = con.prepareStatement(sql);
                stm.setBoolean(1, newState);
                stm.setInt(2, Integer.parseInt(id));
                stm.execute();
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
    }
    public static void main(String[] args) {
        try {
            changePostState("1", "true");
        } catch (SQLException ex) {
            Logger.getLogger(PostManagerDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
