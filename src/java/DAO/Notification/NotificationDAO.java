/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO.Notification;

import DBConnection.DBConnection;
import Entity.SystemNotification;
import static com.sun.org.apache.xalan.internal.lib.ExsltDatetime.date;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.time.LocalDateTime;
import java.util.ArrayList;
import javax.naming.NamingException;
import java.util.Date;
/**
 *
 * @author ADMIN
 */
public class NotificationDAO {

    private static Connection con = null;
    private static PreparedStatement stm = null;
    private static ResultSet rs = null;
    public static SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    

    //firstPostID: bài viết của người gửi yêu cầu
    //secondPostID: bài viết của người được nhận yêu cầu
    public static boolean createNotiTypeNegative1(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, -1);
                    long millis = System.currentTimeMillis();

//                java.sql.Date date = new java.sql.Date(millis);
//                stm.setDate(5, (java.sql.Date) new Date(System.currentTimeMillis()));
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
//                    stm.setDate(5, date);
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
    //firstPostID: bài viết của người gửi yêu cầu
    //secondPostID: bài viết của người được nhận yêu cầu

    public static boolean createNotiType0(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 0);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
 public static boolean createNotiType2(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 2);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
  public static boolean createNotiType4(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 4);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
    public static ArrayList<SystemNotification> getNotificationByUserID(int userID) throws SQLException, NamingException, Exception {
        try {
            ArrayList<SystemNotification> getListNotificationByUserID = new ArrayList<>();
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "	from SystemNotification\n"
                        + "	where userID = ? order by notiDate desc";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                rs = stm.executeQuery();
//                System.out.println(row);
                while (rs.next()) {
                    getListNotificationByUserID.add(new SystemNotification(
                            rs.getInt(1),
                            rs.getInt(2),
                            rs.getInt(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getDate(6),
                            rs.getInt(7),
                            rs.getInt(8),
                            rs.getInt(9)
                    ));
                }
                return getListNotificationByUserID;
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

        return null;
    }
    public static boolean updateSeen(int notiID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set seen = 1 where notiID = ?";
                stm = con.prepareStatement(sql);
                stm.setInt(1, notiID);
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
    public static boolean createNotiType1(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 1);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
    public static boolean createNotiType3(int userID, String firstPostID, String secondPostID, int toUserID) throws SQLException, NamingException, Exception {
        try {
//            String frmtdDate = dateFormat.format(date);
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "insert into SystemNotification(userID,firstPostID,secondPostID,notiType,notiDate,toUserID,expired) values"
                        + "(?,?,?,?,?,?,?)";
                stm = con.prepareStatement(sql);

                stm.setInt(1, userID);
                stm.setString(2, firstPostID);
                stm.setString(3, secondPostID);
                stm.setInt(4, 3);
                stm.setTimestamp(5, Timestamp.valueOf(LocalDateTime.now()));
                stm.setInt(6, toUserID);
                stm.setInt(7, 0);
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
    //  Thông tin bạn đợi exchange bị hết hạn nếu sản phẩm của bạn được bạn trao đổi
    public static boolean updateWaitingRequestExchangeExpiredBecauseYourItemExchanged(int firstPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where firstPostID = ? and notiType =-1 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, firstPostID);
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
     //     Thông tin bạn đợi exchange bị hết hạn nếu sản phẩm của họ được họ trao đổi
     public static boolean updateWaitingRequestExchangeExpiredBecauseOtherItemExchanged(int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where secondPostID = ? and notiType =-1 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, secondPostID);
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
      //   Thông tin bạn Request tra đổi bị hết hạn nếu sản phẩm của họ được họ trao đổi
     public static boolean updateYourRequestExchangeExpiredBecauseYourItemExchanged(int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where secondPostID = ? and notiType = 0 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, secondPostID);
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
      //   Thông tin bạn Request tra đổi bị hết hạn nếu sản phẩm của bạn được bạn trao đổi
     public static boolean updateAcceptOrDenyRequestExchangeExpiredBecauseYourItemExchanged(int firstPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where firstPostID = ? and notiType = 0 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, firstPostID);
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
      //   Thông tin bạn Request trao đổi bị hết hạn nếu sản phẩm của bạn được bạn trao đổi
     public static boolean updateAcceptOrDenyRequestExchangeExpiredBecauseDenyExchanged(int firstPostID, int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where firstPostID = ? and secondPostID = ? and notiType = 0 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, firstPostID);
                stm.setInt(2, secondPostID);
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
    //  Thông tin bạn đợi exchange bị hết hạn nếu sản phẩm của bạn được bạn trao đổi
    public static boolean updateWaitingRequestExchangeExpiredBecauseDenyExchanged(int firstPostID , int secondPostID) throws Exception {
        try {
            con = DBConnection.makeConnection();
            if (con != null) {
                String sql = "update SystemNotification set expired = 1 where firstPostID = ? and secondPostID = ? and notiType = -1 ";
                stm = con.prepareStatement(sql);
                stm.setInt(1, firstPostID);
                stm.setInt(2, secondPostID);
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
    public static void main(String[] args) throws Exception {
//        System.out.println(NotificationDAO.getNotificationByUserID(1));
//System.out.println(LocalDateTime.now().toString());
//        System.out.println(NotificationDAO.updateSeen(7));
        System.out.println(NotificationDAO.updateWaitingRequestExchangeExpiredBecauseDenyExchanged(253, 255));

    }

}
