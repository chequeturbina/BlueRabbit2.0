<%-- 
    Document   : registrar
    Created on : 18/04/2017, 02:42:58 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
    </head>
    <body>
        <form action="registrarse" method="get">
            Nombre:
            <input type="text" name="nombre">
            <br/>
            Correo:
            <input type="text" name="correo">
            <br/>
            Contrasena:
            <input type="text" name="contrasena">
            <br/>
            Foto:
            <input type="text" name="url_foto">
            <br/>
            Edad:
            <input type="text" name="edad">
            <br/>
            Carrera:
            <input type="text" name="carrera">
            <br/>
            <input type="submit" onclick="alert('Usuario Agregado')" value="Enviar"/>

        </form>
        
        <a href ="lista">Lista usuarios</a>
        <a href="<c:url value="/usuarioComun?correo=admin&password="/>">Inicio</a>
    </body>
</html>
