/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;

import Mapeo.Puesto;
import org.hibernate.Query;
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
    
    public void guardar(String nombre,String descripcion,String menu, float latitud, float longitud) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Puesto puesto = new Puesto();
        puesto.setNombre(nombre);
        puesto.setDescripcion(descripcion);
        puesto.setMenu(menu);
        puesto.setLatitud(latitud);
        puesto.setLongitud(longitud);
        try {
           tx = session.beginTransaction();
           session.save(puesto);
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
    
    public void eliminar(Puesto puesto) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
         
           session.delete(puesto);
           
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
    
    public void actualizar(Puesto puesto) {
    
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
         
           session.update(puesto);
           
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
    
    public Puesto getPuesto(String nombre) {
        Puesto puesto = null;
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
           tx = session.beginTransaction();
            String hql = " from Puesto where nombre = :nombre";
            Query query = session.createQuery(hql);
            query.setParameter("nombre", nombre);
            puesto = (Puesto)query.uniqueResult();
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
        return puesto;
    }
    
  
   /* public void insert(Puesto p) {
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
    }*/
    
}

