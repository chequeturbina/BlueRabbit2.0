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

    @RequestMapping(value = "/user/comentar")
    public ModelAndView comentarios(ModelMap model, HttpServletRequest request) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        Usuario user = usuario_db.porCorreo(currentPrincipalName);
        String cadena = request.getParameter("comentario");
        int calificacion = Integer.parseInt(request.getParameter("calificacion"));

        Puesto puesto = puesto_db.buscarPuesto(request.getParameter("puesto"));
        Comentarios comentario = new Comentarios();
        comentario.setComentarios(cadena);
        comentario.setCalificacion(calificacion);
        comentario.setPuesto(puesto);
        comentario.setUsuario(user);

        String nombre = puesto.getNombre();
        String descripcion = puesto.getDescripcion();
        String menu = puesto.getMenu();
        List um = puesto_db.listarpuestos();

        model.addAttribute("nombre", nombre);
        model.addAttribute("descripcion", descripcion);
        model.addAttribute("menu", menu);
        model.addAttribute("puestos", um);

        int id = user.getIdUsuario();
        comentarios_db.guardar(comentario);
        List un = comentarios_db.listarComentarios(puesto);
        model.addAttribute("comentarios", un);
        model.addAttribute("usuarin", id);
        return new ModelAndView("home_user", model);
    }

    @RequestMapping(value = "/user/eliminarComentario")
    public ModelAndView borrarComentarios(ModelMap model, HttpServletRequest request) {
        Puesto puesto = puesto_db.buscarPuesto(request.getParameter("puesto"));
        List un = comentarios_db.listarComentarios(puesto);
        int id = Integer.parseInt(request.getParameter("borrar"));
        Comentarios comentarios = comentarios_db.buscarComentario(id);
        comentarios_db.eliminar(comentarios);
        model.addAttribute("comentarios", un);
        model.addAttribute("usuarin", id);        
        return new ModelAndView("redirect:/user/home", model);
    }
 
 
    @RequestMapping(value = "/administrador/eliminarComentario")
    public ModelAndView borrarComentariosAdmi(ModelMap model, HttpServletRequest request) {
        Puesto puesto = puesto_db.buscarPuesto(request.getParameter("puesto"));
        List un = comentarios_db.listarComentarios(puesto);
        int id = Integer.parseInt(request.getParameter("borrar"));
        Comentarios comentarios = comentarios_db.buscarComentario(id);
        comentarios_db.eliminar(comentarios);
        model.addAttribute("comentarios", un);
        model.addAttribute("usuarin", id);        
        return new ModelAndView("redirect:/administrador/home", model);
    }
            
            
}
