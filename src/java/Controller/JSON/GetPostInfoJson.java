/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.JSON;

import DAO.Post.PostDAO;
import DAO.PostCategory.PostCategoryDAO;
import DAO.User.UserDAO;
import Entity.Post;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Minky
 */
public class GetPostInfoJson extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        
        response.setHeader("Cache-control", "no-cache, no-store");
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Expires", "-1");
 
        response.setHeader("Access-Control-Allow-Origin", "*");
        response.setHeader("Access-Control-Allow-Methods", "POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setHeader("Access-Control-Max-Age", "86400");
        
        try (PrintWriter out = response.getWriter()) {            
            Gson gson = new Gson();
            JsonObject myObj = new JsonObject();
            
            String editPostID = request.getParameter("editPostID");
            
            Post post = null;
            List<Integer> categories = null;
            String postUserName;
            try {
                post = PostDAO.getPostByPostID(Integer.parseInt(editPostID));
                categories = PostCategoryDAO.getPostCategoriesByPostID(Integer.parseInt(editPostID));
            } catch (NumberFormatException e) {
                myObj.addProperty("success", false);
                myObj.addProperty("erorr", "Invalid id!");
                out.print(myObj);
                return;
            }
            
            if(post == null){
                myObj.addProperty("success", false);
                myObj.addProperty("erorr", "Post not found!");
            }
            else {
                myObj.addProperty("success", true);
                
                JsonElement postObj = gson.toJsonTree(post);
                JsonElement categoriesObj = gson.toJsonTree(categories);
                
                postObj.getAsJsonObject().add("categories", categoriesObj);
            
                myObj.add("post", postObj);                

                out.print(myObj);
            }
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
        response.sendRedirect(request.getContextPath());
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
        } catch (SQLException ex) {
            Logger.getLogger(GetPostInfoJson.class.getName()).log(Level.SEVERE, null, ex);
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
