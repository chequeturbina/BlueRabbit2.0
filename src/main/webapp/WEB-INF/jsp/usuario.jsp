<%-- 
    Document   : usuario
    Created on : 24/04/2017, 05:40:56 PM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Detalles del usuario</title>
    </head>
    <body>
        <h1>${info}</h1>
        <h2>ID: ${usuario.idUsuario}</h2>
        <h2>Nombre: ${usuario.nombre}</h2>
        <h2>Correo: ${usuario.correo}</h2>
        <h2>Contraseña: ${usuario.contrasena}</h2>
        <h2>Edad: ${usuario.edad}</h2>
        <h2>Carrera: ${usuario.carrera}</h2>
        
        <a href="lista">Lista de usuarios</a> <!--solo admi-->
        <a href="<c:url value="/administrador/borrar?id=${usuario.idUsuario}"/>">Eliminar usuario</a> <!--posible error-->
        <a href="<c:url value="/home"/>">Inicio</a>         
        </body>
</html>
