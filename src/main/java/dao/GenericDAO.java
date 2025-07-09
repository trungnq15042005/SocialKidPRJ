/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import static dao.BaseDAO.getEntityManager;
import java.util.List;
import javax.persistence.EntityManager;
/**
 *
 * @author Admin
 */
public class GenericDAO<T> extends BaseDAO {
    private final Class<T> entityClass;

    public GenericDAO(Class<T> entityClass) {
        this.entityClass = entityClass;
    }
    
     public T findById(Object id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(entityClass, id);
        } finally {
            em.close();
        }
    }

    public List<T> findAll() {
        EntityManager em = getEntityManager();
        try {
            String queryStr = "SELECT e FROM " + entityClass.getSimpleName() + " e";
            return em.createQuery(queryStr, entityClass).getResultList();
        } finally {
            em.close();
        }
    }

    public void create(T entity) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error while creating entity: " + entityClass.getSimpleName(), e);
        } finally {
            em.close();
        }
    }

    public void update(T entity) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            em.merge(entity);
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error while updating entity: " + entityClass.getSimpleName(), e);
        } finally {
            em.close();
        }
    }

    public void delete(Object id) {
        EntityManager em = getEntityManager();
        try {
            em.getTransaction().begin();
            T entity = em.find(entityClass, id);
            if (entity != null) {
                em.remove(entity);
            }
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw new RuntimeException("Error while deleting entity: " + entityClass.getSimpleName(), e);
        } finally {
            em.close();
        }
    }

    public List<T> findByPage(int offset, int limit) {
        EntityManager em = getEntityManager();
        try {
            String queryStr = "SELECT e FROM " + entityClass.getSimpleName() + " e";
            return em.createQuery(queryStr, entityClass)
                     .setFirstResult(offset)
                     .setMaxResults(limit)
                     .getResultList();
        } finally {
            em.close();
        }
    }

    public long countAll() {
        EntityManager em = getEntityManager();
        try {
            String queryStr = "SELECT COUNT(e) FROM " + entityClass.getSimpleName() + " e";
            return em.createQuery(queryStr, Long.class).getSingleResult();
        } finally {
            em.close();
        }
    }
}