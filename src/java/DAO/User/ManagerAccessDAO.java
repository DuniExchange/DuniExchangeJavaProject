/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.User;

import DBConnection.DBConnection;
import Entity.UserAccount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import org.mindrot.jbcrypt.BCrypt;

/**
 *
 * @author truon
 */
public class ManagerAccessDAO {

    //Trả về true nếu có tồn tại username
    public static boolean isHaveUsename(String username) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        String query = "select userUserName from UserAccount where userUserName = ?";
        String user = null;
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setString(1, username);

                rs = stm.executeQuery();
                if (rs.next()) {
                    user = rs.getString(1);
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
        return user != null;
    }

    //Ktra xem password người dùng nhập vào có giống password trong DB không
    public static boolean checkPassword(String username, String password) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        String query = "select userPassword from UserAccount where userUserName = ?";
        String pass = null;
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setString(1, username);

                rs = stm.executeQuery();
                if (rs.next()) {
                    pass = rs.getString(1);
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
        return BCrypt.checkpw(password, pass);
    }

    public static UserAccount getAccountByUserName(String username) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from UserAccount where userUsername = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, username);

                rs = stm.executeQuery();
                while (rs.next()) {
                    return new UserAccount(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getString(5),
                            rs.getDate(6),
                            rs.getString(7),
                            rs.getString(8),
                            rs.getFloat(9),
                            rs.getBoolean(10),
                            rs.getBoolean(11));
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

        return null;
    }

    public static boolean insertAccount(String username, String fullname, String email, String password) throws SQLException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        String sql = "insert into "
                + "UserAccount(userUsername,userPassword,userEmail,userFullname,isAdmin,usercreateDate,userfacebookURL,userAvatarURL,isValidate)"
                + " values(?,?,?,?,0,?,'','',?)";
        try {
            con = DBConnection.makeConnection();
            String hash = BCrypt.hashpw(password, BCrypt.gensalt(12));
            if (con != null) {

                stm = con.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, hash);
                stm.setString(3, email);
                stm.setString(4, fullname);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                if (email.trim().length() == 0) {
                    stm.setBoolean(6, false);
                } else {
                    stm.setBoolean(6, true);
                }
                int row = stm.executeUpdate();
//                System.out.println(row);
                if (row > 0) {
                    return true;
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

        return false;
    }

    public static void main(String[] args) throws Exception {
        ManagerAccessDAO dao = new ManagerAccessDAO();
        String username = "trang";
        String password = "banana";
        if (dao.isHaveUsename(username)) {
            if (dao.checkPassword(username, password)) {
                System.out.println("Dang nhap thanh cong");
                UserAccount temp = dao.getAccountByUserName(username);
                System.out.println(temp.toString());
            } else {
                System.out.println("Sai mk");
            }
        } else {
            System.out.println("Khong ton tai nguoi dung");
        }
    }
}
