/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;

import org.hibernate.SessionFactory;

/**
 *
 * @author Abraham
 */
public class UsuarioModel {
     
      //Atributo para una nueva sesion 
    private SessionFactory sessionFactory;

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

}
