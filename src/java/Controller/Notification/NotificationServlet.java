/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Notification;

import DAO.Notification.NotificationDAO;
import DAO.Post.PostDAO;
import DAO.User.UserDAO;
import Entity.Post;
import Entity.SystemNotification;
import Entity.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class NotificationServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");

        UserAccount currentAccount = (UserAccount) request.getSession().getAttribute("currentAccount");
        if (currentAccount != null) {
            boolean Isseen = true;
            ArrayList<SystemNotification> getListNotificationByUserID = NotificationDAO.getNotificationByUserID(currentAccount.getUserID());
            
            for(int i = 0; i < getListNotificationByUserID.size(); i++){
                if(getListNotificationByUserID.get(i).getSeen() == 0){
                    Isseen = false;
                    break;
                }
            }
            ArrayList<UserAccount> listUserAccount = UserDAO.getListUserAccount();
            ArrayList<Post> listPost = PostDAO.getListPost();
            request.setAttribute("Isseen", Isseen);
            request.setAttribute("getListNotificationByUserID", getListNotificationByUserID);
            request.setAttribute("listUserAccount", listUserAccount);
            request.setAttribute("listPost", listPost);
        }

        request.getRequestDispatcher("DisplayHomeServlet").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(NotificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(NotificationServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
