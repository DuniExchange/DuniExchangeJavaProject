/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controller.Account;

import DAO.PostCategory.PostCategoryDAO;
import DAO.PostImage.PostImageDAO;
import java.sql.SQLException;

/**
 *
 * @author Minky
 */
public class Test {
    public static void main(String[] args) throws SQLException {
        PostCategoryDAO.updatePostCategoryDeleteFirst(66, new Integer[]{1,2,3});
    }
}

