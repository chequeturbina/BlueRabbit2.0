<%-- 
    Document   : agregarpuesto
    Created on : 27/04/2017, 12:18:06 PM
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
        <title>Ver puestos</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/mapadmin.css">
        <link rel="stylesheet" href="css/mapaindex.css">
        
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
                        <a href="<c:url value = '/home' />">Home</a>
			<a href="<c:url value = '/administrador/agregarpuesto' />">Agregar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/verpuestos' />">Ver Puestos</a>
			<a href="<c:url value = '/administrador/modificarpuesto' />">Modificar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/administrador/eliminarpuesto' />">Eliminar Puesto</a> <!--solo admi-->
                        <li style="float:right"><a class="smoothScroll" href="<c:url value = '/logout' />">Cerrar Sesión</a></li>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>

	
        <!-- ========== Ver Puestos ========== -->
	<div id="headerwrap">
		<div class="container">
			<div id="mapa">
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMap"async defer></script>
                           
			</div>
                    
		</div><!-- /container -->
	</div><!-- /headerwrap -->
        <script>
            function ventanaInfo(descripcion,nombre){
                var coso = '<div id="content">'+
                           '<div id="siteNotice">'+
                           '</div>'+
                           '<hl id="firstHeading" class="firstHeading">'+ nombre +'</hl'+
                           '<div id="bodycontent">'+
                           '<h2>' + descripcion + '</h2>'+
                           '</div>'+
                           '</div>';
                return coso;
            }
            
            function initMap() {
                var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
                markerLat=[
                        <c:forEach var="um" items="${puestos}" varStatus="status">
                            <c:out value="${um.latitud}"/>,
                        </c:forEach>];
                markerLong=[
                        <c:forEach var="um" items="${puestos}" varStatus="status">
                            <c:out value="${um.longitud}"/>,
                        </c:forEach>];
                markerName = [
                        <c:forEach var="um" items="${puestos}" varStatus="status">
                            "${um.nombre}",
                        </c:forEach>];
                markerDes = [
                        <c:forEach var="um" items="${puestos}" varStatus="status">
                            "${um.descripcion}",
                        </c:forEach>];
                            
                            var map = new google.maps.Map(document.getElementById('mapa'), {
                            zoom: 19,
                            center: {lat: 19.323447, lng: -99.179642}
                        });
                        var infowindow = new google.maps.InfoWindow();
                        var i;
                        
                            for (i=0; i < markerLat.length; i++){
                                var marker = new google.maps.Marker({
                                   position: new google.maps.LatLng(markerLat[i],markerLong[i]),
                                   map: map,
                                   icon: image,
                                   title: markerName[i]
                            });
                            google.maps.event.addListener(marker, 'click', (function(marker, i){
                                return function(){
                                    infowindow.setContent(ventanaInfo(markerDes[i],markerName[i]));
                                    infowindow.open(map,marker);
                                }})(marker,i));
                        }
                        
                            google.maps.event.addDomListener(window,'load',initMap);
                        }
        </script>
        
        
    <div class="container">
            <div class="row">
                <div style="background-color: black;" align="center" class="col-sm-12">
                    <h1>Administrar Usuarios</h1>
                    <br><br><br>
                    <h4><a href="lista">Lista de Usuarios</a></h4> <!--solo admi-->
                    <br>
                    <h4><a href="<c:url value="/registrar"/>">Registrar Usuarios</a></h4> <!--TODOS--!
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
