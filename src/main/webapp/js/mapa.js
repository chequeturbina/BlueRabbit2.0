/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//MAPA
 function initMap() {
          var marcador=1;
          var myLatLng = {lat: 19.323447, lng: -99.179642};
          var map = new google.maps.Map(document.getElementById('map'), {
              center: myLatLng,
              mapTypeId: 'satellite',
              zoom: 21
          });
               
       //Marcador manual
       function placeMarker(map, location,marcador) {
           var marcador=1;
           var marker = new google.maps.Marker({
               position: location,
               map: map
           });
       }
      
      google.maps.event.addListener(map, 'click', function(event) {
          if(marcador===1){
              placeMarker(map, event.latLng);
          }else{
              alert("ya no puedes agregar mas");
          }
      marcador=marcador+1;});
      }
