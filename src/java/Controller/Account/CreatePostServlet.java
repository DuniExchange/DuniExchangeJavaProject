/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller.Account;

import DAO.Post.PostDAO;
import DAO.PostCategory.PostCategoryDAO;
import DAO.PostImage.PostImageDAO;
import Entity.UserAccount;
import Upload.EncForm;
import Upload.EncFormResult;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Minky
 */
public class CreatePostServlet extends HttpServlet {

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
            throws ServletException, IOException{
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            try {
                ServletContext servletContext = this.getServletConfig().getServletContext();
                EncFormResult efr = new EncForm().getEncFormData(request, servletContext); //parse then get data from the encrypt form data

                HashMap<String, List<String>> formFields = efr.getFormFields(); //get form field data from form
                List<FileItem> fileItemList = efr.getFileItems(); //get file item from form
                List<String> filePathList = EncForm.uploadFile(fileItemList.toArray(new FileItem[fileItemList.size()]), "resource/img/product-img", request, servletContext); //upload all file in list, then get the path list of uploaded items

                int postUserID = ((UserAccount)request.getSession().getAttribute("currentAccount")).getUserID(); //get id of current account

                String postTitle = formFields.get("title").get(0);
                Timestamp postDate = new Timestamp(new Date().getTime());
                String postDescription = formFields.get("decription").get(0);
                String thumbnailURL = filePathList.get(0); //for thumbnail
                List<String> cateList = formFields.get("category");
                String[] categories = {};
                if(!cateList.isEmpty()){
                    categories = cateList.toArray(new String[cateList.size()]);
                }

                System.out.println("accountID: " + postUserID + " postTitle: " + postTitle + " postDate: " + postDate + " postDescription: " + postDescription + " postLike: " + " thumbnailURL: " + thumbnailURL + "\n");
                System.out.println("categories:" + Arrays.toString(categories));

                //update Post
                int postID = PostDAO.insertPost(postUserID, postTitle, postDate, postDescription, thumbnailURL);

                if(postID > 0){
                    //update ProductImage
                    PostImageDAO.insertPostImage(postID, filePathList.toArray(new String[filePathList.size()]));
                    //update CategoryPost
                    if(categories.length != 0) PostCategoryDAO.insertPostCategory(postID, categories);
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.print(e.getMessage() + "\nCreate Fail!");
                return;
            }
            out.print("Create Success!");
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
        } catch (Exception ex) {
            Logger.getLogger(CreatePostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
