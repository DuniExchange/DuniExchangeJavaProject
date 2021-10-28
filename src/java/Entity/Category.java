/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

/**
 *
 * @author acer
 */
public class Category {
    private int categoryID;
    private String categoryName;
    private String categoryIcon;
    
    public Category(){};

    public Category(int categoryID, String categoryName, String categoryIcon) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryIcon = categoryIcon;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getCategoryIcon() {
        return categoryIcon;
    }

    public void setCategoryIcon(String categoryIcon) {
        this.categoryIcon = categoryIcon;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", categoryIcon=" + categoryIcon + '}';
    }
}
