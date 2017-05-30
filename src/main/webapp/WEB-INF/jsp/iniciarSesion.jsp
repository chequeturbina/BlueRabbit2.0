<%-- 
    Document   : iniciarSesion
    Created on : 25/04/2017, 09:12:06 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600"/>">
        
        <script src=" <c:url value="/js/validar.js"/> "></script>
        
    </head>
    <body>
        <div id="headerwrap">
          <div align="center" class="form">

          <h2>Iniciar Sesión 🐰</h2>
          
          <form method="POST" action="j_spring_security_check">

          <div class="field-wrap">
            <input type="text" required autocomplete="off" placeholder="Correo" id="username" name="username"/>  <!--necesita el type=email-->
          </div>
          
          <div class="field-wrap">
            <input type="password" autocomplete="off" placeholder="Contraseña" id="password" name="password"/> <!--necesita el required-->
          </div>
                          <button type="submit" class="button button-block">Aceptar</button>
          </form>
          <br>
          <form name="index" method="GET"  action="<c:url value = '/' />">
            <button type="submit" class="button" />Salir</button>
        </form>
          </div>
        <!-- Hasta Abajo -->
        <br>    
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        
    </body>
</html>
