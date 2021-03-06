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
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="shortcut icon"  href="<c:url value="/imagenes/favicon.png"/> ">
        <title>Inicio</title>

        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mapaindex.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/start.css"/> ">
        <link rel='stylesheet' href="<c:url value="https://fonts.googleapis.com/css?family=Farsan"/>">
        <link href=http://www.cssscript.com/wp-includes/css/sticky.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">

        <script src=" <c:url value="http://code.jquery.com/jquery-latest.js"/> "></script>

    </head>
    <body>
        
        <!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			
			<i class="icon-remove menu-close"></i>
                        <a href="<c:url value = '/home' />">Home</a>
			<a href="<c:url value = '/administrador/agregarpuesto' />">Agregar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/administrador/verpuestos' />">Ver Puestos</a><!--solo admi-->
			<a href="<c:url value = '/administrador/modificarpuesto' />">Modificar Puesto</a> <!--solo admi-->
                        <a href="<c:url value = '/administrador/eliminarpuesto' />">Eliminar Puesto</a> <!-- solo admi-->
                        <a href="<c:url value = '/administrador/eliminarusuario' />">Eliminar Usuario</a> <!-- solo admi-->
                        <a href="<c:url value = '/administrador/eliminarusuario1' />">Eliminar Comentario</a> <!-- solo admi-->
                        <li style="float:right"><a class="smoothScroll" href="<c:url value = '/logout' /> ">Cerrar Sesión</a></li>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>
        <div id="headerwrap">
            <h9>Selecciona un puesto para ver la informacion</h9>
            <div class="container-fluid">
                <div class="col-sm-3 sidenav">


                    <h5>${nombre}</h5>
                    <h2>Calificación:</h2>
                    <h3>${calificacion}</h3><br>
                    <div class="field-wrap">
                        <textarea type="text" readonly="readonly">${descripcion}</textarea>
                    </div>
                    <div class="field-wrap">
                        <textarea type="text" readonly="readonly">${menu}</textarea>
                    </div>
                    <h6>Comentarios</h6><br>

                    <div class="table-responsive">
                        <form class="formulario"  method="POST"  action="/BlueRabbit/administrador/eliminarComentario" >
                            <table  class="table3">        
                                <c:forEach var="us" items="${comentarios}">
                                    <tr calss="cabezera">
                                        <th> <span class="label label-primary">${us.usuario.getNombre()}</span>
                                            <c:set var = "id" scope = "session" value = "${us.usuario.getIdUsuario()}"/>
                                                <button type="submit" class="btn btn-default" value="${us.getIdComentarios()}" name="borrar">eliminar</button>
                                        </th>
                                    </tr>
                                    <tr>
                                        <td>${us.comentarios}</td>
                                    </tr>
                                </c:forEach>                                    
                            </table>
                        </form>
                    </div>
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
            function ventanaInfo(nombre) {
                var coso = '<div id="content">' +
                        '<div id="bodycontent">' +
                        '<form name="index" method="POST"  action="/BlueRabbit/administrador/eliminarcomentario">' +
                        '<input type="hidden" name="nombrebuscar" value="' + nombre + '">' +
                        '<h2>' + nombre + '</h2>' +
                        '<button type="submit" class="button" />Informacion</button>' +
                        '</form>' +
                        '</div>' +
                        '</div>' +
                        '</div>';
                return coso;
            }

            function initMap() {
                var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
                markerLat = [
            <c:forEach var="um" items="${puestos}" varStatus="status">
                <c:out value="${um.latitud}"/>,
            </c:forEach>];
                markerLong = [
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

                for (i = 0; i < markerLat.length; i++) {
                    var marker = new google.maps.Marker({
                        position: new google.maps.LatLng(markerLat[i], markerLong[i]),
                        map: map,
                        icon: image,
                        title: markerName[i]
                    });
                    google.maps.event.addListener(marker, 'click', (function (marker, i) {
                        return function () {
                            infowindow.setContent(ventanaInfo(markerName[i]));
                            infowindow.open(map, marker);
                        }
                    })(marker, i));
                }

                google.maps.event.addDomListener(window, 'load', initMap);
            }
        </script>
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
