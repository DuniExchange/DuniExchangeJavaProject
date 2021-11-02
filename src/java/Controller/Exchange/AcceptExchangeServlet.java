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
public class AcceptExchangeServlet extends HttpServlet {

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
        System.out.println("a");
        System.out.println(firstPostID);
        System.out.println(secondPostID);

        if (firstPostID != null && secondPostID != null) {
            System.out.println("b");
            boolean acceptExchange = ExchangeDAO.acceptExchange(Integer.parseInt(firstPostID), Integer.parseInt(secondPostID));
            System.out.println("accetp Exchange: " + acceptExchange);
            boolean updateExchangeItem1 = PostDAO.updateExchangeItem(Integer.parseInt(firstPostID));
            boolean updateExchangeItem2 = PostDAO.updateExchangeItem(Integer.parseInt(secondPostID));

            UserAccount currentAccount = (UserAccount) request.getSession().getAttribute("currentAccount");
            boolean createNotiType1 = NotificationDAO.createNotiType1(currentAccount.getUserID(), secondPostID, firstPostID, UserDAO.getUserIDByPostID(Integer.parseInt(firstPostID)));
            boolean createNotiType3 = NotificationDAO.createNotiType3(UserDAO.getUserIDByPostID(Integer.parseInt(firstPostID)), firstPostID, secondPostID, currentAccount.getUserID());

            boolean updateWaitingExpiredYourItem_1 = NotificationDAO.updateWaitingRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(firstPostID));
            boolean updateWaitingExpiredYourItem_2 = NotificationDAO.updateWaitingRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(secondPostID));

            boolean updateWaitingExpiredPOtherItem_1 = NotificationDAO.updateWaitingRequestExchangeExpiredBecauseOtherItemExchanged(Integer.parseInt(secondPostID));
            boolean updateWaitingExpiredOtherItem_2 = NotificationDAO.updateWaitingRequestExchangeExpiredBecauseOtherItemExchanged(Integer.parseInt(firstPostID));

            
            boolean updateYourRequestExchange_1 = NotificationDAO.updateYourRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(firstPostID));
            boolean updateYourRequestExchange_2 = NotificationDAO.updateYourRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(secondPostID));
            
            boolean updateAcceptOrDenyExpired_1 = NotificationDAO.updateAcceptOrDenyRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(firstPostID));
            boolean updateAcceptOrDenyExpired_2 = NotificationDAO.updateAcceptOrDenyRequestExchangeExpiredBecauseYourItemExchanged(Integer.parseInt(secondPostID));
            
            ArrayList<Integer> ListPostIDRequestExchangeWithAPOst_1 = ExchangeDAO.getListPostIDRequestExchangeWithAPOst(Integer.parseInt(firstPostID));
            for(int i = 0; i < ListPostIDRequestExchangeWithAPOst_1.size(); i++){
                PostDAO.updateNotUsedExchange(ListPostIDRequestExchangeWithAPOst_1.get(i));
            }
            ArrayList<Integer> ListPostIDRequestExchangeWithAPOst_2 = ExchangeDAO.getListPostIDRequestExchangeWithAPOst(Integer.parseInt(secondPostID));
            for(int i = 0; i < ListPostIDRequestExchangeWithAPOst_2.size(); i++){
                PostDAO.updateNotUsedExchange(ListPostIDRequestExchangeWithAPOst_2.get(i));
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
            Logger.getLogger(AcceptExchangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(AcceptExchangeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
