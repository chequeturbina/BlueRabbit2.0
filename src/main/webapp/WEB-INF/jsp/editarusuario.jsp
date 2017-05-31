<%-- 
    Document   : editarUsuario
    Created on : 27/04/2017, 02:50:38 AM
    Author     : Abraham
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        

        <title>Editar Perfil</title>
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">     
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600"/>">
   
        <script src=" <c:url value="/js/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>
        
        
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Oswald:400,300,700"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=EB+Garamond"/>">
        
    </head>
    <body>
        
         <div>
            <ul>
                <li style="float:right"><a class="active1" href="<c:url value = '/logout' /> ">Cerrar Sesión</a></li>
                <li style="float:left"><a class="active" />${usuario.correo}</a></li>
                
            </ul>
        </div>
                <div id="headerwrap">
                    <div style="margin-top: 50px; "align="center" class="formL">

          <h2>Edita tu Perfil 🐰 </h2>
          
          <form  action="/BlueRabbit/user/actualizarperfil" method="POST">
          
           <input type="hidden" value = "${usuario.correo}" name="correobuscar">
            <div class="field-wrap">
                <input type="text" required autocomplete="off" value="${usuario.nombre}" name="nombre"/>
            </div>
        
          <div class="field-wrap">
            <input type="email" required autocomplete="off" value="${usuario.correo}" name="correo" readonly="readonly"/>
          </div>
          
          <div class="field-wrap">
              <input type="password" required autocomplete="off" value="${usuario.contrasena}" placeholder="Password" maxlength="12" name="contrasena" minlength="6"/>
          </div>

          <div class="field-wrap">
                <img src="<c:url value="/imagenes/profile/12.jpg"/>" height="250" width="250">                             
          </div>
          <div class="field-wrap" >
                <a href="/BlueRabbit/user/editarusuario/subir">
                   <input type="button" value="Cambiar Foto" name="${usuario.idUsuario}" />
                </a>
          </div>
          <div class="field-wrap">
              <button type="submit" class="button button-block" /> Guardar </button>
          </div>
                
          </form>
                    
                </div>
                    
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
                
    </body>
</html>
