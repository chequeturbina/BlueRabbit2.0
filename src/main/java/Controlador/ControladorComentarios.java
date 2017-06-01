/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Mapeo.Comentarios;
import Mapeo.Puesto;
import Mapeo.Usuario;
import Modelo.ComentariosModel;
import Modelo.PuestoModel;
import Modelo.UsuarioModel;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author layon
 */
@Controller
public class ControladorComentarios {
     
    @Autowired
    PuestoModel puesto_db;
    
    @Autowired
    ComentariosModel comentarios_db;
    
    @Autowired 
    UsuarioModel usuario_db;
    
    @RequestMapping(value="/user/comentar", method = RequestMethod.GET)
    public ModelAndView comentarios(ModelMap model,HttpServletRequest request){ 
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();
        System.out.println(currentPrincipalName);
        Usuario user = usuario_db.porCorreo(currentPrincipalName);
        System.out.println(user.getNombre());
         String cadena = request.getParameter("comentario");
        
         Puesto puesto = puesto_db.buscarPuesto(request.getParameter("puesto"));
         System.out.println(puesto.getNombre());
         Comentarios comentario = new Comentarios();
        comentario.setComentarios(cadena);
        comentario.setCalificacion(0);
        comentario.setPuesto(puesto);
        comentario.setUsuario(user);
        
        System.out.println(comentario.getCalificacion());
        System.out.println(comentario.getComentarios());
        System.out.println(comentario.getIdComentarios());
        
        String nombre = puesto.getNombre();
         String descripcion = puesto.getDescripcion();
         String menu = puesto.getMenu();
        List um = puesto_db.listarpuestos();

          model.addAttribute("nombre", nombre);
         model.addAttribute("descripcion", descripcion);
         model.addAttribute("menu", menu);
         model.addAttribute("puestos",um);
        
         
         System.out.println(puesto.getNombre());
        System.out.println(user.getNombre());
        //System.out.println(comentario.getIdComentarios());
        int id = user.getIdUsuario();
        comentarios_db.guardar(comentario);
        List un = comentarios_db.listarComentarios(puesto);
         model.addAttribute("comentarios",un);
         model.addAttribute("usuarin",id);
        return new ModelAndView("home_user",model);
    }
    
    @RequestMapping(value="/user/eliminarComentario", method = RequestMethod.GET)
    public ModelAndView borrarComentarios(ModelMap model,HttpServletRequest request){
        //Comentarios comen = comentarios_db.buscarComentario(request.getParameter("borrar"));
        System.out.println(request.getParameter("borrar"));
        return new ModelAndView("home_user",model);
    }    

}
