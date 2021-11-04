/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Manager;

import DBConnection.DBConnection;
import Entity.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author truon
 */
public class CategoryManagerDAO {

    public static ArrayList<Category> getAllCategory() throws SQLException {

        ArrayList<Category> ls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from Category";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    ls.add(new Category(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getBoolean(4)));
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

        return ls;
    }

    public static void changeCategoryState(String id, String oldState) throws SQLException {
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
                String sql = "update Category set isDisable = ? where categoryID = ?";

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

    public static void main(String[] args) throws SQLException {
        CategoryManagerDAO dao = new CategoryManagerDAO();
//        dao.deleteCategory("");
//        dao.changeCategoryState("1", "true");
//        ArrayList<Category> ls = dao.getAllCategory();
//        for (Category l : ls) {
//            System.out.println(l.toString());
//        }
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
}
