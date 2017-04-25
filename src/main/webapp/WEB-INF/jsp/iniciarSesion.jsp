<%-- 
    Document   : iniciarSesion
    Created on : 25/04/2017, 09:12:06 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
    </head>
    <body>
        <div align="center">
            <h2>Iniciar sesión</h2>
            <br><br>
            <center>
            <form method="GET" action="/BlueRabbit/usuarioComun">
                <h2>Ingresa correo</h2>
                <input name="correo" type="text" placeholder="Correo">
                <h2>Ingresa contraseña</h2>
                <input name="password" type="text" placeholder="Contraseña">
                <br><br>
                <button>Aceptar</button>
            </form>
            <br><hr>
            <a href="/BlueRabbit">Inicio</a>    
        </center>
            
        </div>
    </body>
</html>
