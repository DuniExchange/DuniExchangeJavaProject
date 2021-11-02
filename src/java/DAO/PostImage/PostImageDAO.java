/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.PostImage;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Minky
 */
public class PostImageDAO {
   public static boolean insertPostImage(int PostID, String[] postImageURL) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            
            if (con != null) {
                String query = "insert into\n"
                    + "PostImage(postID,postImageURL)\n"
                    + "values(?,?)";
                for (String imgURL : postImageURL) {
                    stm = con.prepareStatement(query);
                    stm.setInt(1, PostID);
                    stm.setString(2, imgURL);
                    if (stm.executeUpdate() == 0) {
                        return false;
                    }
                }
                return true;
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
        return false;
    }
}
