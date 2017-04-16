<%-- 
    Document   : lista
    Created on : 16/04/2017, 02:30:37 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Lista de las comidas!</h1>
    <div align="center">
        <h1>Comida List</h1>
        <table border="1">
 
            <th>Nombre</th>
            <th>Id</th>

            <c:forEach var="user" items="${comidas}">
                <tr>
 
                    <td>${user.nombre}</td>
                    <td>${user.id}</td>
                </tr>
            </c:forEach>
        </table>
    </div>
        
    </body>
</html>
