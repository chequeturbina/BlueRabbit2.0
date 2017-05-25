/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
 /* global google */

function updateMarkerPosition(latLng){
     document.getElementById('latitud').value=latLng.lat();
     document.getElementById('longitud').value=latLng.lng();
 }
 function updateMarkerAddress(str){
     document.getElementById('address').innerHTML = str;
 }
 function geocodePosition(pos){
     geocoder.geocode({
         latLng: pos
     });
 }
 var map;
 var latLng;
 var geocoder;
 function initialize(){
     geocoder= new google.maps.Geocoder();
     latLng = new google.maps.LatLng(19.323447,-99.179642);
     map = new google.maps.Map(document.getElementById('mapa'),{
         zoom: 20,
         center: latLng,
         mapTypeId: 'satellite'
         
     });
     marker = new  google.maps.Marker({
         position: latLng,
         tittle: 'Point A',
         map: map,
         draggable: true
     });
     //Actualizar position del marcador
     updateMarkerPosition(latLng);
     geocodePosition(latLng);
     //Draggable marcadoor
     google.maps.event.addListener(marker, 'drag', function(){
         updateMarkerPosition(marker.getPosition());
     });
     google.maps.event.addListener(marker,'dragend', function(){
         geocodePosition(marker.getPosition());
     });
 }