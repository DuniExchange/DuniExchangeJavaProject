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
public class Post_Image {
    private String postImageURL;

    public Post_Image() {
    }

    public Post_Image(String postImageURL) {
        this.postImageURL = postImageURL;
    }

    public String getPostImageURL() {
        return postImageURL;
    }

    public void setPostImageURL(String postImageURL) {
        this.postImageURL = postImageURL;
    }

    @Override
    public String toString() {
        return "Post_Image{" + "postImageURL=" + postImageURL + '}';
    }

    
    
}
