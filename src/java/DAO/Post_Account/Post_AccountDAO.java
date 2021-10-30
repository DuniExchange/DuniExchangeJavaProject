/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Post_Account;

import DBConnection.DBConnection;
import Entity.Category;
import Entity.Post_Account;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
                        + "where a.[isDisable] = 0 and a.postUserID = b.userID";

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
                            rs.getString(10),
                            rs.getString(12),
                            rs.getString(13),
                            rs.getDate(14),
                            rs.getString(15),
                            rs.getString(16),
                            rs.getFloat(17),
                            rs.getBoolean(18),
                            rs.getBoolean(19)
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

    public List<Post_Account> getListPost_AccountExchange() throws Exception {
        List<Post_Account> listPost_Account = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select *\n"
                        + "from Post a, UserAccount b\n"
                        + "where a.[isDisable] = 1 and a.postUserID = b.userID";

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
                            rs.getString(10),
                            rs.getString(12),
                            rs.getString(13),
                            rs.getDate(14),
                            rs.getString(15),
                            rs.getString(16),
                            rs.getFloat(17),
                            rs.getBoolean(18),
                            rs.getBoolean(19)
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

    public List<Category> getAllCategory() throws SQLException {
        List<Category> list = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from Category";

                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Category(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getBoolean(4)
                    ));
                }
                return list;
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

    public int getNumberOfAllProductNotExChange() throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select count(*) from Post a, "
                        + "UserAccount b where a.[isDisable] = 0 and a.postUserID = b.userID ";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public int getNumberOfAllProductExChange() throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select count(*) from Post a, "
                        + "UserAccount b where a.[isDisable] = 1 and a.postUserID = b.userID ";

                stm = con.prepareStatement(sql);

                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public List<Post_Account> getListPostByCategory(String ID) throws Exception {
        List<Post_Account> listPost_Account = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from [dbo].[Post] a inner join  PostCategory b on a.postID = b.postID \n"
                        + "inner join  \n"
                        + "[dbo].[Category] c on b.categoryID = c.categoryID\n"
                        + "inner join UserAccount e on e.userID = a.postUserID where b.categoryID = ? and a.[isDisable] = 0";

                stm = con.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listPost_Account.add(new Post_Account(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getBoolean(8),
                            rs.getString(16),
                            rs.getString(18),
                            rs.getString(19),
                            rs.getDate(20),
                            rs.getString(21),
                            rs.getString(22),
                            rs.getFloat(23),
                            rs.getBoolean(24),
                            rs.getBoolean(25)
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

    public List<Post_Account> getListPostExchangeByCategory(String ID) throws Exception {
        List<Post_Account> listPost_Account = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from [dbo].[Post] a \n"
                        + "inner join  PostCategory b on a.postID = b.postID \n"
                        + " inner join   [dbo].[Category] c on b.categoryID = c.categoryID \n"
                        + " inner join UserAccount e on e.userID = a.postUserID where b.categoryID = ? and a.[isDisable] = 1";

                stm = con.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listPost_Account.add(new Post_Account(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getBoolean(8),
                            rs.getString(16),
                            rs.getString(18),
                            rs.getString(19),
                            rs.getDate(20),
                            rs.getString(21),
                            rs.getString(22),
                            rs.getFloat(23),
                            rs.getBoolean(24),
                            rs.getBoolean(25)
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

    public int getNumberOfAllProductByCategory(String ID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select count(*) from [dbo].[Post] a inner join  PostCategory b on a.postID = b.postID where b.categoryID = ? and a.[isDisable] = 0 ";

                stm = con.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public int getNumberOfAllProductExchangeByCategory(String ID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = " select count(*) from [dbo].[Post] a inner join  PostCategory b on a.postID = b.postID where b.categoryID =? and a.[isDisable] = 1 ";

                stm = con.prepareStatement(sql);
                stm.setString(1, ID);
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public List<Post_Account> getListPost_AccountBySearch(String txt) throws Exception {
        List<Post_Account> listPost_Account = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from [dbo].[Post] a, [dbo].UserAccount b\n"
                        + " where a.postUserID = b.userID and a.postTitle like ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, '%' + txt + '%');
                rs = stm.executeQuery();
                while (rs.next()) {
                    listPost_Account.add(new Post_Account(rs.getInt(1),
                            rs.getInt(2),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getString(5),
                            rs.getInt(6),
                            rs.getString(7),
                            rs.getBoolean(8),
                            rs.getString(10),
                            rs.getString(12),
                            rs.getString(13),
                            rs.getDate(14),
                            rs.getString(15),
                            rs.getString(16),
                            rs.getFloat(17),
                            rs.getBoolean(18),
                            rs.getBoolean(19)
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

    public int getNumberOfAllProductBySearch(String txt) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select count(*) from [dbo].[Post] a, [dbo].UserAccount b\n"
                        + " where a.postUserID = b.userID and a.postTitle like ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, '%' + txt + '%');
                rs = stm.executeQuery();
                if (rs.next()) {
                    return rs.getInt(1);
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
        return 0;
    }

    public static void main(String[] args) throws Exception {
        Post_AccountDAO d = new Post_AccountDAO();
//        List<Post_Account> listPost_Account = new ArrayList<>();
//        listPost_Account = d.getListPost_Account();
//        System.out.println(listPost_Account);

//        List<Category> list = new ArrayList<>();
//        list = d.getAllCategory();
//        System.out.println(list);
//        System.out.println(d.getNumberOfAllProductNotExChange());
//        List<Post_Account> listPostbyCate = new ArrayList<>();
//        listPostbyCate = d.getListPostByCategory("1");
//        System.out.println(d.getNumberOfAllProductByCategory("1"));
//        System.out.println(d.getListPost_AccountBySearch("a"));
        System.out.println(d.getNumberOfAllProductBySearch("a"));
    }

}
