/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.PostCategory;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Minky
 */
public class PostCategoryDAO {
     public static boolean insertPostCategory(int postID, String[] categoriesID) throws Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                for (String catID : categoriesID) {
                    String sql = "insert into "
                            + "PostCategory(postID,categoryID)"
                            + " values (?,?)";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, postID);
                    stm.setInt(2, Integer.parseInt(catID));
                    if (stm.executeUpdate() > 0) {
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
