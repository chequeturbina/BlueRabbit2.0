/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Mapeo.Puesto;
import Modelo.PuestoModel;
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
 * @author Emmanuel
 */
@Controller
public class controladorbase {
   
    @Autowired
    PuestoModel puesto_db;
    
    @RequestMapping(value="/crearPuesto", method = RequestMethod.POST)
    public ModelAndView creaPuesto(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String menu = request.getParameter("menu");
        float latitud = Float.parseFloat(request.getParameter("latitud"));
        float longitud = Float.parseFloat(request.getParameter("longitud"));
        puesto_db.guardar(nombre, descripcion, menu,latitud,longitud);
        return new ModelAndView("/principalbase"); 
        
    }
    
    @RequestMapping(value="/listapuesto", method=RequestMethod.GET)
    public ModelAndView listapuesto(ModelMap model,HttpServletRequest request){
        List u = puesto_db.listarpuestos();
        model.addAttribute("puestos",u);
        return new ModelAndView("listapuesto",model);
    }
    
    @RequestMapping(value="/actualizarpuesto", method = RequestMethod.POST)
               public ModelAndView actualizarpuesto(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
                 String nombrebuscar = request.getParameter("nombrebuscar");
                 String nombre = request.getParameter("nombre");
                 String descripcion = request.getParameter("descripcion");
                 String menu = request.getParameter("menu");
                 Puesto puesto = puesto_db.buscarPuesto(nombrebuscar);
                 String err = "";
                 if(puesto == null){
                     model.addAttribute("mensaje",err + "No se encontro el Puesto");
                     return new ModelAndView("ErrorIH",model);
                 } else {
                     if(nombre.equals("") != true){
                         puesto.setNombre(nombre);
                         puesto_db.update(puesto);
                     }
                     if(descripcion.equals("") != true){
                         puesto.setDescripcion(descripcion);
                         puesto_db.update(puesto);
                     }
                     if(menu.equals("") != true){
                         puesto.setMenu(menu);
                         puesto_db.update(puesto);
                     }
               }
                 return new ModelAndView("home_admi",model);
               }
    
    @RequestMapping(value="/puesto", method = RequestMethod.POST)
    public ModelAndView buscarPuesto(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre"); 
        Puesto puesto = puesto_db.buscarPuesto(p);
        
      
        if (puesto == null){
            String info = "";
            model.addAttribute("mensaje", info + "No se encontro ningun puesto con ese nombre");
            return new ModelAndView("ErrorIH",model);
        }
         String nombre = puesto.getNombre();
         String descripcion = puesto.getDescripcion();
         String menu = puesto.getMenu();
         model.addAttribute("nombre", nombre);
         model.addAttribute("descripcion", descripcion);
         model.addAttribute("menu", menu);
        
        return new ModelAndView("puesto",model);
    }
    
}