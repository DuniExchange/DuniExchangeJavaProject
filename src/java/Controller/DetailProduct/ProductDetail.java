/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DetailProduct;

import DAO.DetailProduct.DetailProductDAO;
import Entity.Category;
import Entity.Post_Account;
import Entity.Post_Image;
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
@WebServlet(name = "ProductDetail", urlPatterns = {"/ProductDetail"})
public class ProductDetail extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String postid = request.getParameter("postid");
        DetailProductDAO DPD = new DetailProductDAO();
        List<Category> listCateDetail = new ArrayList<>();
        List<Post_Image> listImageDetail = new ArrayList<>();
        List<Post_Account> getProductSuggCate = new ArrayList<>();

        listCateDetail = DPD.showCategoryPostDetail(postid);
        String cname = listCateDetail.get(0).getCategoryName();
        listImageDetail = DPD.showImagePostDetail(postid);

        Post_Account postAccDetail = DPD.showPostDetail(postid);
        getProductSuggCate = DPD.suggestPostSameCategory(cname, postid);

        request.setAttribute("pDt", postAccDetail);
        request.setAttribute("lstCate", listCateDetail);
        request.setAttribute("lstImg", listImageDetail);
        request.setAttribute("catePost", getProductSuggCate);

        request.getRequestDispatcher("jsp/view/detail-product.jsp").forward(request, response);
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
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetail.class.getName()).log(Level.SEVERE, null, ex);
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
        } catch (SQLException ex) {
            Logger.getLogger(ProductDetail.class.getName()).log(Level.SEVERE, null, ex);
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

    public static void main(String[] args) throws SQLException {
        DetailProductDAO d = new DetailProductDAO();
        //System.out.println(d.showPostDetail("1"));
        //System.out.println(d.showCategoryPostDetail("2"));
        //System.out.println(d.showImagePostDetail("3"));
//        List<Category> listCateDetail = new ArrayList<>();
//        List<Post_Account> getProductSuggCate = new ArrayList<>();

        List<Post_Image> listImageDetail = new ArrayList<>();
//        listCateDetail = d.showCategoryPostDetail("1");
        listImageDetail = d.showImagePostDetail("1");
//        getProductSuggCate = d.suggestPostSameCategory("a", "1");
//        System.out.println(listCateDetail);
        System.out.println(listImageDetail);
//        System.out.println(getProductSuggCate);
    }
}
