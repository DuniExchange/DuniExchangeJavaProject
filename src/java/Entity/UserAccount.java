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
public class UserAccount {
    private int userID;
    private String userUsername;
    private String userPassword;
    private String userEmail;
    private String userFullname;
    private Date userCreateDate;
    private String userFacebookURL;
    private String userAvatarURL;
    private float userRating;
    private boolean isAdmin;
    private boolean isValidate;

    public UserAccount() {
    }

    public UserAccount(int userID, String userUsername, String userPassword, String userEmail, String userFullname, Date userCreateDate, String userFacebookURL, String userAvatarURL, float userRating, boolean isAdmin, boolean isValidate) {
        this.userID = userID;
        this.userUsername = userUsername;
        this.userPassword = userPassword;
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.userCreateDate = userCreateDate;
        this.userFacebookURL = userFacebookURL;
        this.userAvatarURL = userAvatarURL;
        this.userRating = userRating;
        this.isAdmin = isAdmin;
        this.isValidate = isValidate;
    }

    public UserAccount(int userID, String userUsername, String userEmail, String userFullname, String userAvatarURL, boolean isAdmin) {
        this.userID = userID;
        this.userUsername = userUsername;
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.userAvatarURL = userAvatarURL;
        this.isAdmin = isAdmin;
    }
    

    public float getUserRating() {
        return userRating;
    }

    public void setUserRating(float userRating) {
        this.userRating = userRating;
    }




    public int getUserID() {
        return userID;
    }

    public void setUserID(int accountID) {
        this.userID = accountID;
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

    public Date getUserCreateDate() {
        return userCreateDate;
    }

    public void setUserCreateDate(Date userCreateDate) {
        this.userCreateDate = userCreateDate;
    }

    public String getUserFacebookURL() {
        return userFacebookURL;
    }

    public void setUserFacebookURL(String userFacebookURL) {
        this.userFacebookURL = userFacebookURL;
    }

    public String getUserAvatarURL() {
        return userAvatarURL;
    }

    public void setUserAvatarURL(String userAvatarURL) {
        this.userAvatarURL = userAvatarURL;
    }

    @Override
    public String toString() {
        return "UserAccount{" + "userID=" + userID + ", userUsername=" + userUsername + ", userPassword=" + userPassword + ", userEmail=" + userEmail + ", userFullname=" + userFullname + ", userCreateDate=" + userCreateDate + ", userFacebookURL=" + userFacebookURL + ", userAvatarURL=" + userAvatarURL + ", userRating=" + userRating + ", isAdmin=" + isAdmin + ", isValidate=" + isValidate + '}';
    }
}
