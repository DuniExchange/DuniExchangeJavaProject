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
    private boolean isDisable;

    public Category() {
    }

    public Category(int categoryID, String categoryName, String categoryIcon, boolean isDisable) {
        this.categoryID = categoryID;
        this.categoryName = categoryName;
        this.categoryIcon = categoryIcon;
        this.isDisable = isDisable;
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

    public boolean getIsDisable() {
        return isDisable;
    }

    public void setIsDisable(boolean isDisable) {
        this.isDisable = isDisable;
    }

    @Override
    public String toString() {
        return "Category{" + "categoryID=" + categoryID + ", categoryName=" + categoryName + ", categoryIcon=" + categoryIcon + ", isDisable=" + isDisable + '}';
    }
    
}
