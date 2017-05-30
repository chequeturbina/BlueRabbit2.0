<%-- 
    Document   : registrar
    Created on : 18/04/2017, 02:42:58 AM
    Author     : Abraham
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrarse</title>
        
       
  <link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css"/>">
  <link rel="stylesheet" type="text/css" href="<c:url value="http://fonts.googleapis.com/css?family=Titillium+Web:400,300,600"/>">

  <script type="text/javascript">
function validate(){
	if(document.getElementById('contrasena').value.length < 7) {
		alert('la contraseña debe tener al menos 6 caracteres');
		}else{
		document.getElementById('registrarse').submit();
	}
}
</script>
  
    </head>
    <body>
        <div id="headerwrap">
          <div style="margin-top: 50px; "align="center" class="formL">

          <h2>Registrate a Blue Rabbit🐰 </h2>
          
          <form  action="registrarse" method="get" id="registrarse">
          
         
            <div class="field-wrap">
                <input type="text" required autocomplete="off" placeholder="Nombre" name="nombre"/>
            </div>
        
          <div class="field-wrap">
            <input type="email" required autocomplete="off" placeholder="Correo" name="correo"/>
          </div>
          
          <div class="field-wrap">
            <input type="password" required autocomplete="off" placeholder="Contraseña" minlength="6" maxlength="12" name="contrasena" id="contrasena"/>
          </div>
               <div class="field-wrap">
            <input type="text" required autocomplete="off" list= "carrera" placeholder="Selecciona tu carrera" name="carrera"/>
              <datalist id="carrera">
                   <option value="Actuaria"/>
                   <option value="Biología"/>
                   <option value="C. Computación"/>
                   <option value="C. de la Tierra"/>
                   <option value="Física"/>
                   <option value="Física Biomédica"/>
                   <option value="Matemáticas"/>
                   <option value="Matemáticas Aplicadas"/>
             </datalist>
          </div>
               
          <div class="field-wrap">
            <input type="number" min="18" max="40" step="1" value="21" placeholder="Edad" name="edad">
          </div>

          <!--div class="field-wrap">
            <input type="text" placeholder="Selecciona un archivo" name="url_foto">
          </div-->
          
          <button type="submit" class="button button-block" onClick="validate()"/>Enviame :) </button>
          </form>

        <!-- Hasta Abajo -->
        <br>
        <form name="index" method="GET"  action="<c:url value = '/' />">
            <button type="submit" class="button" />Salir</button> <!--aqui que-->
        </form>
        
            <footer class="container-fluid bg-4 text-center">
            <h3>Binary Code, 2017</h3>
        </footer>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
        
    </body>
</html>
