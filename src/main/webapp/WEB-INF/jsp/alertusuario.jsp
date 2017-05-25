<%-- 
    Document   : errorP
    Created on : 8/05/2017, 09:12:24 PM
    Author     : emmanuel
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
       <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="shortcut icon"  href="imagenes/favicon.png">
        <title>Alert</title>
        
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
        
             <!-- ========== Mensaje ========== -->
	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<h1>${alerta}</h1>
				<br>
				<h3>Regresar a la Pagina de Inicio</h3>
				<br>
                                <br>
                                <form name="crearPuesto" method="GET"  action="<c:url value = '/' />">
                                <button type="submit" class="button button-block" />Regresar</button>
                                </form>
                                <br>
				<br>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap --> 
             
    <script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/main.js"></script>
        
    </body>
    
    <!-- Hasta Abajo -->
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
</html>
