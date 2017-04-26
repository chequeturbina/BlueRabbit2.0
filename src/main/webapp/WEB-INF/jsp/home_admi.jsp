<%-- 
    Document   : home_admi
    Created on : 26/04/2017, 09:55:08 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">        

        <title>Administrador</title>

        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        
    </head>
    <body>
        <div>
            <ul>
                <li><a href="#">Puestos</a></li>
                <li><a href="#">Nosotros</a></li>
                <li style="float:right"><a class="active" href="index">Cerrar Sesión</a></li>
                <li style="float:right"><a class="active1" href="#">Admi</a></li>
            </ul>
        </div>
        <h1>Bienvenido Administrador</h1>

        <div class="container">
            <div class="row">
                <div style ="background-color: gray" align="center" class="col-sm-6">
                    
                    
                            <!-- ========== Agregar Puesto ========== -->
                <section id="agregarpuesto" name="agregarpuesto"></section>
                    <h3>Agregar Puesto</h3>
                    <form method="submit" action="/BlueRabbit/registro">
                        <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                        <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                        <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                        <input type="text" class="form-control" placeholder="Longitud" id="ongitud">
                        <input type="text" class="form-control"placeholder=Latitud id="atitud">
                        <br><br><br>
                        <button type="submit" class="btn btn-primary">Agregar Puesto</button>
                    </form>
                
                    
                </div>
                <div style ="background-color: gray; border: 0px" align="center" class="col-sm-6">
                    
                    <h3>Modificar Puesto</h3>
                                    <form>
                                    <div class="search">
                                        <input type="text" class="form-control input-sm" maxlength="100" placeholder="Buscar" />
                                        <button type="submit" class="btn btn-primary">Buscar</button>
                                    </div>
                                </form>
                                    <form>
                                    <h4>

                                            <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                                            <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                                            <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                                            <button class="btn btn-primary " onclick="validar()" value=Acceder type="button">Modificar</button>
                                    </h4>
                                </form>
                                    <div class="btn-group">
                                    <form method="GET" action="/BlueRabbit/principalbase">
                                        <br>         
                                        <button type="submit" class="btn btn-primary">Base</button>
                                            </form>
                                    </div>
                 
                    
                    
                </div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div style="background-color: black;" align="center" class="col-sm-12">
                    <h1>Administrar Usuarios</h1>
                    <br><br><br>
                    <h4><a href="lista">Lista de Usuarios</a></h4>
                    <br>
                    <h4><a href="registrar">Registrar Usuarios</a></h4>
                    <br>
                </div>
            </div>
                
        </div>
                <!-- Hasta Abajo -->
        <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>
    </body>
</html>
