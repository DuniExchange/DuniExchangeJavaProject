/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.AllProductExchange;

import DAO.Post_Account.Post_AccountDAO;
import Entity.Category;
import Entity.Post_Account;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "DisplayAllProductExchangeByCategory", urlPatterns = {"/DisplayAllProductExchangeByCategory"})
public class DisplayAllProductExchangeByCategory extends HttpServlet {

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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String PostByCate = request.getParameter("caid");
        
        Post_AccountDAO PAD = new Post_AccountDAO();
        
        List<Post_Account> listPostExchangebyCate = new ArrayList<>();
        listPostExchangebyCate = PAD.getListPostExchangeByCategory(PostByCate);
              
              //get category
        List<Category> listCategory = new ArrayList<>();
        listCategory = PAD.getAllCategory();
        int numberOfProductExchangeByCategory = PAD.getNumberOfAllProductExchangeByCategory(PostByCate);
        
        
        
        request.setAttribute("listC", listCategory);
        
        request.setAttribute("listPost_Account", listPostExchangebyCate);
        
        request.setAttribute("numberItem", numberOfProductExchangeByCategory);
        
        request.getRequestDispatcher("jsp/view/all-product_exchange.jsp").forward(request, response);
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
            Logger.getLogger(DisplayAllProductExchangeByCategory.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DisplayAllProductExchangeByCategory.class.getName()).log(Level.SEVERE, null, ex);
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
