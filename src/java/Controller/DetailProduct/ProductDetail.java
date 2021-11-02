/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller.DetailProduct;

import DAO.DetailProduct.DetailProductDAO;
import DAO.DetailProduct.Post_CommentDAO;
import Entity.Category;
import Entity.Post_Account;
import Entity.Post_Comment;
import Entity.Post_Image;
import Entity.UserAccount;
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
import javax.servlet.http.HttpSession;

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
            throws ServletException, IOException, SQLException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        if (session != null) {
//            UserAccount c = (UserAccount) session.getAttribute("currentAccount");
//            int userid = c.getUserID();
//            request.setAttribute("uid", userid);
        }
        String postid = request.getParameter("postid");
        DetailProductDAO DPD = new DetailProductDAO();
        Post_CommentDAO PCD = new Post_CommentDAO();

        List<Category> listCateDetail = new ArrayList<>();
        List<Post_Image> listImageDetail = new ArrayList<>();
        List<Post_Account> getProductSuggCate = new ArrayList<>();
        List<Post_Comment> listComment = new ArrayList<>();

        listCateDetail = DPD.showCategoryPostDetail(postid);
        String cname = listCateDetail.get(0).getCategoryName();
        listImageDetail = DPD.showImagePostDetail(postid);
        listComment = PCD.getListComment(postid);
        int numComment = PCD.getNumberOfPostComment(postid);

        Post_Account postAccDetail = DPD.showPostDetail(postid);
        getProductSuggCate = DPD.suggestPostSameCategory(cname, postid);

        request.setAttribute("pDt", postAccDetail);
        request.setAttribute("lstCate", listCateDetail);
        request.setAttribute("lstImg", listImageDetail);
        request.setAttribute("catePost", getProductSuggCate);
        request.setAttribute("listComment", listComment);
        request.setAttribute("numComment", numComment);

        request.setAttribute("pid", postid);

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
        } catch (Exception ex) {
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
        } catch (Exception ex) {
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

    public static void main(String[] args) throws SQLException, Exception {
        DetailProductDAO d = new DetailProductDAO();
        Post_CommentDAO PCD = new Post_CommentDAO();
        //System.out.println(d.showPostDetail("1"));
        //System.out.println(d.showCategoryPostDetail("2"));
        //System.out.println(d.showImagePostDetail("3"));
//        List<Category> listCateDetail = new ArrayList<>();
//        List<Post_Account> getProductSuggCate = new ArrayList<>();

//        List<Post_Image> listImageDetail = new ArrayList<>();
        List<Post_Comment> listComment = new ArrayList<>();
//        listCateDetail = d.showCategoryPostDetail("1");
//        listImageDetail = d.showImagePostDetail("1");
        listComment = PCD.getListComment("1");
//        int numComment = PCD.getNumberOfPostComment("1");
//        getProductSuggCate = d.suggestPostSameCategory("a", "1");
//        System.out.println(listCateDetail);
//        System.out.println(listImageDetail);
//        System.out.println(getProductSuggCate);
        System.out.println(listComment);
//        System.out.println(numComment);
    }
}
