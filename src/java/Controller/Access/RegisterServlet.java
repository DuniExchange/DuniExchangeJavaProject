/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.Access;

import DAO.User.ManagerAccessDAO;
import Entity.UserAccount;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author truon
 */
@WebServlet(name = "RegisterServlet", urlPatterns = {"/registerServlet"})
public class RegisterServlet extends HttpServlet {

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
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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
        request.getRequestDispatcher("jsp/view/register.jsp").forward(request, response);
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
            String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("passwordUser");
        String re_password = request.getParameter("re_password");
        String fullname = request.getParameter("fullname");
        
        if (ManagerAccessDAO.isHaveUsename(username)) {
            request.setAttribute("MESSAGE", "Đã có tài khoản này");
            request.getRequestDispatcher("displayRegisterServlet").forward(request, response);
        }else{
            if (password.trim().equals(re_password.trim())) {
                System.out.println("Mat khau giong nhau");
                boolean insert = ManagerAccessDAO.insertAccount(username, fullname, email, password);
                if (insert) {
                    System.out.println("thêm account thành công");
                }else{
                    System.out.println("Khong them account duoc");
                }
                HttpSession session = request.getSession();
                try {
                        UserAccount currentAccount = ManagerAccessDAO.getAccountByUserName(username);
                        session.setAttribute("currentAccount", currentAccount);
                    } catch (Exception ex) {
                        Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
                response.sendRedirect(request.getContextPath());
            }else{
                request.setAttribute("MESSAGE", "Mật khẩu không khớp");
                request.getRequestDispatcher("displayRegisterServlet").forward(request, response);
            }
        }
        } catch (SQLException ex) {
            Logger.getLogger(RegisterServlet.class.getName()).log(Level.SEVERE, null, ex);
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
