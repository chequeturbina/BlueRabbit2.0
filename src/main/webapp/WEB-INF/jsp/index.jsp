<%-- 
    Document   : index
    Created on : 26/04/2017, 08:16:30 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <link rel="stylesheet" href="css/mapaindex.css">
        
    </head>
    <body>
        <section id="home" name="home"></section>
    
        <div>
            <ul>
                <li style="float:right"><a class="active" href="iniciarSesion">Iniciar Sesión</a></li>
                <li style="float:right"><a class="active1" href="registrar">Registrarse</a></li>
            </ul>
        </div>
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
    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <h3>Binary Code, 2017</h3>
    </footer>
    </body>
</html>
