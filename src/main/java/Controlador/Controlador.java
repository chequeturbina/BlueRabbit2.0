/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

import Mapeo.Comida;
import Modelo.ComidaModel;
import java.util.List;
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
    /*
    * Controlador para la Comida
    */
    @Autowired
    ComidaModel comida_db;
    
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
    
    

    @RequestMapping(value="/comida", method = RequestMethod.GET)
    public ModelAndView comida(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre1");
        Comida prof = comida_db.getComida(p);
        
        String info = "";
        if (prof == null){
            model.addAttribute("info", info+"No se encontro nungun comida con ese nombre");
        }else{
            model.addAttribute("info", info+"El comida es: ");
            model.addAttribute("comida", prof);
        }
        return new ModelAndView("comida",model);
    
    }

    @RequestMapping(value="/lista",method = RequestMethod.GET)
    public ModelAndView listaa(ModelMap model,HttpServletRequest request){
        List s = comida_db.listar();
        model.addAttribute("comidas",s);
        
        return new ModelAndView("lista",model); /*la vista, el modelo*/
    }
    
    
}
