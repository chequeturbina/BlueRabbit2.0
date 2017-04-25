/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;


import Mapeo.Usuario;
import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

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

    /**
    * Crear un Usuario y guardarlo en la base de datos
    * @param nombre
    * @param correo
    * @param contrasena
    * @param url_foto
    */
    public void crearUsuario(String nombre, String correo, String contrasena, String url_foto){
        Session session = sessionFactory.openSession();
        
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setContrasena(contrasena);
        usuario.setCorreo(correo);
        usuario.setFoto(url_foto);
        
        try{
            session = sessionFactory.openSession();
            Transaction tx = null;
            tx = session.beginTransaction();
            session.save(usuario);
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
            
        }finally{
            session.close();
        }
    }
    
    /**
    * Actualizar un Usuario y guardarlo en la base de datos
    * @param nombre
    * @param correo
    * @param contrasena
    * @param url_foto
    */
    public void actualizarUsuario(String nombre, String correo, String contrasena, String url_foto){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setContrasena(contrasena);
        usuario.setCorreo(correo);
        usuario.setFoto(url_foto);
        
        try{
            
            tx = session.beginTransaction();
            session.update(usuario);
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
    }
    
    /**
    * Eliminar un Usuario y borrarlo de la base de datos
    * @param Usuario
    */
   public void eliminarUsuario(Usuario usuario){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
                
        try{
            
            tx = session.beginTransaction();
            session.delete(usuario);
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
    }

    /**
    * Listar los usuarios
    */
    
    public List listarUsuarios(){
        Session session = sessionFactory.openSession();
        Transaction tx = null; 
        List usuarios = null;
        
        try{
            tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario");
            usuarios =  query.list();
//            Usuario u = (Usuario)usuarios.get(0);
  //          System.out.println("Nombre "+u.getNombre());
    //        System.out.println("id " +u.getIdUsuario());
      //      System.out.println("correo " +u.getCorreo());
        //    System.out.println("url "+u.getFoto());
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
            tx.rollback();
        }finally{
            session.close();
        } 
        return usuarios;
    }

    /**
    * Buscar un usuario por nombre
    * @param nombre
    */    
    public Usuario buscarUsuario(String nombre){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario usuario = null;
        
        try{
            
            tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario as p where p.nombre = :var");
            query.setParameter("var", nombre);
            usuario = (Usuario)query.uniqueResult();
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
        return usuario;
    }

    /**
    * Buscar un usuario por id
    * @param id
    */        
    public Usuario porId(int idUsuario){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario usuario = null;
        try{
            
            tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario where idUsuario = :var");
            query.setParameter("var", idUsuario);
            usuario = (Usuario) query.uniqueResult();
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
        return usuario;
    }
 
    /**
    * Buscar un usuario por correo
    * @param correo
    */        
    public Usuario porCorreo(String correo){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        Usuario usuario = null;
        try{
            
            tx = session.beginTransaction();
            Query query = session.createQuery("from Usuario where correo = :var");
            query.setParameter("var", correo);
            usuario = (Usuario) query.uniqueResult();
            tx.commit();
            
        }catch(Exception e){
            e.printStackTrace();
        }finally{
            session.close();
        }
        return usuario;
    }

    
}
