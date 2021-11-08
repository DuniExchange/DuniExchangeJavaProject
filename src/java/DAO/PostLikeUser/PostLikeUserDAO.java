/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO.PostLikeUser;

import DBConnection.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Minky
 */
public class PostLikeUserDAO {
    public static String LikePost(int pid, int uid) throws SQLException{
        Connection con = DBConnection.makeConnection();
        PreparedStatement stm = null;
        ResultSet rs = null;
        
        if (con != null) {
            String check = "select * from PostLikeUser where postID=? and userID=?";
            System.out.println("like post: pid=" + pid + " uid=" + uid);
            stm = con.prepareStatement(check);
            stm.setInt(1, pid);
            stm.setInt(2, uid);

            if(!stm.executeQuery().next()){
                String insert = "insert into PostLikeUser(postID, userID) values (?,?)";
                stm = con.prepareStatement(insert);
                stm.setInt(1, pid);
                stm.setInt(2, uid);

                int row = stm.executeUpdate();
                return row > 0 ? "like success" : "like fail";
            } else {
                String delete = "delete from PostLikeUser where postID=? and userID=?";
                stm = con.prepareStatement(delete);
                stm.setInt(1, pid);
                stm.setInt(2, uid);

                int row = stm.executeUpdate();
                return row > 0 ? "unlike success" : "unlike fail";
            }
        }
        if (rs != null) {
            rs.close();
        }
        if (stm != null) {
            stm.close();
        }
        if (con != null) {
            con.close();
        }
        return "connection null";
    }
}
