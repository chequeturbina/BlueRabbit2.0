<%-- 
    Document   : newjsp
    Created on : 30/05/2017, 03:01:32 PM
    Author     : Abraham
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">

        <link rel="shortcut icon"  href="<c:url value="/imagenes/favicon.png"/> ">
        <title>Subir Foto</title>

        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/main.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/> ">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/search.css"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="/css/mapadmin.css"/>">

        <script src=" <c:url value="/js/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"/> "></script>
        <script src=" <c:url value="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"/> "></script>

        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Oswald:400,300,700"/>">
        <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=EB+Garamond"/>">

    </head>
    <body data-spy="scroll" data-offset="0" data-target="#theMenu">
        <div id="headerwrap">
        <div>
            <ul>
                <li style="float:right"><a class="active1" href="<c:url value = '/logout' /> ">Cerrar Sesión</a></li>
                <li style="float:left"><a class="active" />${usuario.correo}</a></li>
            </ul>
        </div>
        <div style="margin-top: 50px; "align="center" class="formL">        
            <h3>Cambiar Foto</h3><br>
            <form method="POST" action="<c:url value='/upload' />" enctype="multipart/form-data">
                <h3>Seleccione una imagen: </h3>
                
                <br><input type="file" name="file" />
                <br><input type="submit" value="Subir" />
            </form>
        </div>
        </div>
        <script src=" <c:url value="/js/classie.js"/> "></script>
        <script src=" <c:url value="/js/bootstrap.min.js"/> "></script>
        <script src=" <c:url value="/js/smoothscroll.js"/> "></script>
        <script src=" <c:url value="/js/main.js"/> "></script>

    </body>

    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <h3>Binary Code, 2017</h3>
    </footer>
</html>
