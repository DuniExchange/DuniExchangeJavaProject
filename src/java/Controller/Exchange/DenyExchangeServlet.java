/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Exchange;

import DAO.Exchange.ExchangeDAO;
import DAO.Notification.NotificationDAO;
import DAO.Post.PostDAO;
import DAO.User.UserDAO;
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
public class DenyExchangeServlet extends HttpServlet {

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
        
        String firstPostID = request.getParameter("firstPostID");
        String secondPostID = request.getParameter("secondPostID");
        System.out.println(firstPostID);
        System.out.println(secondPostID);
        if (firstPostID != null && secondPostID != null) {
            boolean denyExchange = ExchangeDAO.denyExchange(Integer.parseInt(firstPostID), Integer.parseInt(secondPostID));
            UserAccount currentAccount = (UserAccount) request.getSession().getAttribute("currentAccount");
            boolean createNotiType2 = NotificationDAO.createNotiType2(currentAccount.getUserID(), secondPostID, firstPostID, UserDAO.getUserIDByPostID(Integer.parseInt(firstPostID)));
            boolean createNotiType4 = NotificationDAO.createNotiType4(UserDAO.getUserIDByPostID(Integer.parseInt(firstPostID)), firstPostID, secondPostID, currentAccount.getUserID());
            
            boolean updateAcceptOrDenyExpired_1 = NotificationDAO.updateAcceptOrDenyRequestExchangeExpiredBecauseDenyExchanged(Integer.parseInt(secondPostID), Integer.parseInt(firstPostID));
            boolean updateWaitingExpiredYourItem_2 = NotificationDAO.updateWaitingRequestExchangeExpiredBecauseDenyExchanged(Integer.parseInt(firstPostID), Integer.parseInt(secondPostID));
            
            ArrayList<Integer> ListPostIDRequestExchangeWithAPOst_1 = ExchangeDAO.getListPostIDRequestExchangeWithAPOstWhenDeny(Integer.parseInt(secondPostID));
            for(int i = 0; i < ListPostIDRequestExchangeWithAPOst_1.size(); i++){
                PostDAO.updateNotUsedExchange(ListPostIDRequestExchangeWithAPOst_1.get(i));
            }
            request.getRequestDispatcher("NotificationServlet").forward(request, response);
        }
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
            Logger.getLogger(DenyExchangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DenyExchangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
