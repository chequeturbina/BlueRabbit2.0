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
    
     @RequestMapping(value="/")
    public ModelAndView inicio(ModelMap model){
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("index",model);
    }
    
    //Agrega un puesto a la base
    @RequestMapping(value="/crearPuesto", method = RequestMethod.GET)
    public ModelAndView creaPuesto(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String menu = request.getParameter("menu");
        float latitud = Float.parseFloat(request.getParameter("latitud"));
        float longitud = Float.parseFloat(request.getParameter("longitud"));
        Puesto puesto = puesto_db.buscarPuesto(nombre);
        String err = "";
        if (puesto != null){
             err = "El puesto ya existe";
             model.addAttribute("alerta",err);
             return new ModelAndView("errorP",model);
        }else{
            Puesto a = new Puesto();
            a.setNombre(nombre);
            a.setDescripcion(descripcion);
            a.setMenu(menu);
            a.setLatitud(latitud);
            a.setLongitud(longitud);
            puesto_db.guardar(a);
        }
             err = "Puesto Agregado";
             model.addAttribute("alerta",err);
             return new ModelAndView("alert",model);
    }
    
    //Modifica el puesto
    @RequestMapping(value="/actualizarpuesto", method = RequestMethod.POST)
               public ModelAndView actualizarpuesto(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
                 String nombrebuscar = request.getParameter("nombrebuscar");
                 String nombre = request.getParameter("nombre");
                 String descripcion = request.getParameter("descripcion");
                 String menu = request.getParameter("menu");
                 Puesto puesto = puesto_db.buscarPuesto(nombrebuscar);
                 String err = "";
                 if(puesto == null){
                      err = "No se encontro el puesto con el nombre solicitado";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("errorP",model);
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
                 err = "Puesto Modificado";
                 model.addAttribute("alerta",err);
                 return new ModelAndView("alert",model);
               }
    
    //Busca Puesto para modificar
    @RequestMapping(value="/puesto", method = RequestMethod.POST)
    public ModelAndView buscarPuesto(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre"); 
        Puesto puesto = puesto_db.buscarPuesto(p);
        String err = "";
        if (puesto == null){
            err = "No se encontro el puesto con el nombre solicitado";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("errorP",model);
        }else{
         String nombre = puesto.getNombre();
         String descripcion = puesto.getDescripcion();
         String menu = puesto.getMenu();
         model.addAttribute("nombre", nombre);
         model.addAttribute("descripcion", descripcion);
         model.addAttribute("menu", menu);
         List um = puesto_db.listarpuestos();
         model.addAttribute("puestos",um);
        return new ModelAndView("modificarpuesto",model);
    }
    }
    
    //Buscador de puesto para eliminarlo
    @RequestMapping(value="/puesto1", method = RequestMethod.POST)
    public ModelAndView buscarPuesto1(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre"); 
        Puesto puesto = puesto_db.buscarPuesto(p);
        String err = "";
        if (puesto == null){
            err = "No se encontro el puesto con el nombre solicitado";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("errorP",model);
        }else{
         String nombre = puesto.getNombre();
         String descripcion = puesto.getDescripcion();
         String menu = puesto.getMenu();
         model.addAttribute("nombre", nombre);
         model.addAttribute("descripcion", descripcion);
         model.addAttribute("menu", menu);
         List um = puesto_db.listarpuestos();
         model.addAttribute("puestos",um);
        return new ModelAndView("eliminarpuesto",model);
    }
    }
    
    //Eliminar Puesto
    @RequestMapping(value = "/eliminar", method = RequestMethod.GET)
    public ModelAndView eliminar(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String nombre = request.getParameter("nombre");
        Puesto puesto = puesto_db.buscarPuesto(nombre);
        puesto_db.eliminarPuesto(puesto);
        String err ="";
        err = "Puesto Eliminado";
        model.addAttribute("alerta",err);
        return new ModelAndView("alert",model);
    }
    

    }    
