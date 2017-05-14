/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


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
   
    @Autowired
    PuestoModel puesto_db;
    
    @Autowired
    UsuarioModel usuario_db;

    @RequestMapping(value="/")
    public String inicio(){
        return "index";
    }
    
        
    /*EMMANUEL*/
     @RequestMapping(value = "/principalbase", method = RequestMethod.GET)
    public ModelAndView principalbase(ModelMap model) {
        return new ModelAndView("principalbase", model);
    }
    
    
    /*EMMANUEL*/
    @RequestMapping(value = "/agregarpuesto")
    public ModelAndView agregarpuesto(ModelMap model) {
        return new ModelAndView("agregarpuesto", model);
    }
    @RequestMapping(value = "/modificarpuesto")
    public ModelAndView modificarpuesto(ModelMap model) {
        return new ModelAndView("modificarpuesto", model);
    }
    @RequestMapping(value = "/eliminarpuesto")
    public ModelAndView eliminarpuesto(ModelMap model) {
        return new ModelAndView("eliminarpuesto", model);
    }
    @RequestMapping(value = "/home_admi")
    public ModelAndView home_admi(ModelMap model) {
        return new ModelAndView("home_admi", model);
    }
    
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)
    public ModelAndView registrar(ModelMap model,HttpServletRequest request) {
        return new ModelAndView("registrar",model);
    }
    
    @RequestMapping(value = "/registrarse", method = RequestMethod.GET)
    public ModelAndView registrarse(ModelMap model,HttpServletRequest request) {
   
        String nombre = request.getParameter("nombre");
        boolean validoC = false;
        boolean validoN = false;
        ValidarCorreo vc = new ValidarCorreo();
        Mensajero mj = new Mensajero();
        String correo = request.getParameter("correo");
        validoC = vc.validar(correo);
        validoN = vc.validarNombre(nombre);
        System.out.println("correo: "+validoC+" nombre: "+validoN);
        if(validoC & validoN){
            String contrasena = request.getParameter("contrasena");
            mj.enviaCorreo(correo, contrasena);
            String url_foto = "miURLFOTO";//request.getParameter("url_foto"); /*dejar vacio*/
            int edad = Integer.parseInt(request.getParameter("edad"));/*hacer un select*/
            String carrera = request.getParameter("carrera");/*Hace un select*/
            usuario_db.crearUsuario(nombre, correo, contrasena, url_foto,edad,carrera);
        
            Usuario nuevo = usuario_db.porCorreo(correo); /*Para ir al nuevo usuario*/
            System.out.println("Usario creado exitosamente");
        }else{
            System.out.println("ERROR");
        }
        return new ModelAndView("registrar", model);
    }    
    
    @RequestMapping(value="/lista",method = RequestMethod.GET)
    public ModelAndView lista(ModelMap model,HttpServletRequest request){
        
        List u = usuario_db.listarUsuarios(); 
        model.addAttribute("usuarios",u);
        return new ModelAndView("lista",model);
    }

    @RequestMapping(value = "/borrar", method = RequestMethod.GET)
    public ModelAndView eliminarUsuario(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        Usuario user = usuario_db.porId(idUsuario);
        usuario_db.eliminarUsuario(user);
        return new ModelAndView("redirect:/lista", model);
    }

    @RequestMapping(value="/usuario", method = RequestMethod.GET)
    public ModelAndView buscarUsuario(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre"); 
        Usuario usuario = usuario_db.buscarUsuario(p);
        
        String nombre = usuario.getNombre();
        String info = "";
        if (usuario == null){
            model.addAttribute("info", info+"No se encontro ningun usuarios con ese nombre");
        }else{
            model.addAttribute("info", info+"El usuario es: "+nombre);
            model.addAttribute("usuario", usuario);
        }
        return new ModelAndView("usuario",model);
    }

    
    @RequestMapping(value="/usuarioComun", method = RequestMethod.GET)
    public ModelAndView iniciarSesion(ModelMap model,HttpServletRequest request){
        
        ModelAndView mv = null;
        String n = request.getParameter("correo");
        String p = request.getParameter("password");
        String info = "" ;
        
        Usuario u = usuario_db.porCorreo(n);
        boolean b = false;
        if (n.equals("admin")) {
            return mv = new ModelAndView("home_admi",model);
        }else if (u == null){
            model.addAttribute("log",b);
            model.addAttribute("info",info+"No se encontró a ningún usuario con ese correo");
            return mv = new ModelAndView("ErrorIH",model);
        }else{
            b = true;
            model.addAttribute("info",info+"Bienvenido: "+u.getNombre());        
            model.addAttribute("correo",n);
            model.addAttribute("password",p);
            model.addAttribute("nombre",u.getNombre());
            model.addAttribute("log",b);
            return mv = new ModelAndView("home_user",model);
        }

    }
    
    @RequestMapping(value="/iniciarSesion", method = RequestMethod.GET)
    public ModelAndView inicia(ModelMap model,HttpServletRequest request){
        return new ModelAndView("iniciarSesion",model);
    }
}
