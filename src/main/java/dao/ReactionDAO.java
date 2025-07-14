/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import model.Posts;
import model.Reactions;
import model.Users;

/**
 *
 * @author Admin
 */
public class ReactionDAO extends GenericDAO<Reactions> {
    public ReactionDAO() {
        super(Reactions.class);
    }

    public Reactions findByUserAndPost(Users user, Posts post) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Reactions> query = em.createQuery(
                "SELECT r FROM Reactions r WHERE r.userID = :user AND r.postID = :post", Reactions.class);
            query.setParameter("user", user);
            query.setParameter("post", post);
            List<Reactions> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            em.close();
        }
    }

    public long countLikes(Posts post) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Long> query = em.createQuery(
                "SELECT COUNT(r) FROM Reactions r WHERE r.postID = :post AND r.reactionType = 'like'", Long.class);
            query.setParameter("post", post);
            return query.getSingleResult();
        } finally {
            em.close();
        }
    }
}
