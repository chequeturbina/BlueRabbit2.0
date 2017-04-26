<%-- 
    Document   : usuarioComun
    Created on : 25/04/2017, 09:06:04 AM
    Author     : Abraham
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Inicio de Usuario</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
    </head>

    <body>
            <div>
            <ul>
                <li><a href="#">Puestos</a></li>
                <li><a href="#">Nosotros</a></li>
                <li style="float:right"><a class="active" href="iniciarSesion">Iniciar Sesión</a></li>
                <li style="float:right"><a class="active1" href="registrar">Registrarse</a></li>
            </ul>
        </div>

	<!-- ========== HEADER SECTION ========== -->
	<div id="headerwrap">
		<div class="container">
			<!--div class="logo">
				<!--img src="imagenes/logo.png">                                
			</div-->
			<br>
			<div class="row">
				<h1>${info}</h1>
                                <br>
                                <h2><a href="iniciarSesion">Inicie Sesión</a></h2>
                                <h2><a href="registrar">Registrarse</a></h2>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->    
        
        <!-- Hasta Abajo -->
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
    
    </body>
</html>

