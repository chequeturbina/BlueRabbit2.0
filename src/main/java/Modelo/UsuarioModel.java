/*
 * Este es como el DAO, se debe agregar el insert, update, delete, list
 */
package Modelo;


import Mapeo.Usuario;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.channels.FileChannel;
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
    public void crearUsuario(String nombre, String correo, String contrasena, String foto, int edad, String carrera, String rol_usuario){
        foto = "C:/Users/emmanuel/Documents/NetBeansProjects/BlueRabbit2.0/src/main/webapp/imagenes/profile/all.jpg";
        Session session = sessionFactory.openSession();
        
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setContrasena(contrasena);
        usuario.setCorreo(correo);
        usuario.setFoto(foto); //Foto predeterminada por todos
        usuario.setEdad(edad);
        usuario.setCarrera(carrera);
        usuario.setRol_usuario(rol_usuario); //Para agregar un nuevo admin, aquí se modifica        
        
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
        String f = "C:/Users/emmanuel/Documents/NetBeansProjects/BlueRabbit2.0/src/main/webapp/imagenes/profile/"+usuario.getIdUsuario()+".jpg";
        try{
            FileInputStream fis = new FileInputStream(foto);
            FileOutputStream fos = new FileOutputStream(f);
            FileChannel inChannel = fis.getChannel();
            FileChannel outChannel = fos.getChannel();
            inChannel.transferTo(0, inChannel.size(), outChannel);
            fis.close();
            fos.close();
        } catch (IOException e) {
            System.err.println("Error al Generar Copia"); //No debe pasar
        }
        usuario.setFoto(f);
        updateusuario(usuario);
    }
    
     /**
    * Actualizar un Usuario y guardarlo en la base de datos
     * @param usuario
    */
    public void updateusuario(Usuario usuario){
        Session session = sessionFactory.openSession();
        Transaction tx = null;
        try{
            
            tx = session.beginTransaction();
            session.update(usuario);
            tx.commit();
            
        }catch (Exception e) {
            if (tx != null) {
                tx.rollback();
            }
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
            tx.commit();
            
        }catch(Exception e){
            tx.rollback();
            e.printStackTrace();
            
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