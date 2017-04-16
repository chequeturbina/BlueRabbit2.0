/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 * también se busca a una comida 
 */
package Modelo;

import Mapeo.Comida;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

/**
 *
 * @author Abraham
 */
public class ComidaModel {
 
      //Atributo para una nueva sesion 
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
    
    /**
     * Guarda a un comida de la base de datos.
     * @param comida 
     */
    public void guardar(Comida comida) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
         
           session.persist(comida);
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){ 
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
    
    }
    
    /**
     * Actualiza a un comida de la base de datos.
     * @param comida
     */
    public void actualizar(Comida comida) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
         
           session.update(comida);
           
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){ 
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
    
    }
    
  
    /**
     * Elimina a un comida de la base de datos.
     * @param comida
     */
    public void eliminar(Comida comida) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
         
           session.delete(comida);
           
           tx.commit();
        }
        catch (Exception e) {
           if (tx!=null){ 
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
    
    }
  
    /**
     * Lista todas las comidas de la base de datos.
     * @param none
     */    
    public List listar() {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List lista = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Comida");
            lista = query.list();
            tx.commit();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();

        }
        return lista;
    }

    /**
     * Busca una comida por su nombre
     * @param nombre
     */    
    public Comida getComida(String nombre) {
        Comida comida = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
            String hql = " from Comida where nombre = :nombre";
            Query query = session.createQuery(hql);
            query.setParameter("nombre", nombre);
            comida = (Comida)query.uniqueResult();
            tx.commit();
           
        }
        catch (Exception e) {
           if (tx!=null){ 
               tx.rollback();
           }
           e.printStackTrace(); 
        }finally {
           session.close();
        }
        return comida;
    }
    
    
    
    
}
