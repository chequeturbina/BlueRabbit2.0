<%-- 
    Document   : editarpuesto
    Created on : 24/04/2017, 10:46:29 PM
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
        <h2>Puesto</h2>
        <form method="POST"  action="/BlueRabbit/actualizarpuesto">
                <input type="hidden" value = "${nombre}" name="nombrebuscar">
                            
                                <label><p style="color:#F14FC8">Nombre :</p></label>
                            <input type="text" value = "${nombre}" name ="nombre">
                            
                                <label><p style="color:#F14FC8">Descripcion :</p></label>
                            <input type="text" value = "${descripcion}" name ="descripcion">
                            
                            <label><p style="color:#F14FC8">Menu :</p></label>
                            <input type="text" value = "${menu}" name ="menu">
                            
                            <button>Actualizar</button>
                            </form>
                            
    </body>
</html>
