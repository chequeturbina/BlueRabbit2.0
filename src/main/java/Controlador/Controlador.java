/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;

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
}
