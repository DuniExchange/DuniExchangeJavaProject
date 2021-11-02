package Entity;

import java.util.Date;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author acer
 *
 */
public class Post_Comment {

    private int ProductCommentID;
    private String cmt;
    private String tcmt;
    private int PostIDcmt;
    private int userIDcmt;
    private String userFullnamecmt;
    private String userAvatarURLcmt;
    private int userRatingcmt;

    public Post_Comment() {
    }

    public Post_Comment(int ProductCommentID, String cmt, String tcmt, int PostIDcmt, int userIDcmt, String userFullnamecmt, String userAvatarURLcmt, int userRatingcmt) {
        this.ProductCommentID = ProductCommentID;
        this.cmt = cmt;
        this.tcmt = tcmt;
        this.PostIDcmt = PostIDcmt;
        this.userIDcmt = userIDcmt;
        this.userFullnamecmt = userFullnamecmt;
        this.userAvatarURLcmt = userAvatarURLcmt;
        this.userRatingcmt = userRatingcmt;
    }

    public int getProductCommentID() {
        return ProductCommentID;
    }

    public void setProductCommentID(int ProductCommentID) {
        this.ProductCommentID = ProductCommentID;
    }

    public String getCmt() {
        return cmt;
    }

    public void setCmt(String cmt) {
        this.cmt = cmt;
    }

    

    public int getPostIDcmt() {
        return PostIDcmt;
    }

    public void setPostIDcmt(int PostIDcmt) {
        this.PostIDcmt = PostIDcmt;
    }

    public int getUserIDcmt() {
        return userIDcmt;
    }

    public void setUserIDcmt(int userIDcmt) {
        this.userIDcmt = userIDcmt;
    }

    public String getUserFullnamecmt() {
        return userFullnamecmt;
    }

    public void setUserFullnamecmt(String userFullnamecmt) {
        this.userFullnamecmt = userFullnamecmt;
    }

    public String getUserAvatarURLcmt() {
        return userAvatarURLcmt;
    }

    public void setUserAvatarURLcmt(String userAvatarURLcmt) {
        this.userAvatarURLcmt = userAvatarURLcmt;
    }

    public int getUserRatingcmt() {
        return userRatingcmt;
    }

    public void setUserRatingcmt(int userRatingcmt) {
        this.userRatingcmt = userRatingcmt;
    }

    public String getTcmt() {
        return tcmt;
    }

    public void setTcmt(String tcmt) {
        this.tcmt = tcmt;
    }

    @Override
    public String toString() {
        return "Post_Comment{" + "ProductCommentID=" + ProductCommentID + ", cmt=" + cmt + ", tcmt=" + tcmt + ", PostIDcmt=" + PostIDcmt + ", userIDcmt=" + userIDcmt + ", userFullnamecmt=" + userFullnamecmt + ", userAvatarURLcmt=" + userAvatarURLcmt + ", userRatingcmt=" + userRatingcmt + '}';
    }

    
}
