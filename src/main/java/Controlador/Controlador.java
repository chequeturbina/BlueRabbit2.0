/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controlador;


import Mapeo.Puesto;
import Mapeo.Usuario;
import Modelo.ComentariosModel;
import Modelo.UsuarioModel;
import Modelo.PuestoModel;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import javax.imageio.ImageIO;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
    
    @Autowired
    ComentariosModel comentarios_db;

    /*Home Admi o User*/
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
    
    /*Home Admi*/
    @RequestMapping(value = "/administrador/home")
    public ModelAndView home_admi(ModelMap model) {
        return new ModelAndView("home_admi", model);
    }
    
    /*Home User*/
    @RequestMapping(value = "/user/home")
    public ModelAndView home_user(ModelMap model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        Usuario p = usuario_db.porCorreo(currentPrincipalName);
        model.addAttribute("usuario", p);
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("home_user", model);
    }
    
    /*Editar Perfil*/
    @RequestMapping(value = "/user/editarusuario")
    public ModelAndView editarusuario(ModelMap model) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        Usuario p = usuario_db.porCorreo(currentPrincipalName);
        System.out.println("El id del usuario es: \n"+p.getIdUsuario());
        model.addAttribute("usuario", p);
        return new ModelAndView("editarusuario", model);
    }
    
    /*Actualizar perfil de la base*/
    @RequestMapping(value = "/user/actualizarperfil", method = RequestMethod.POST)
    public ModelAndView actualizarperfil(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String correobuscar = request.getParameter("correobuscar");
        String nombre = request.getParameter("nombre");
        String contrasena = request.getParameter("contrasena");
        
        Usuario usuario = usuario_db.porCorreo(correobuscar);
        String err = "";
        if(usuario == null){
                      err = "No se encontro el usuario para modificar";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("ErrorIH",model);
                 }else{
        if(nombre.equals("") != true){
            usuario.setNombre(nombre);
            usuario_db.updateusuario(usuario);
        }
        if(contrasena.equals("") != true){
            usuario.setContrasena(contrasena);
            usuario_db.updateusuario(usuario);
        }
        }
        err="Perfil Actualizado con exito";
        model.addAttribute("alerta",err);
        return new ModelAndView("alertusuario", model);
    }
    /*
    * Cambiar foto de perfil, debug hacerlo ModelAndView para retornar alerta al usuario
    */
    @RequestMapping(value = "/upload")
    public ModelAndView handleFormUpload(@RequestParam("file") MultipartFile file, ModelMap model, HttpServletRequest request) throws IOException{
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        Usuario p = usuario_db.porCorreo(currentPrincipalName);
        System.out.println("El id del usuario es: \n"+p.getIdUsuario());
        if (!file.isEmpty()) {
            BufferedImage src = ImageIO.read(new ByteArrayInputStream(file.getBytes()));
            String url_foto = "C:/Users/emmanuel/Documents/NetBeansProjects/BlueRabbit2.0/src/main/webapp/imagenes/profile/"+p.getIdUsuario()+".jpg";
            File destination = new File(url_foto);
            ImageIO.write(src, "jpg", destination);
            p.setFoto(url_foto);
            usuario_db.updateusuario(p);
            System.out.println("IMAGEN ARRIBA");
        }
        String err="Perfil Actualizado con exito";
        model.addAttribute("alerta",err);
        return new ModelAndView("alertusuario", model);
    }

    @RequestMapping(value="/user/editarusuario/subir")
    public String up(){
        
        return "subirfoto";
    }    
    
    
    /*VISTAS ADMINISTRADOR*/
    /*Agregar Puesto*/
    @RequestMapping(value = "/administrador/agregarpuesto")
    public ModelAndView agregarpuesto(ModelMap model) {
        return new ModelAndView("agregarpuesto", model);
    }
    /*Ver Puestos*/
    @RequestMapping(value = "/administrador/verpuestos")
    public ModelAndView verpuestos(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("verpuestos", model);
    }
    /*Modificar Puesto*/
    @RequestMapping(value = "/administrador/modificarpuesto")
    public ModelAndView modificarpuesto(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("modificarpuesto", model);
    }
    /*Eliminar Puesto*/
    @RequestMapping(value = "/administrador/eliminarpuesto")
    public ModelAndView eliminarpuesto(ModelMap model) {
        List um = puesto_db.listarpuestos();
        model.addAttribute("puestos",um);
        return new ModelAndView("eliminarpuesto", model);
    }
    
    /* VISTAS USUARIO*/
    /*Registrar*/
    @RequestMapping(value = "/registrar", method = RequestMethod.GET)//Todos
    public ModelAndView registrar(ModelMap model,HttpServletRequest request) {
        return new ModelAndView("registrar",model);
    }
    
    /*Registrar Usuario en la base*/
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
        Usuario usuario = usuario_db.porCorreo(correo);
        String err = "";
        if(validoC /*& validoN*/ & usuario == null){ //Ahora no validamos el nombre
            String contrasena = request.getParameter("contrasena");
            mj.enviaCorreo(correo, contrasena);
            String foto = "C:/Users/emmanuel/Documents/NetBeansProjects/BlueRabbit2.0/src/main/webapp/imagenes/profile/all.jpg";//request.getParameter("url_foto"); /*dejar vacio*/
            int edad = Integer.parseInt(request.getParameter("edad"));/*hacer un select*/
            String carrera = request.getParameter("carrera");/*Hace un select*/
            String rol_usuario = "ROLE_USER"; //Sólo agregamos usuarios, cambiar para agregar admins            
            usuario_db.crearUsuario(nombre, correo, contrasena,foto,edad,carrera,rol_usuario);
        
            Usuario nuevo = usuario_db.porCorreo(correo); /*Para ir al nuevo usuario*/
            err = "Gracias Por Registrarte";
            model.addAttribute("alerta",err);
            return new ModelAndView("alertusuario",model);
        }else{
             err = "Error verifique sus datos";
             model.addAttribute("alerta",err);
             return new ModelAndView("alertusuario",model);
        }
    }    
    
    /*Eliminar Usuario*/
    @RequestMapping(value="/administrador/eliminarusuario",method = RequestMethod.GET) 
    public ModelAndView lista(ModelMap model,HttpServletRequest request){
        List u = usuario_db.listarUsuarios(); 
        model.addAttribute("usuarios",u);
        return new ModelAndView("eliminarusuario",model);
    }
    
         /*Eliminar comentarios*/
    @RequestMapping(value="/administrador/eliminarusuario1") 
    public ModelAndView eliminarComentario(ModelMap model, HttpServletRequest request){
        List u = puesto_db.listarpuestos();
        model.addAttribute("puestos",u);
        return new ModelAndView("EliminarComentarios",model);
    }
    
    
        /*Busca el comentario para mostrar su informacion en la vista usuario*/
    @RequestMapping(value = "/administrador/eliminarcomentario")
    public ModelAndView listas(ModelMap model, HttpServletRequest request) {
        String p = request.getParameter("nombrebuscar");
        Puesto puesto = puesto_db.buscarPuesto(p);
        String err = "";
        if (puesto == null) {
            err = "No se encontro el puesto con el nombre solicitado";
            model.addAttribute("alerta", err);
            return new ModelAndView("errorP", model);
        } else {
            List un = comentarios_db.listarComentarios(puesto);
            String nombre = puesto.getNombre();
            String descripcion = puesto.getDescripcion();
            String menu = puesto.getMenu();
            model.addAttribute("nombre", nombre);
            model.addAttribute("descripcion", descripcion);
            model.addAttribute("menu", menu);
            List um = puesto_db.listarpuestos();
            model.addAttribute("comentarios", un);
            model.addAttribute("puestos", um);
            return new ModelAndView("EliminarComentarios", model);
        }
    }
    
    

        public ModelAndView buscarPuestoComentario(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("nombre"); 
        Puesto puesto = puesto_db.buscarPuesto(p);
        String err = "";
        if (puesto == null){
            err = "No se encontro el puesto con el nombre solicitado";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("errorP",model);
        }else{
         String nombre = puesto.getNombre();
        List um = comentarios_db.listarComentarios(puesto); 
        model.addAttribute("comentarios",um);

         model.addAttribute("comentarios",um);
        return new ModelAndView("EliminarComentarios",model);
    }
    }

    /*Elimina Usuario de la Base*/
    @RequestMapping(value = "/administrador/borrar", method = RequestMethod.GET)
    public ModelAndView eliminarUsuario(ModelMap model, HttpServletRequest request) throws ServletException, IOException, ParseException {
        String correo = request.getParameter("correo");
        Usuario user = usuario_db.porCorreo(correo);
        usuario_db.eliminarUsuario(user);
        String err ="";
        err = "Usuario Eliminado";
        model.addAttribute("alerta",err);
        return new ModelAndView("alert", model);
    }
    
    /*Busca Usuario para eliminarlo*/
    @RequestMapping(value="/administrador/usuario", method = RequestMethod.POST) //Admi porque se borra desde aquí
    public ModelAndView buscarUsuario(ModelMap model,HttpServletRequest request){
        String p = request.getParameter("correo"); 
        Usuario usuario = usuario_db.porCorreo(p);
        String err = "";
        if (usuario == null){
            err = "No se encontro Usuario con el correo solicitado";
                      model.addAttribute("alerta",err);
                      return new ModelAndView("errorP",model);
        }else{
         String nombre = usuario.getNombre();
         String correo = usuario.getCorreo();
         int edad = usuario.getEdad();
         String carrera = usuario.getCarrera();
         model.addAttribute("nombre", nombre);
         model.addAttribute("correo", correo);
         model.addAttribute("edad", edad);
         model.addAttribute("carrera", carrera);
         List um = usuario_db.listarUsuarios();
         model.addAttribute("usuarios",um);
        return new ModelAndView("eliminarusuario",model);
    }
    }
    
    /*Iniciar Sesion*/
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
    
    /*Vista Errores Usuario*/
    @RequestMapping(value="/ErrorIH", method = RequestMethod.GET) //Todos los errores, no sé si va el admi :/
    public ModelAndView error(ModelMap model,HttpServletRequest request){
        return new ModelAndView("ErrorIH",model);
    }
}
