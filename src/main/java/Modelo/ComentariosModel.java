/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;

import Mapeo.Comentarios;
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
public class ComentariosModel {

    //Atributo para una nueva sesion 
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public void guardar(Comentarios comentario) { //También guarda la calificacion, por default es 0

        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();

            session.save(comentario);
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

    public Comentarios buscarComentario(int id) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Comentarios comentario = null;

        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Comentarios where idComentarios = :var");
            query.setParameter("var", id);
            comentario = (Comentarios) query.uniqueResult();
            tx.commit();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            session.close();
        }
        return comentario;
    }

    public List listarComentarios(Puesto puesto) {
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        List comentarios = null;
        try {
            tx = session.beginTransaction();
            Query query = session.createQuery("from Comentarios where Puesto_idPuesto = :var");
            query.setParameter("var",puesto.getId_puesto());
            comentarios = query.list();
            tx.commit();
        } catch (Exception e) {
            tx.rollback();
            e.printStackTrace();

        } finally {
            session.close();
        }
        return comentarios;
    }

    public void eliminar(Comentarios comentario) { //También elimina la calificacion

        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.delete(comentario);
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

    public void actualizar(Comentarios comentario) { //También actualiza la calificacion

        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try {
            tx = session.beginTransaction();
            session.update(comentario);
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
