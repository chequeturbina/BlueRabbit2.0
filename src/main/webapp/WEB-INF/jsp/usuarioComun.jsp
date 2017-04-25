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
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="shortcut icon"  href="imagenes/favicon.png">
        <title>Inicio de Usuario</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/mapadmin.css">
        
        <script src="js/jquery.min.js"></script>
        <script src="js/modernizr-custom.js"></script>
        <script src="js/validar.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css'>
        
    </head>

    <body data-spy="scroll" data-offset="0" data-target="#theMenu">
    
    <c:choose>
    <c:when test="${log.equals(false)}">
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a>BIENVENIDO</a></h1>
			<i class="icon-remove menu-close"></i>
                        <form method="GET" name=form action="/BlueRabbit/administrador">
                        <img src="imagenes/avatar.png" class="img-circle center-block" alt="Cinque Terre" width="180" height="180">
                        <h2><input class="form-control" id="correo" name="correo" placeholder="Correo" type="email" required></h2>
                        <h3><input class="form-control" id="password" name="password" placeholder="Password" type="password" required></h3>
                        <h4><button class="btn btn-danger" onclick="validar()" value=Acceder type="button">Iniciar Sesion</button></h4>
                        </form>
                        <h5><form method="GET" action="/BlueRabbit/registrar">
                            <button type="submit" class="btn btn-danger">Registrar</button>
                            </form>
                        </h5>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>

	<!-- ========== HEADER SECTION ========== -->
	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="logo">
				<img src="imagenes/logo.png">
                                
			</div>
			<br>
			<div class="row">
				<h1>${info}</h1>
				<br>
                                <h2><a href="iniciarSesion">Inicie Sesión</a></h2>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->

    </c:when>
    <c:otherwise>
<!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="index.html#home">Minimal</a></h1>
			<i class="icon-remove menu-close"></i>
			<a href="#" class="smoothScroll">Ver perfil</a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>


	
	<!-- ========== HEADER SECTION ========== -->
	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="logo">
				<img src="imagenes/logo.png">
                                
			</div>
			<br>
			<div class="row">
				<h1>${info}</h1>
				<br>
                                <h2><a href="#">Agregue una foto</a></h2>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
        <!-- ========== Agregar Puesto ========== -->
	<section id="agregarpuesto" name="agregarpuesto"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<h3>Agregar Puesto</h3>
                                <div class="col-xs-5 btn-group">
                                            <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                                            <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                                            <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                                             <input type="text" class="form-control" placeholder="Longitud" id="longitud">
                                             <input type="text" class="form-control"placeholder=latitud id="latitud">
                                             <form method="submit" action="/BlueRabbit/registro">
                                            <button class="btn btn-primary " onclick="validar()" value=Acceder type="button">Agregar Puesto</button>
                                             </form>
                                </div>
                                   <div id="map1">
                            <script src="js/mapadmin.js"></script>
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMapadmin"async defer></script>
				
			</div>    
			</div>
			</div>
		</div>
	
        
        <!-- ========== Modificar Puesto ========== -->
	<section id="modificarpuesto" name="modificarpuesto"></section>
	<div id="headerwrap">
		<div class="container">
                                    <h3>Modificar Puesto</h3>
                                    <form>
                                    <div class="search">
                                        <input type="text" class="form-control input-sm" maxlength="100" placeholder="Search" />
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                                    <form>
                                    <h4>
                                    <div class="col-xs-5 btn-group">
                                            <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                                            <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                                            <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                                            <button class="btn btn-primary " onclick="validar()" value=Acceder type="button">Modificar</button>
                                    </div>
                                    </h4>
                                </form>
                                    <div class="btn-group">
                                    <form method="GET" action="/BlueRabbit/principalbase">
                                                 <button type="submit" class="btn btn-primary">Base</button>
                                            </form>
                                    </div>
                               
               
		</div><!-- /container -->
	</div><!-- /f -->
                
    </c:otherwise>
    </c:choose>
       
      
        
        
    <script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/main.js"></script>
   
    
    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <p>Binary Code</p> 
    </footer>
    
    </body>
</html>

