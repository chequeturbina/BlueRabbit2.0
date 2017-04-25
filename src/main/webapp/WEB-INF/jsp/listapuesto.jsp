<%-- 
    Document   : lista
    Created on : 25/04/2017, 03:55:17 AM
    Author     : emmanuel
--%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table border="1">
            <th>id</th>
            <th>nombre</th>
            <th>descripcion</th>
            <th>menu</th>
            <c:forEach var="us" items="${puestos}">
            <tr>
                <td>${us.id_puesto}</td>
                <td>${us.nombre}</td>
                <td>${us.descripcion}</td>
                <td>${us.menu}</td>
            </tr>
            </c:forEach>
        </table>
        
         <form name="editapuesto" method="POST" action="editar/Puesto">
                            <label for="id_puesto"><p style="color:#F14FC8">ID :</p></label>
                            <input type="hidden" value = ${Puesto.id_puesto} class="form-control" id="id" name ="id" />
                            
                                <label for="nombre"><p style="color:#F14FC8">Nombre :</p></label>
                            <input type="text" value = "${Puesto.nombre}" class="form-control" id="nombre" name ="nombre" />
                            
                                <label for="descripcion"><p style="color:#F14FC8">Descripcion :</p></label>
                            <input type="text" value = "${Puesto.descripcion}" class="form-control"  id="descripcion" name ="descripcion"/>
                            
                                <label for="menu"><p style="color:#F14FC8">Menu :</p></label>
                            <input type="text" value = "${Puesto.menu}" class="form-control"  id="menu" name ="menu"/>
                            
                            <hr />
                            
                            <input type="submit">
                               
                        </form>
                    
        
    </body>
</html>
