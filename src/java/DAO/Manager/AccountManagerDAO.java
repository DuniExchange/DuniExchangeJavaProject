/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Manager;

import DBConnection.DBConnection;
import Entity.UserAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author truon
 */
public class AccountManagerDAO {
   public static ArrayList<UserAccount> getAllAccount() throws SQLException {

        ArrayList<UserAccount> ls = new ArrayList<>();
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from UserAccount";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    ls.add(new UserAccount(rs.getInt(1),
                            rs.getString(2).trim(),
                            rs.getString(4).trim(),
                            rs.getString(5).trim(),
                            rs.getString(8).trim(),
                            rs.getBoolean(10)));
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
   
   
    public static void changeAccountAdmin(String id, String oldState) throws SQLException {
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
                String sql = "update UserAccount set isAdmin = ? where userID = ?";

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
    
    
    public static void deleteCategory(String id) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "delete UserAccount where userID = ?";

                stm = con.prepareStatement(sql);
                stm.setInt(1, Integer.parseInt(id));
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
        AccountManagerDAO dao = new AccountManagerDAO();
        dao.changeAccountAdmin("1003", "false");
//        ArrayList<UserAccount> ls = dao.getAllAccount();
//        for (UserAccount l : ls) {
//            System.out.println(l.toString());
//        }
    }
}
