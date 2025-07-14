/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import dao.CommentDAO;
import java.util.Date;
import java.util.List;
import model.Comments;
import model.Posts;
import model.Users;

/**
 *
 * @author Admin
 */
public class CommentService {
    private final CommentDAO commentDAO = new CommentDAO();

    public void addComment(String text, Users user, Posts post) {
        if (text != null && !text.trim().isEmpty() && user != null && post != null) {
            Comments comment = new Comments();
            comment.setCommentText(text.trim());
            comment.setCreatedAt(new Date());
            comment.setPostID(post);
            comment.setUserID(user);
            commentDAO.create(comment);
        }
    }

    public List<Comments> getCommentsByPost(int postId) {
        return commentDAO.findByPostId(postId);
    }
    
    public void deleteComment(int commentId){
        commentDAO.delete(commentId);
    }
    
    public boolean updateComment(int commentId, String newText){
        Comments comment = commentDAO.findById(commentId);
            if (comment != null) {
            comment.setCommentText(newText);
            commentDAO.update(comment);
            return true;
        }
        return false;   
    }
    
    public Comments findCommentById(int commentId) {
        return commentDAO.findById(commentId);
    }
    public List<Comments> getAllComments() {
        return commentDAO.findAllWithUserAndPost();
    }

    public void toggleCommentVisibility(int commentId) {
        commentDAO.toggleVisibility(commentId);
    }
}
