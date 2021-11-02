/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.User;

import DBConnection.DBConnection;
import Entity.Post;
import Entity.Post_Account;
import Entity.UserAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.mindrot.jbcrypt.BCrypt;
import javax.naming.NamingException;

/**
 *
 * @author Minky
 */
public class UserDAO {

    public static String getUserFullnameByID(String userID) throws SQLException {
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
        return userFullname;
    }

    public static String getUsernameByID(String userID) throws SQLException {
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
                    userFullname = rs.getString("userUsername");
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
        return userFullname;
    }

    public static int getUserIDByPostID(int postID) throws SQLException, NamingException, Exception {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select postUserID\n"
                        + "	from Post\n"
                        + "	where postID = ?";
                stm = con.prepareStatement(sql);

                stm.setInt(1, postID);
                rs = stm.executeQuery();
//                System.out.println(row);
                if (rs.next()) {
                    return rs.getInt(1);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return -1;
    }

    public static void main(String[] args) {
        try {
            System.out.println(getUsernameByID("1"));
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public static ArrayList<UserAccount> getListUserAccount() throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            ArrayList<UserAccount> listUserAccount = new ArrayList<>();

            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from UserAccount";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                while (rs.next()) {
                    listUserAccount.add(new UserAccount(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getFloat(9),
                            rs.getBoolean(10),
                            rs.getBoolean(11)));
                }
                return listUserAccount;
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

        return null;
    }


    public static void updatePassword(String email, String password) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;

        String query = "update UserAccount set userPassword = ? where userEmail = ?";
        String pass = null;
        try {
            con = DBConnection.makeConnection();
            String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setString(1, hash);
                stm.setString(2, email);

                stm.execute();
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
    }
}
