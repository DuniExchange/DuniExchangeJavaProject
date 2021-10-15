/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Entity;

import java.util.Date;

/**
 *
 * @author Minky
 */
public class Post {
    private int postID;
    private int postUserID;
    private String postTitle;
    private Date postDate;
    private String postDescription;
    private int postLike;
    private String postThumbnailURL;
    private boolean isDisable;

    public Post() {
    }

    public Post(int postID, int postUserID, String postTitle, Date postDate, String postDescription, int postLike, String postThumbnailURL, boolean isDisable) {
        this.postID = postID;
        this.postUserID = postUserID;
        this.postTitle = postTitle;
        this.postDate = postDate;
        this.postDescription = postDescription;
        this.postLike = postLike;
        this.postThumbnailURL = postThumbnailURL;
        this.isDisable = isDisable;
    }

    public int getPostID() {
        return postID;
    }

    public void setPostID(int postID) {
        this.postID = postID;
    }

    public int getPostUserID() {
        return postUserID;
    }

    public void setPostUserID(int postUserID) {
        this.postUserID = postUserID;
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

    @Override
    public String toString() {
        return "Post{" + "postID=" + postID + ", postUserID=" + postUserID + ", postTitle=" + postTitle + ", postDate=" + postDate + ", postDescription=" + postDescription + ", postLike=" + postLike + ", postThumbnailURL=" + postThumbnailURL + ", isDisable=" + isDisable + '}';
    }
    
    
}
