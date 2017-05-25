<%-- 
    Document   : home_user
    Created on : 26/04/2017, 09:55:20 AM
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

        <title>Inicio</title>

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/mapadmin.css">        
        
    </head>
    <body>
        <section id="home" name="home"></section>
    
        <div>
            <ul>
                <li><a href="#">Puestos</a></li>
                <li><a href="#">Nosotros</a></li>
                <li style="float:right"><a class="active1" href="<c:url value = '/logout' /> ">Cerrar Sesión</a></li>
                <li style="float:right"><a class="active" href="<c:url value="/usuario?nombre=${nombre}"/>">${nombre}</a></li>
                <!--Hacer que lo diriga a los detalles del usuario para modificar sus datos, y quitar, ver usuarios etc-->
            </ul>
        </div>
	<div id="headerwrap">
		<div class="container">
			<div id="map">
                            <script src="js/mapa.js"></script>
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMap"async defer></script>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <h3>Binary Code, 2017</h3>
    </footer>
    </body>
</html>
