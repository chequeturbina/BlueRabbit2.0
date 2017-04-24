/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Mapeo.Puesto;
import Modelo.PuestoModel;
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
    
}