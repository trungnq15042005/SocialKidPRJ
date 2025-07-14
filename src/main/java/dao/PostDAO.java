/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import model.Posts;

/**
 *
 * @author Admin
 */
public class PostDAO extends GenericDAO<Posts>{
    public PostDAO() {
        super(Posts.class);
    }
    public List<Posts> findAllPosts() {
        EntityManager em = getEntityManager();
        try {
            String jpql = "SELECT DISTINCT p FROM Posts p LEFT JOIN FETCH p.commentsList ORDER BY p.createdAt DESC";
            TypedQuery<Posts> query = em.createQuery(jpql, Posts.class);
            return query.getResultList();
        } finally {
            em.close();
        }
    }
    public boolean deletePostById(int postId) {
        EntityManager em = getEntityManager();
        try {
            Posts post = em.find(Posts.class, postId);
            if (post != null) {
                em.getTransaction().begin();
                em.remove(post);
                em.getTransaction().commit();
                return true;
            }
            return false;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        } finally {
            em.close();
        }
    }
}
