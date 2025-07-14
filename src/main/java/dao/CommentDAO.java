/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import model.Comments;

/**
 *
 * @author Admin
 */
public class CommentDAO extends GenericDAO<Comments>{
    public CommentDAO() {
        super(Comments.class);
    }

    public List<Comments> findByPostId(int postId) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Comments> query = em.createQuery("SELECT c FROM Comments c WHERE c.postID.postID = :postId ORDER BY c.createdAt ASC", Comments.class);
            query.setParameter("postId", postId);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    
    public Comments findById(int id){
        EntityManager em = getEntityManager();
        try{
            return em.find(Comments.class ,id);
        } finally{
            em.close();
        }
    }
    
    public void update(Comments comment){
        EntityManager em = getEntityManager();
        try{
            em.getTransaction().begin();
            em.merge(comment);
            em.getTransaction().commit();
        } finally{
            em.close();
        }
    }
    
    public List<Comments> findAllWithUserAndPost() {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Comments> query = em.createQuery(
                "SELECT c FROM Comments c JOIN FETCH c.userID JOIN FETCH c.postID ORDER BY c.createdAt DESC",
                Comments.class
            );
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public void toggleVisibility(int commentId) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            Comments comment = em.find(Comments.class, commentId);
            if (comment != null) {
                comment.setVisible(!comment.isVisible());
                em.merge(comment);
            }
            em.getTransaction().commit();
        } finally {
            em.close();
        }
    }
}
