/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Entity;

import java.util.Date;

/**
 *
 * @author ADMIN
 */
public class Post_Account {
    private int postID;
    private int post_AccountID;
    private String postTitle;
    private Date postDate;
    private String postDescription;
    private int postLike;
    private String postThumbnailURL;
    private boolean isDisable;
    private String userUsername;
    private String userPassword;
    private String userEmail;
    private String userFullname;
    private java.sql.Date createDate;
    private String facebookURL;
    private String userImage;
    private float userRating;
    private boolean isAdmin;
    private boolean isValidate;
    

    public Post_Account() {
    }

    public Post_Account(int postID, int post_AccountID, String postTitle, Date postDate, String postDescription, int postLike, String postThumbnailURL, boolean isDisable, String userUsername, String userPassword, String userEmail, String userFullname, java.sql.Date createDate, String facebookURL, String userImage, float userRating, boolean isAdmin, boolean isValidate) {
        this.postID = postID;
        this.post_AccountID = post_AccountID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postDescription = postDescription;
        this.postLike = postLike;
        this.postThumbnailURL = postThumbnailURL;
        this.isDisable = isDisable;
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
    public Post_Account(int postID, int post_AccountID, String postTitle, Date postDate, String postDescription, int postLike, String postThumbnailURL, boolean isDisable, String userUsername, String userEmail, String userFullname, java.sql.Date createDate, String facebookURL, String userImage, float userRating, boolean isAdmin, boolean isValidate) {
        this.postID = postID;
        this.post_AccountID = post_AccountID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postDescription = postDescription;
        this.postLike = postLike;
        this.postThumbnailURL = postThumbnailURL;
        this.isDisable = isDisable;
        this.userUsername = userUsername;
        this.userEmail = userEmail;
        this.userFullname = userFullname;
        this.createDate = createDate;
        this.facebookURL = facebookURL;
        this.userImage = userImage;
        this.userRating = userRating;
        this.isAdmin = isAdmin;
        this.isValidate = isValidate;
    }

    public Post_Account(int postID, String postTitle, Date postDate, int postLike, String postThumbnailURL) {
        this.postID = postID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postLike = postLike;
        this.postThumbnailURL = postThumbnailURL;
    }

    

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getPost_AccountID() {
        return post_AccountID;
    }

    public void setPost_AccountID(int post_AccountID) {
        this.post_AccountID = post_AccountID;
    }

    public String getPostTitle() {
        return postTitle;
    }

    public void setPostTitle(String postTitle) {
        this.postTitle = postTitle;
    }

    public Date getPostDate() {
        return postDate;
    }

    public void setPostDate(Date postDate) {
        this.postDate = postDate;
    }

    public String getPostDescription() {
        return postDescription;
    }

    public void setPostDescription(String postDescription) {
        this.postDescription = postDescription;
    }

    public int getPostLike() {
        return postLike;
    }

    public void setPostLike(int postLike) {
        this.postLike = postLike;
    }

    public String getPostThumbnailURL() {
        return postThumbnailURL;
    }

    public void setPostThumbnailURL(String postThumbnailURL) {
        this.postThumbnailURL = postThumbnailURL;
    }

    public boolean isIsDisable() {
        return isDisable;
    }

    public void setIsDisable(boolean isDisable) {
        this.isDisable = isDisable;
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

    public java.sql.Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(java.sql.Date createDate) {
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

    public float getUserRating() {
        return userRating;
    }

    public void setUserRating(float userRating) {
        this.userRating = userRating;
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

    @Override
    public String toString() {
        return "Post_Account{" + "postID=" + postID + ", post_AccountID=" + post_AccountID + ", postTitle=" + postTitle + ", postDate=" + postDate + ", postDescription=" + postDescription + ", postLike=" + postLike + ", postThumbnailURL=" + postThumbnailURL + ", isDisable=" + isDisable + ", userUsername=" + userUsername + ", userPassword=" + userPassword + ", userEmail=" + userEmail + ", userFullname=" + userFullname + ", createDate=" + createDate + ", facebookURL=" + facebookURL + ", userImage=" + userImage + ", userRating=" + userRating + ", isAdmin=" + isAdmin + ", isValidate=" + isValidate + '}';
    }
    
    
}
