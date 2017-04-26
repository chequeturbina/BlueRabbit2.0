<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">
        
        <title>Inicio</title>
        
        <link rel="stylesheet" href="css/bootstrap.css">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
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
			<h1 class="logo"><a>BIENVENIDO</a></h1>
			<i class="icon-remove menu-close"></i>
                        <form method="GET" name=form action="/BlueRabbit/administrador">
                        <img src="imagenes/avatar.png" class="img-circle center-block" alt="Cinque Terre" width="180" height="180">
                        <h2><input class="form-control" id="correo" name="correo" placeholder="Correo" type="email" required></h2>
                        <h3><input class="form-control" id="password" name="password" placeholder="Password" type="password" required></h3>
                        <h4><button class="btn btn-danger" onclick="validar()" value=Acceder type="button">Iniciar Sesion</button></h4>
                        </form>
                        <h5><form method="GET" action="/BlueRabbit/registrar">
                            <button type="submit" class="btn btn-danger">Registrar</button>
                            </form>
                        </h5>
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
			<div id="map">
                            <script src="js/mapa.js"></script>
                            <script type='text/javascript' src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBsYhv7CnynR4gKT0JJQhNPzV-y6uqfHXI&callback=initMap"async defer></script>
				
			</div>
		</div><!-- /container -->
	</div><!-- /headerwrap -->
	
        
        
    <script src="js/classie.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/smoothscroll.js"></script>
    <script src="js/main.js"></script>
    
    
         <h1>Nuestra página principal</h1>
        <hr>
        <center>
            <form method="GET" action="/BlueRabbit/usuario">
                <h2>Ingresa nombre</h2>
                <input name="nombre" type="text" placeholder="Nombre">
                <button>Aceptar</button>
            </form>
            <br><hr>
        </center>
        <a href="lista">Lista de Usuarios |</a>
        <a href="registrar"> Registrar Usuarios |</a>
        <a href="iniciarSesion"> Iniciar Sesión </a>
    
    <!-- Hasta Abajo -->
    <footer class="container-fluid bg-4 text-center">
        <p>Binary Code</p> 
    </footer>
    
    </body>
</html>
