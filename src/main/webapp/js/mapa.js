/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
//MAPA
 function initMap() {
          var myLatLng = {lat: 19.323447, lng: -99.179642};
          var map = new google.maps.Map(document.getElementById('map'), {
              center: myLatLng,
              mapTypeId: 'satellite',
              zoom: 21
          });
               
       var contentString = 'Come down and play';
       
       var infowindow = new google.maps.InfoWindow({
           content: contentString
       });
      
        // Marcador en la misma posicion
          var marker = new google.maps.Marker({
              map: map,
              position: myLatLng,
              title: 'Marcador',
              animation: google.maps.Animation.BOUNCE
             
          });
          
          marker.addListener('click', function() {
              infowindow.open(map, marker);
          });
      }

