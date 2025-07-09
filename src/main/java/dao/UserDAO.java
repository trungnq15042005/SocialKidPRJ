/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import static dao.BaseDAO.getEntityManager;
import model.Users;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
/**
 *
 * @author Admin
 */
public class UserDAO extends GenericDAO<Users>{
    public UserDAO() {
        super(Users.class);
    }
    public Users findByUsername(String username) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Users u WHERE u.username = :username", Users.class)
                     .setParameter("username", username)
                     .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace(); 
            return null;
        } finally {
            em.close();
        }
    }

    public Users findByEmail(String email) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Users u WHERE u.email = :email", Users.class)
                     .setParameter("email", email)
                     .getSingleResult();
        } catch (NoResultException e) {
            return null;
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        } finally {
            em.close();
        }
    }

    public List<Users> findByRole(String role) {
        EntityManager em = getEntityManager();
        try {
            return em.createQuery("SELECT u FROM Users u WHERE u.role = :role", Users.class)
                     .setParameter("role", role)
                     .getResultList();
        } finally {
            em.close();
        }
    }
}