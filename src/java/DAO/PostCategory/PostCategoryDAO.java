/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.PostCategory;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Minky
 */
public class PostCategoryDAO {
    public static int insertPostCategory(int postID, Integer[] categoriesID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                int successCount = 0;
                String sql = "insert into "
                    + "PostCategory(postID,categoryID)"
                    + " values (?,?)";
                for (int catID : categoriesID) {
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, postID);
                    stm.setInt(2, catID);
                    if(stm.executeUpdate() > 0){
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
     
    public static List<Integer> getPostCategoriesByPostID(int postID) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        List<Integer> categoryIDs = new ArrayList();
        try {
            con = DBConnection.makeConnection();
            if (con != null) {                
                    String sql = "select categoryID from PostCategory where postID=?";
                    stm = con.prepareStatement(sql);
                    stm.setInt(1, postID);
                    
                    rs = stm.executeQuery();                   
                    while(rs.next()){
                        categoryIDs.add(rs.getInt(1));
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
        return categoryIDs;
    }
    
    
    public static int updatePostCategoryDeleteFirst(int PostID, Integer[] categoryIDs) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        try {
            con = DBConnection.makeConnection();
            
            if (con != null) {
                String insertQuery = "insert into\n"
                    + "PostCategory(postID,categoryID)\n"
                    + "values (?,?)";
                String deleteQuery = "delete from PostCategory where postID=?;";
                
                stm = con.prepareStatement(deleteQuery);
                stm.setInt(1, PostID);
                if(stm.executeUpdate() == 0){
                    return -2; //delete fault
                }
                
                int successCount = 0;
                for (int categoryID : categoryIDs) {
                    stm = con.prepareStatement(insertQuery);
                    stm.setInt(1, PostID);
                    stm.setInt(2, categoryID);
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
