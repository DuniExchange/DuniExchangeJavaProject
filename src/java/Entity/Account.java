/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.sql.Date;

/**
 *
 * @author truon
 */
public class Account {
    private int accountID;
    private String userUsername;
    private String userPassword;
    private String userEmail;
    private String userFullname;
    private Date createDate;
    private String facebookURL;
    private String userImage;
    private float userRating;
    private boolean isAdmin;
    private boolean isValidate;

    public Account() {
    }

    public Account(int accountID, String userUsername, String userPassword, String userEmail, String userFullname, Date createDate, String facebookURL, String userImage, float userRating, boolean isAdmin, boolean isValidate) {
        this.accountID = accountID;
        this.userUsername = userUsername;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.createDate = createDate;
        this.facebookURL = facebookURL;
        this.userImage = userImage;
        this.userRating = userRating;
        this.isAdmin = isAdmin;
        this.isValidate = isValidate;
    }

    public float getUserRating() {
        return userRating;
    }

    public void setUserRating(float userRating) {
        this.userRating = userRating;
    }




    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getUserUsername() {
        return userUsername;
    }

    public void setUserUsername(String userUsername) {
        this.userUsername = userUsername;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }

    public String getUserFullname() {
        return userFullname;
    }

    public void setUserFullname(String userFullname) {
        this.userFullname = userFullname;
    }

    public boolean isIsAdmin() {
        return isAdmin;
    }

    public void setIsAdmin(boolean isAdmin) {
        this.isAdmin = isAdmin;
    }

    public boolean isIsValidate() {
        return isValidate;
    }

    public void setIsValidate(boolean isValidate) {
        this.isValidate = isValidate;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public String getFacebookURL() {
        return facebookURL;
    }

    public void setFacebookURL(String facebookURL) {
        this.facebookURL = facebookURL;
    }

    public String getUserImage() {
        return userImage;
    }

    public void setUserImage(String userImage) {
        this.userImage = userImage;
    }

    @Override
    public String toString() {
        return "Account{" + "accountID=" + accountID + ", userUsername=" + userUsername + ", userPassword=" + userPassword + ", userEmail=" + userEmail + ", userFullname=" + userFullname + ", createDate=" + createDate + ", facebookURL=" + facebookURL + ", userImage=" + userImage + ", userRating=" + userRating + ", isAdmin=" + isAdmin + ", isValidate=" + isValidate + '}';
    }

    
}
