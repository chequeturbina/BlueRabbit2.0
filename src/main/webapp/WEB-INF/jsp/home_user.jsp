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
        
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">     
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mapaindex.css"/> ">
        
   
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
                <li style="float:right"><a class="bg-primary" href="<c:url value = '/user/editarusuario'/>">Editar Perfil</a></li>
                <li style="float:left"><a class="active" />${usuario.correo}</a></li>
                
            </ul>
        </div>
	
                <!--   MAPA -->
	<div id="headerwrap">
            <h9>Selecciona un puesto para ver la informacion</h9>
         <div class="container-fluid">
      <div class="col-sm-3 sidenav">
          
          
          <h5>${nombre}</h5>
          <h6>aqui va calificacion</h6>
           <div class="field-wrap">
              <textarea type="text" readonly="readonly">${descripcion}</textarea>
          </div>
          <div class="field-wrap">
              <textarea type="text" readonly="readonly">${menu}</textarea>
          </div>
          <h6>aqui va comentarios</h6>
   
      </div>
        <div class="col-sm-6">
        <section id="home" name="home"></section>

        <!--   MAPA -->
            <div class="container">	
			<div id="mapa">
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMap"async defer></script>
                           
			</div>
                  
               
		</div><!-- /container -->
	</div><!-- /headerwrap -->
        </div>
  
         </div>
        <script>
            function ventanaInfo(nombre){
                var coso = '<div id="content">'+
                           '<div id="siteNotice">'+
                           '</div>'+
                           '<div id="bodycontent">'+
                           '<form name="index" method="POST"  action="/BlueRabbit/user/home">'+
                           '<input type="hidden" name="nombrebuscar" value="' + nombre + '">' +
                           '<h2>' + nombre + '</h2>'+
                           '<button type="submit" class="button" />Informacion</button>'+
                           '</form>'+
		           '</div>'+
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
                                    infowindow.setContent(ventanaInfo(markerName[i]));
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
