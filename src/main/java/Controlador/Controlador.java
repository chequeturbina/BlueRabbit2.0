/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Mapeo.Puesto;
import Modelo.PuestoModel;
import Mapeo.Usuario;
import Modelo.UsuarioModel;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Abraham
 */
@Controller
public class Controlador {
   
    PuestoModel puesto = null;
    
    @Autowired
    UsuarioModel usuario_db;

    @RequestMapping(value="/")
    public String inicio(){
        return "inicio";
    }
    
    /**
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/administrador", method = RequestMethod.GET)
    public ModelAndView administrador(ModelMap model) {
        return new ModelAndView("administrador", model);

    }
    
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)
    public ModelAndView registrar(ModelMap model) {
        return new ModelAndView("registrar", model);

    }    
    
    @RequestMapping(value = "/agregarPuesto", method = RequestMethod.POST)
    public ModelAndView agregarPuesto(ModelMap model) {
        return new ModelAndView("agregarPuesto", model);
    }  
     @RequestMapping(value = "/registro", method = RequestMethod.GET)
    public ModelAndView registro(ModelMap model,HttpServletRequest request) {
        Puesto p = null;
        
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String menu = request.getParameter("menu");
        Float longitud = Float.parseFloat(request.getParameter("longitud"));
        Float latitud = Float.parseFloat(request.getParameter("latitud"));
        Float califacion = Float.parseFloat(request.getParameter("califacion"));
        
        if(p != null){
          String error = "El no mbre del puesto ya existe";
            model.addAttribute("mensaje",error);
            return new ModelAndView("error",model);
        }
        else{
            p = new Puesto(nombre,descripcion,califacion,menu,longitud,latitud);
            puesto.insert(p);
        }
        
        return new ModelAndView("agregarPuesto", model);
    }
    
    @RequestMapping(value="/lista",method = RequestMethod.GET)
    public ModelAndView lista(ModelMap model,HttpServletRequest request){
        
        List u = usuario_db.listarUsuarios();
        Usuario uu = (Usuario)u.get(0);
            System.out.println("Nombre: "+uu.getNombre());
            System.out.println("id: " +uu.getIdUsuario());
            System.out.println("correo: " +uu.getCorreo());
        model.addAttribute("usuarios",u); /*la variable, la lista*/
        return new ModelAndView("lista",model); /*la vista, el modelo*/    
    }

    @RequestMapping(value="/mostrarUsuario", method = RequestMethod.GET)
    public ModelAndView profesor(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre1");
        Usuario prof = usuario_db.buscarUsuario(p);
        
        String info = "";
        if (prof == null){
            model.addAttribute("info", info+"No se encontro nungun profesor con ese nombre");
        }else{
            model.addAttribute("info", info+"El usuario es");
            model.addAttribute("profesor", prof);
        }
        return new ModelAndView("mostrarUsuario",model);
    
    }    
}