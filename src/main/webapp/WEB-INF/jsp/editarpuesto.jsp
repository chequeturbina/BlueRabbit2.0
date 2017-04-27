<%-- 
    Document   : editarpuesto
    Created on : 25/04/2017, 12:23:13 PM
    Author     : emmanuel
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>${info}</h1>
        <form name="crearPuesto" method="POST"  action="<c:url value = '/actualizarpuesto' />">
 
                            <input type="hidden" value = ${puesto.id_puesto}  id="id" name ="id" />
                            
                                <label for="nombre"><p style="color:#F14FC8">Nombre :</p></label>
                            <input type="text" value = "${puesto.nombre}"  id="nombre" name ="nombre" />
                            
                                <label for="descripcion"><p style="color:#F14FC8">Descripcion :</p></label>
                            <input type="text" value = "${puesto.descripcion}"   id="descripcion" name ="descripcion"/>
                            
                                <label for="menu"><p style="color:#F14FC8">Menu :</p></label>
                            <input type="text" value = "${puesto.menu}"   id="menu" name ="menu"/>
                            
                            <hr />
                            
                            <input type="submit">
                               
                        </form>
    </body>
</html>
