/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.DetailProduct;

import DBConnection.DBConnection;
import Entity.Post_Comment;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author acer
 */
public class Post_CommentDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;

    public List<Post_Comment> getListComment(String id) throws Exception {
        List<Post_Comment> listPost_Comment = new ArrayList<>();
        try {
            con = DBConnection.makeConnection();

            if (con != null) {
                String sql = "select * from ProductComment a inner join UserAccount b on a.userID = b.userID where a.postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    listPost_Comment.add(new Post_Comment(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(10),
                            rs.getString(13),
                            rs.getInt(14)
                    ));
                }
                return listPost_Comment;
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

    public int getNumberOfPostComment(String id) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select count(*) from ProductComment where postID = ?";

                stm = con.prepareStatement(sql);
                stm.setString(1, id);
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

    public void PostComment(String content, String postID, String userID) throws SQLException {
        String sql = "insert into ProductComment values( ? ,?, ?, ? )";

        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
        Date date = new Date();
        String d;
        d = formatter.format(date);

        try {
            con = DBConnection.makeConnection();

            if (con != null) {

                stm = con.prepareStatement(sql);
                stm.setString(1, content);
                stm.setString(2, d);
                stm.setString(3, postID);
                stm.setString(4, userID);
                stm.executeUpdate();

            }
        } catch (Exception e) {
        }

    }

    public static void main(String[] args) throws Exception {
        Post_CommentDAO d = new Post_CommentDAO();
        List<Post_Comment> p = new ArrayList<>();

//        
//        System.out.println(d.getNumberOfPostComment("4"));
        d.PostComment("nice", "4", "1");
        System.out.println(d.getNumberOfPostComment("4"));
//        p = d.getListComment("1");
//        System.out.println(p);
    }
}
