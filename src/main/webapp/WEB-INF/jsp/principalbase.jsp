<%-- 
    Document   : AllPuestos1
    Created on : 24/04/2017, 02:27:13 PM
    Author     : emmanuel
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Base de Datos</title>
    </head>
    <body>
        
        <h1>Agregar</h1>
        <form name="crearPuesto" method="POST"  action="<c:url value = '/crearPuesto' />">
            
            <label><p style="color:#F14FC8">Nombre:</label>
            <input  type="text" id="nombre" name ="nombre"/>
            <input  type="text" id="descripcion" name ="descripcion"/>
            <input  type="text" id="menu" name ="menu"/>
            <input  type="float" id="latitud" name ="latitud"/>
            <input  type="float" id="longitud" name ="longitud"/>
            <div>
                <input type="submit"/>
            </div>
        </form>
        <h1>
            <a href="listapuesto ">Lista de Puestos </a> 
        </h1>    
        <h2><form method="POST" action="/BlueRabbit/puesto">
                <h2>Buscar por nombre</h2>
                <input id="nombre2" name="nombre" type="text" placeholder="Nombre">
                <button>Aceptar</button>
            </form></h2>
            
        
    </body>
</html>
