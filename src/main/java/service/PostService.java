/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.PostDAO;
import java.util.Date;
import java.util.List;
import model.Posts;
import model.Users;

/**
 *
 * @author Admin
 */
public class PostService {
    private final PostDAO postDAO = new PostDAO();
    
    public boolean createPost(Posts post){
        if (post == null || post.getContent() == null || post.getContent().trim().isEmpty() || post.getUserID() == null) {
            return false;
        }

       try {
            postDAO.create(post);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
    
     public List<Posts> getAllPosts() {
        return postDAO.findAllPosts();
    }
     public boolean deletePost(int postId, Users currentUser){
         Posts post = postDAO.findById(postId);
         if(post == null) return false;
         
         if(currentUser.getRole().equalsIgnoreCase("admin") ||
            post.getUserID().getUserID().equals(currentUser.getUserID())){
             return postDAO.deletePostById(postId);
         }
         return false;
     }
     
     public Posts getPostById(int postId){
         return postDAO.findById(postId);
     }
     
     public boolean updatePost(Posts post) {
        try {
            postDAO.update(post);
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
