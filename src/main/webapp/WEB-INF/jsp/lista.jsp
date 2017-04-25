<%-- 
    Document   : lista
    Created on : 19/04/2017, 02:26:08 AM
    Author     : Abraham
--%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Lista de Usuarios</title>
    </head>
    <body>
        <h1>Lista de los usuarios</h1>
    <div align="center">
        <h1>Usuarios</h1>
        <h1>${usuarios.get(0).getNombre()}</h1>
        <h1>${usuarios.get(1).nombre}</h1>
        <table border="1">
            
            <th>id</th>
            <th>Nombre</th>
            <th>correo</th>
            <th>contrasena</th>
            <th>url</th>
            <c:forEach var="us" items="${usuarios}">
                <tr>
 
                    <td>${us.idUsuario}</td>
                    <td>${us.nombre}</td>
                    <td>${us.correo}</td>
                    <td>${us.contrasena}</td>                    
                </tr>
            </c:forEach>
        </table>
                    
    </div>
        <a href="/BlueRabbit">Inicio</a>
    </body>
</html>
