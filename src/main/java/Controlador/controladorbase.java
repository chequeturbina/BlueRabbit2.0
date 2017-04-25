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
public class controladorbase {
   
    @Autowired
    PuestoModel puesto_db;
    Puesto p ;

    @RequestMapping(value="/crearPuesto", method = RequestMethod.POST)
    public ModelAndView creaPuesto(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        String menu = request.getParameter("menu");
        float latitud = Float.parseFloat(request.getParameter("latitud"));
        float longitud = Float.parseFloat(request.getParameter("longitud"));
       
        p = puesto_db.getPuesto(nombre);
       
        if(p != null ){
            String error = "El nombre del puesto ya existe";
            model.addAttribute("mensaje",error);
            return new ModelAndView("error",model);
        }
        else{
            puesto_db.guardar(nombre, descripcion, menu,latitud,longitud);
        }
        return new ModelAndView("/principalbase"); 
        
    }
}