/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//MAPA
var marcador=1;
 function initMap() {
          var myLatLng = {lat: 19.323447, lng: -99.179642};
          var map = new google.maps.Map(document.getElementById('map'), {
              center: myLatLng,
              mapTypeId: 'satellite',
              zoom: 21
          });
               
       //Marcador manual
       function placeMarker(map, location) {
           var marker = new google.maps.Marker({
               position: location,
               map: map  
           });
           //var infowindow = new google.maps.InfoWindow({
               //content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
           //});
           //infowindow.open(map,marker);
       }
      
      google.maps.event.addListener(map, 'click', function(event) {
          placeMarker(map, event.latLng);});
      }
