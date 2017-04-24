/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function initMapadmin() {
          var marcador=1;
          var myLatLng = {lat: 19.323447, lng: -99.179642};
          var map1 = new google.maps.Map(document.getElementById('map1'), {
              center: myLatLng,
              mapTypeId: 'satellite',
              zoom: 21
          });
               
       //Marcador manual
       function placeMarker(map1, location,marcador) {
           var marcador=1;
           var marker = new google.maps.Marker({
               position: location,
               draggable: true,
               map: map1
           });
           var latitud =location.lat();
           var infowindow = new google.maps.InfoWindow({
    content: 'Latitude: ' + location.lat() + '<br>Longitude: ' + location.lng()
  });
  infowindow.open(map1,marker);
       }
      
      google.maps.event.addListener(map1, 'click', function(event) {
          if(marcador===1){
              placeMarker(map1, event.latLng);
          }else{
              alert("ya no puedes agregar mas");
          }
      marcador=marcador+1;});
}