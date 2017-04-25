<%-- 
    Document   : registrar
    Created on : 18/04/2017, 02:42:58 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
    </head>
    <body>
        <form action="" method="get">
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
            
            <p><input type="submit" value="Enviar"></p>
        </form>
        
        <a href ="lista">Lista usuarios</a>
        <a href="/BlueRabbit">Inicio</a>
    </body>
</html>
