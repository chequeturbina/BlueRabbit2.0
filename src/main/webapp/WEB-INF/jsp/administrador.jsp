<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <link rel="shortcut icon"  href="imagenes/favicon.png">
        <title>Inicio</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/search.css">
        <link rel="stylesheet" href="css/mapadmin.css">
        
        <script src="js/jquery.min.js"></script>
        <script src="js/modernizr-custom.js"></script>
        <script src="js/validar.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        
        <link href='http://fonts.googleapis.com/css?family=Oswald:400,300,700' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=EB+Garamond' rel='stylesheet' type='text/css'>
        
    </head>
    <body data-spy="scroll" data-offset="0" data-target="#theMenu">
       
      
        <!-- Menu -->
	<nav class="menu" id="theMenu">
		<div class="menu-wrap">
			<h1 class="logo"><a href="index.html#home">Minimal</a></h1>
			<i class="icon-remove menu-close"></i>
                        <a href="#home" class="smoothScroll">Home</a>
			<a href="#agregarpuesto" class="smoothScroll">Agregar Puesto</a>
			<a href="#modificarpuesto" class="smoothScroll">Modificar Puesto</a>
			<a href="#contact" class="smoothScroll">Contact</a>
		</div>
		
		<!-- Menu button -->
		<div id="menuToggle"><i class="icon-reorder"></i></div>
	</nav>


	
	<!-- ========== HEADER SECTION ========== -->
	<section id="home" name="home"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="logo">
				<img src="imagenes/logo.png">
                                
			</div>
			<br>
			<div class="row">
				<h1>ADMINISTRADOR</h1>
				<br>
				<h3>Desliza el menu para realizar una accion.</h3>
				<br>
				<br>
				<div class="col-lg-6 col-lg-offset-3">
				</div>
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
        <!-- ========== Agregar Puesto ========== -->
	<section id="agregarpuesto" name="agregarpuesto"></section>
	<div id="headerwrap">
		<div class="container">
			<div class="row">
				<h3>Agregar Puesto</h3>
                                 <form method="submit" action="/BlueRabbit/registro"> <!--Verificar que lo mande a admi -->
                                <div class="col-xs-5 btn-group">
                                            <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                                            <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                                            <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                                             <input type="text" class="form-control" placeholder="Longitud" id="ongitud">
                                             <input type="text" class="form-control"placeholder=Latitud id="atitud">
                                            
                                              <button type="submit" class="btn btn-primary">Agregar Puesto</button>
                                </div>
                                </form>
                                   <div id="map1">
                            <script src="js/mapadmin.js"></script>
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMapadmin"async defer></script>
				
			</div>    
			</div>
			</div>
		</div>
	
        
        <!-- ========== Modificar Puesto ========== -->
	<section id="modificarpuesto" name="modificarpuesto"></section> <!--Verificar que lo mande a admi -->
	<div id="headerwrap">
		<div class="container">
                                    <h3>Modificar Puesto</h3>
                                    <form>
                                    <div class="search">
                                        <input type="text" class="form-control input-sm" maxlength="100" placeholder="Search" />
                                        <button type="submit" class="btn btn-primary">Search</button>
                                    </div>
                                </form>
                                    <form>
                                    <h4>
                                    <div class="col-xs-5 btn-group">
                                            <input type="text" class="form-control" placeholder="Nombre de Puesto" id="nombremod">
                                            <textarea class="form-control" rows="5" placeholder="Descripcion de Puesto" id="comment"></textarea>
                                            <textarea class="form-control" rows="5" placeholder="Menu de Puesto" id="comment"></textarea>
                                            <button class="btn btn-primary " onclick="validar()" value=Acceder type="button">Modificar</button>
                                    </div>
                                    </h4>
                                </form>
                                    <div class="btn-group">
                                    <form method="GET" action="/BlueRabbit/principalbase">
                                                 <button type="submit" class="btn btn-primary">Base</button>
                                            </form>
                                    </div>
                               
               
		</div><!-- /container -->
	</div><!-- /f -->
        
        
    <script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/main.js"></script>
   
    
    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <p>Binary Code</p> 
    </footer>
    
    </body>
</html>

