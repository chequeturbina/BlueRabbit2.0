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
        
        <link rel="shortcut icon"  href="<c:url value="/imagenes/favicon.png"/> ">
        <title>Administrador</title>
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mapadmin.css"/>">
        
        <script src=" <c:url value="/js/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>
        
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Oswald:400,300,700"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=EB+Garamond"/>">
        
    </head>
    <body data-spy="scroll" data-offset="0" data-target="#theMenu">
       
      
        <!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			
			<i class="icon-remove menu-close"></i>
                        <a href="<c:url value = '/home' />">Home</a>
			<a href="<c:url value = '/administrador/agregarpuesto' />">Agregar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/verpuestos' />">Ver Puestos</a>
			<a href="<c:url value = '/administrador/modificarpuesto' />">Modificar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/administrador/eliminarpuesto' />">Eliminar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/administrador/eliminarusuario' />">Eliminar Usuario</a> <!-- solo admi-->
                        li style="float:right"><a class="smoothScroll" href="<c:url value = '/logout' /> ">Cerrar Sesión</a></li>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>

        
        <!-- ========== Modificar Puesto ========== -->
	<section id="modificarpuesto" name="modificarpuesto"></section>
	<div id="headerwrap">
		<div class="container">
                                    <h3>Modificar Puesto</h3>
                                    <form method="POST" action="/BlueRabbit/puesto"> <!--posible error-->
                                    <div class="search">
                                        <input type="text" class="form-control input-sm" maxlength="100" placeholder="Search" id="nombre2" name="nombre"/>
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                                    <form method="POST"  action="/BlueRabbit/actualizarpuesto"> <!--posible error-->
                                    <h4>
                                    <div class="col-xs-5 btn-group">
                                            <input type="hidden" value = "${nombre}" name="nombrebuscar">
                                            <input class="form-control" type="text" value = "${nombre}" name ="nombre"  >
                                            
                                            <textarea class="form-control" rows="5"  name ="descripcion">${descripcion}</textarea>
                                            <textarea class="form-control" rows="5" name ="menu">${menu}</textarea>
                                            <button class="btn btn-primary ">Modificar</button>
                                    </div>
                                    </h4>
                                </form>
                                            
                                            <div class="table-responsive">
                                    <table class="table .table-condensed">
                                        <thead>
                                            <tr class="info">
            <th>id</th>
            <th>nombre</th>
            <th>descripcion</th>
            <th>menu</th>
                                            </tr>
                                    </thead>
                                    <tbody>
            <c:forEach var="us" items="${puestos}">
            <tr class="danger">
                <td>${us.id_puesto}</td>
                <td>${us.nombre}</td>
                <td>${us.descripcion}</td>
                <td>${us.menu}</td>
            </tr>
            </c:forEach>
                                    </tbody>
        </table>
                                    </div>
                               
               
		</div><!-- /container -->
	</div><!-- /f -->

        
    <script src=" <c:url value="/js/classie.js"/> "></script>
    <script src=" <c:url value="/js/bootstrap.min.js"/> "></script>
    <script src=" <c:url value="/js/smoothscroll.js"/> "></script>
    <script src=" <c:url value="/js/main.js"/> "></script>
   
    
    <!-- Hasta Abajo -->
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
    
    </body>
</html>