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
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author Minky
 */
public class EditPostServlet extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            try {
                ServletContext servletContext = this.getServletConfig().getServletContext();
                EncFormResult efr = new EncForm().getEncFormData(request, servletContext); //parse then get data from the encrypt form data

                HashMap<String, List<String>> formFields = efr.getFormFields(); //get form field data from form
                List<FileItem> fileItemList = efr.getFileItems(); //get file item from form
                List<String> filePathList = EncForm.uploadFile(fileItemList.toArray(new FileItem[fileItemList.size()]), "resource/img/product-img", request, servletContext); //upload all file in list, then get the path list of uploaded items
                
                int postUserID = ((UserAccount)request.getSession().getAttribute("currentAccount")).getUserID(); //get id of current account
                
                int postID = Integer.parseInt(formFields.get("postID").get(0));
                String postTitle = formFields.get("title").get(0);                
                String postDescription = formFields.get("description").get(0);
                String thumbnailURL = "";
                if(!filePathList.isEmpty()) thumbnailURL = filePathList.get(0); //for thumbnail
                List<String> categoryIDList = formFields.get("category");
                
                Integer[] categoryIDs = {};
                if(!categoryIDList.isEmpty()){
                    categoryIDs = categoryIDList.stream().map(cat -> Integer.parseInt(cat)).toArray(Integer[]::new);
                }
//
                System.out.println("postID: " + postID + " postUserID: " + postUserID + " postTitle: " + postTitle + " postDescription: " + postDescription + " thumbnailURL: " + thumbnailURL + "\n");
                System.out.println("categories:" + Arrays.toString(categoryIDs));
//                out.println("postID: " + postID + "accountID: " + postUserID + " postTitle: " + postTitle + " postDescription: " + postDescription + " thumbnailURL: " + thumbnailURL + "\n");
//                out.println("categories:" + Arrays.toString(categoryIDs));
//
                //update Post
                boolean isSuccess = PostDAO.updatePost(postID, postUserID, postTitle, postDescription, thumbnailURL);
                
                System.out.println("add post: " + isSuccess);
                
                if(isSuccess){
                    //update ProductImage
                    if(!filePathList.isEmpty()) //file path list can be empty in edit process
                    {
                        System.out.println("add post image " + PostImageDAO.updatePostImageDeleteFirst(postID, filePathList.toArray(new String[filePathList.size()])));
                    }
                    //update CategoryPost
                    if(categoryIDs.length != 0) {
                        System.out.println("add post category " + PostCategoryDAO.updatePostCategoryDeleteFirst(postID, categoryIDs));
                    }
                }
                out.print("Edit Success!");            
            } catch (SQLException e) {
                out.print("Edit Fail!");
                throw e;
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
            Logger.getLogger(EditPostServlet.class.getName()).log(Level.SEVERE, null, ex);
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
