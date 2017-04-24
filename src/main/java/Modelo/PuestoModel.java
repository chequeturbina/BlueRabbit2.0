/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;

import Mapeo.Puesto;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Abraham
 */
public class PuestoModel {
 
      //Atributo para una nueva sesion 
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    public void insert(Puesto p) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            
            session.persist(p);
            tx.commit();
         
        } catch (Exception e) {
            if(tx != null){
                e.printStackTrace();
            }
        } finally {
            session.close();
        }
    }
    
}
