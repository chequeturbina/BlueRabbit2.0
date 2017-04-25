/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;

import Mapeo.Puesto;
import java.util.List;
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
    
     public List listarpuestos(){
         Session session = sessionFactory.openSession();
         Transaction tx = null;
         List puestos = null;
         try{
             tx = session.beginTransaction();
             Query query = session.createQuery("from  Puesto");
             puestos = query.list();
             tx.commit();
         } catch (Exception e){
             e.printStackTrace();
             tx.rollback();
         } finally{
             session.close();
         }
         return puestos;
     }
     
     public void update(long id_Puesto, String nombre, String descripcion, String menu) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            Puesto puesto = (Puesto) session.get(Puesto.class, id_Puesto);
            tx = session.beginTransaction();

            puesto.setNombre(nombre);
            puesto.setDescripcion(descripcion);
            puesto.setMenu(menu);
            session.update(puesto);
            tx.commit();
        } catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

    }
    
}

