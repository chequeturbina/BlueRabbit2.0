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
        <table border="1">
            
            <th>id</th>
            <th>Nombre</th>
            <th>correo</th>
            <th>contrasena</th>
            <th>edad</th>
            <th>carrera</th>
            <c:forEach var="us" items="${usuarios}">
                <tr>
 
                    <td>${us.idUsuario}</td>
                    <td><a href="<c:url value="usuario?nombre=${us.nombre}"/>">${us.nombre}</a></td>
                    <td>${us.correo}</td>
                    <td>${us.contrasena}</td>                    
                    <td>${us.edad}</td>                    
                    <td>${us.carrera}</td>                    
                </tr>
            </c:forEach>
        </table>
                    
    </div>
        <a href="<c:url value="/home"/>">Inicio</a>
    </body>
</html>
    </body>
</html>
