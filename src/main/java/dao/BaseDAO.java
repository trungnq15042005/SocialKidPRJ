/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
/**
 *
 * @author Admin
 */
public abstract class BaseDAO {
    protected static final EntityManagerFactory emf = Persistence.createEntityManagerFactory("SocialKidPU");
    
    public static EntityManager getEntityManager(){
        return emf.createEntityManager();
    }
    
    public void close(){
        emf.close();
    }
}
