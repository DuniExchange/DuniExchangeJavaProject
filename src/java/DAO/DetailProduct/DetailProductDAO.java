/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.DetailProduct;

import DBConnection.DBConnection;
import Entity.Category;
import Entity.Post_Account;
import Entity.Post_Image;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author acer
 */
public class DetailProductDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public Post_Account showPostDetail(String id) throws SQLException {
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from [dbo].[Post] a inner join  [dbo].PostCategory b on a.postID = b.postID\n"
                        + " inner join  [dbo].[Category] c on b.categoryID = c.categoryID \n"
                        + " inner join UserAccount e on e.userID = a.postUserID where a.postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    return (new Post_Account(rs.getInt(1),
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
                            rs.getBoolean(25)));
                }
            }
        } catch (Exception e) {
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

    public List<Category> showCategoryPostDetail(String id) throws SQLException {
        List<Category> list = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from [dbo].[Post] a inner join  [dbo].PostCategory b on a.postID = b.postID \n"
                        + " inner join  [dbo].[Category] c on b.categoryID = c.categoryID  \n"
                        + " inner join UserAccount e on e.userID = a.postUserID \n"
                        + " where a.postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Category(rs.getInt(11),
                            rs.getString(12),
                            rs.getString(13),
                            rs.getBoolean(14)));
                }
                return list;
            }
        } catch (Exception e) {
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

    public List<Post_Image> showImagePostDetail(String id) throws SQLException {
        List<Post_Image> list = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = " select * from [dbo].[Post] a  inner join ProductImage f on f.postID = a.postID where a.postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Post_Image(rs.getString(10)));
                }
                return list;
            }
        } catch (Exception e) {
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

    public List<Post_Account> suggestPostSameCategory(String name, String id) throws SQLException {
        List<Post_Account> list = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = " select top 3 * from [dbo].[Post] a inner join  [dbo].PostCategory b on a.postID = b.postID \n"
                        + " inner join  [dbo].[Category] c on b.categoryID = c.categoryID \n"
                        + " where c.categoryName like ? and a.postID != ? order by NEWID() ";

                stm = con.prepareStatement(sql);
                stm.setString(1, '%' + name + '%');
                stm.setString(2, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    list.add(new Post_Account(rs.getInt(1),
                            rs.getString(3),
                            rs.getDate(4),
                            rs.getInt(6),
                            rs.getString(7)));
                }
                return list;
            }
        } catch (Exception e) {
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

    

    public static void main(String[] args) throws SQLException {
        DetailProductDAO d = new DetailProductDAO();
        //System.out.println(d.showPostDetail("1"));
//        System.out.println(d.showCategoryPostDetail("2"));
        System.out.println(d.showImagePostDetail("1"));
//        List<Post_Account> list = new ArrayList<>();
//        list = d.suggestPostSameCategory("a", "1");
//        System.out.println(list);
        
    }
}
