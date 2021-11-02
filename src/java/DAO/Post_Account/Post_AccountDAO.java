/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Post_Account;

import DBConnection.DBConnection;
import Entity.Post_Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class Post_AccountDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public static List<Post_Account> getListPost_Account() throws Exception {
        List<Post_Account> listPost_Account = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select *\n"
                        + "from Post a, UserAccount b\n"
                        + "where a.postUserID = b.userID";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
//                    ko get mật khẩu và id trùng, lấy 1 id là đủ rồi
                    listPost_Account.add(new Post_Account(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getBoolean(8),
                            rs.getInt(9),
                            rs.getString(11),
                            rs.getString(13),
                            rs.getString(14),
                            rs.getDate(15),
                            rs.getString(16),
                            rs.getString(17),
                            rs.getFloat(18),
                            rs.getBoolean(19),
                            rs.getBoolean(20)
                    ));
                }
                return listPost_Account;
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
    
    public static void main(String[] args) throws Exception {
        System.out.println(Post_AccountDAO.getListPost_Account());
    }
   
}
