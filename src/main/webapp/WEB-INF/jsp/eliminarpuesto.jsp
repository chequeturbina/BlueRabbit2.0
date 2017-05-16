<%-- 
    Document   : eliminarpuesto
    Created on : 13/05/2017, 04:17:58 PM
    Author     : emmanuel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="shortcut icon"  href="imagenes/favicon.png">
        <title>Administrador</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/mapadmin.css">
        
        <script src="js/jquery.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css'>
        
    </head>
    <body data-spy="scroll" data-offset="0" data-target="#theMenu">
       
      
        <!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			
			<i class="icon-remove menu-close"></i>
                        <a href="<c:url value = '/home_admi' />">Home</a>
			<a href="<c:url value = '/agregarpuesto' />">Agregar Puesto</a>
			<a href="<c:url value = '/modificarpuesto' />">Modificar Puesto</a>
                        <a href="<c:url value = '/eliminarpuesto' />">Eliminar Puesto</a>
                        <li style="float:right"><a class="smoothScroll" href="/BlueRabbit">Cerrar Sesión</a></li>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>

        
        <!-- ========== Eliminar Puesto ========== -->
	<section id="eliminarpuesto" name="eliminarpuesto"></section>
	<div id="headerwrap">
		<div class="container">
                                    <h3>Eliminar Puesto</h3>
                                    <form method="POST" action="/BlueRabbit/puesto1">
                                    <div class="search">
                                        <input type="text" class="form-control input-sm" maxlength="100" placeholder="Search" id="nombre2" name="nombre"/>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                                    <form method="GET"  action="/BlueRabbit/eliminar">
                                    <h4>
                                    <div class="col-xs-5 btn-group">
                                            <input type="hidden" value = "${nombre}" name="nombrebuscar">
                                            <input class="form-control" type="text" value = "${nombre}" name ="nombre" readonly="readonly"readonly="readonly" >
                                            <br>
                                            <textarea class="form-control" rows="5"  name ="descripcion" readonly="readonly">${descripcion}</textarea>
                                            <br>
                                            <textarea class="form-control" rows="5" name ="menu" readonly="readonly">${menu}</textarea>
                                            <button class="btn btn-primary">Eliminar</button>
                                    </div>
                                    </h4>
                                </form>
                                           
               
		</div><!-- /container -->
	</div><!-- /f -->

    <div class="container">
            <div class="row">
                <div style="background-color: black;" align="center" class="col-sm-12">
                    <h1>Administrar Usuarios</h1>
                    <br><br><br>
                    <h4><a href="lista">Lista de Usuarios</a></h4>
                    <br>
                    <h4><a href="registrar">Registrar Usuarios</a></h4>
                    <br>
                </div>
            </div>
                
        </div>
        
        
    <script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/main.js"></script>
   
    
    <!-- Hasta Abajo -->
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
    
    </body>
</html>