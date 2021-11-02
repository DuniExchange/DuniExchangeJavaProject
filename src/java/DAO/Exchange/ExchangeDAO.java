/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Exchange;

import DAO.Post.PostDAO;
import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author ADMIN
 */
public class ExchangeDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    //firstPostID: bài viết của người gửi yêu cầu
    //secondPostID: bài viết của người được nhận yêu cầu
    public static boolean createRequestExchange(String firstPostID, String secondPostID) throws SQLException, NamingException, Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into Exchange(postRequestDate,firstPostID,secondPostID,exchangeState) values"
                        + "(?,?,?,?)";
                stm = con.prepareStatement(sql);
                stm.setString(1, LocalDateTime.now().toString());
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 0);
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

    public static boolean acceptExchange(int firstPostID, int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update Exchange set exchangeState = 1, responseDate = ? where firstPostID = ? and secondPostID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, LocalDateTime.now().toString());
                stm.setInt(2, firstPostID);
                stm.setInt(3, secondPostID);
                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
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
        return false;
    }
    public static boolean denyExchange(int firstPostID, int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update Exchange set exchangeState = 2, responseDate = ? where firstPostID = ? and secondPostID = ?";
                stm = con.prepareStatement(sql);
                stm.setString(1, LocalDateTime.now().toString());
                stm.setInt(2, firstPostID);
                stm.setInt(3, secondPostID);
                int row = stm.executeUpdate();

                if (row > 0) {
                    return true;
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
        return false;
    }
    public static ArrayList<Integer> getListPostIDRequestExchangeWithAPOst(int secondPostID) throws SQLException {

        String query = "select firstPostID from Exchange where secondPostID=? and exchangeState = 0";
        ArrayList<Integer> ListPostIDRequestExchangeWithAPOst = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setInt(1, secondPostID);

                rs = stm.executeQuery();
                while (rs.next()) {
                   ListPostIDRequestExchangeWithAPOst.add(rs.getInt(1));
                }
                return ListPostIDRequestExchangeWithAPOst;
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
    public static ArrayList<Integer> getListPostIDRequestExchangeWithAPOstWhenDeny(int secondPostID) throws SQLException {

        String query = "select firstPostID from Exchange where secondPostID=? and exchangeState = 2";
        ArrayList<Integer> ListPostIDRequestExchangeWithAPOst = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                stm = con.prepareStatement(query);
                stm.setInt(1, secondPostID);

                rs = stm.executeQuery();
                while (rs.next()) {
                   ListPostIDRequestExchangeWithAPOst.add(rs.getInt(1));
                }
                return ListPostIDRequestExchangeWithAPOst;
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
//        System.out.println(ExchangeDAO.acceptExchange(Integer.parseInt("119"), Integer.parseInt("113")));
//        System.out.println(ExchangeDAO.acceptExchange(119,113));
 ArrayList<Integer> ListPostIDRequestExchangeWithAPOst_2 = ExchangeDAO.getListPostIDRequestExchangeWithAPOst(Integer.parseInt("201"));
for(int i = 0; i < ListPostIDRequestExchangeWithAPOst_2.size(); i++){
                System.out.println(PostDAO.updateNotUsedExchange(ListPostIDRequestExchangeWithAPOst_2.get(i)));
            }
//        System.out.println(ExchangeDAO.getListPostIDRequestExchangeWithAPOst(183));
System.out.println(ExchangeDAO.getListPostIDRequestExchangeWithAPOstWhenDeny(255));
    }
}
