/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Mapeo.Usuario;
import Mapeo.Puesto;
import Modelo.UsuarioModel;
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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

/**
 *
 * @author Abraham
 */
@Controller
public class Controlador {
    
    @Autowired
    UsuarioModel usuario_db;
    
    @Autowired
    PuestoModel puesto_db;
    
    @RequestMapping(value = "/home")
    public ModelAndView inicio(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();        
        if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_ADMIN]")){
            return new ModelAndView("redirect:/administrador/home");
        }if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_USER]")){
            return new ModelAndView("redirect:/user/home");
        }
        return new ModelAndView("index");
    }
 
    @RequestMapping(value = "/administrador/home")
    public ModelAndView home_admi(ModelMap model) {
        return new ModelAndView("home_admi", model);
    }

    @RequestMapping(value = "/user/home")
    public ModelAndView home_user(ModelMap model) {
        return new ModelAndView("home_user", model);
    }

    
    /*EMMANUEL PUESTO*/
    @RequestMapping(value = "/administrador/agregarpuesto")
    public ModelAndView agregarpuesto(ModelMap model) {
        return new ModelAndView("agregarpuesto", model);
    }
    @RequestMapping(value = "/verpuestos") //Todos
    public ModelAndView verpuestos(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("verpuestos", model);
    }
    @RequestMapping(value = "/administrador/modificarpuesto") //Admi
    public ModelAndView modificarpuesto(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("modificarpuesto", model);
    }
    @RequestMapping(value = "/administrador/eliminarpuesto")
    public ModelAndView eliminarpuesto(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("eliminarpuesto", model);
    }
    
    /*USUARIO*/
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)//Todos
    public ModelAndView registrar(ModelMap model,HttpServletRequest request) {
        return new ModelAndView("registrar",model);
    }
    
    @RequestMapping(value = "/registrarse", method = RequestMethod.GET) //sólo administrador y anonimos
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
        String err = "";
        if(validoC /*& validoN*/){ //Ahora no validamos el nombre
            String contrasena = request.getParameter("contrasena");
            mj.enviaCorreo(correo, contrasena);
            String url_foto = "miURLFOTO";//request.getParameter("url_foto"); /*dejar vacio*/
            int edad = Integer.parseInt(request.getParameter("edad"));/*hacer un select*/
            String carrera = request.getParameter("carrera");/*Hace un select*/
            String rol_usuario = "ROLE_USER"; //Sólo agregamos usuarios, cambiar para agregar admins            
            usuario_db.crearUsuario(nombre, correo, contrasena, url_foto,edad,carrera,rol_usuario);
        
            Usuario nuevo = usuario_db.porCorreo(correo); /*Para ir al nuevo usuario*/
            err = "Gracias Por Registrarte";
            model.addAttribute("alerta",err);
            return new ModelAndView("alertusuario",model);
        }else{
             err = "Error verifique sus datos";
             model.addAttribute("alerta",err);
             return new ModelAndView("errorP",model);
        }
    }    
    
    @RequestMapping(value="/administrador/lista",method = RequestMethod.GET) //admin
    public ModelAndView lista(ModelMap model,HttpServletRequest request){
        List u = usuario_db.listarUsuarios(); 
        model.addAttribute("usuarios",u);
        return new ModelAndView("lista",model);
    }

    @RequestMapping(value = "/administrador/borrar", method = RequestMethod.GET)
    public ModelAndView eliminarUsuario(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        int idUsuario = Integer.parseInt(request.getParameter("id"));
        Usuario user = usuario_db.porId(idUsuario);
        usuario_db.eliminarUsuario(user);
        return new ModelAndView("redirect:/administrador/lista", model);
    }

    @RequestMapping(value="/administrador/usuario", method = RequestMethod.GET) //Admi porque se borra desde aquí
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
    
    @RequestMapping(value = "/iniciar") //todos para iniciar sesión
    public ModelAndView inicia(ModelMap model, HttpServletRequest a, RedirectAttributes redirect){
    Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    String currentPrincipalName = authentication.getName();        
        if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_ADMIN]")){
            return new ModelAndView("redirect:/administrador/home");
        }if(String.valueOf(SecurityContextHolder.getContext().getAuthentication().getAuthorities()).equals("[ROLE_USER]")){
            return new ModelAndView("redirect:/user/home");
        }
        return new ModelAndView("iniciarSesion");
    }
    
    @RequestMapping(value="/ErrorIH", method = RequestMethod.GET) //Todos los errores, no sé si va el admi :/
    public ModelAndView error(ModelMap model,HttpServletRequest request){
        return new ModelAndView("ErrorIH",model);
    }

}
