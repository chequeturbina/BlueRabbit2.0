/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/*function initMapadmin() {
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

function openInfoWindow(marker) {
    var markerLatLng = marker.getPosition();
    infoWindow.setContent([
        '&lt;b&gt;La posicion del marcador es:&lt;/b&gt;&lt;br/&gt;',
        markerLatLng.lat(),
        ', ',
        markerLatLng.lng(),
        '&lt;br/&gt;&lt;br/&gt;Arr&amp;aacute;strame y haz click para actualizar la posici&amp;oacute;n.'
    ].join(''));
    infoWindow.open(map, marker);
}

    google.maps.event.addListener(map1, 'click', function(event) {  
        if(marcador===1){
            placeMarker(map1, event.latLng);
        }else{
            alert("ya no puedes agregar mas");
        }
        marcador=marcador+1;});
      
    }*/
var map1 = null;
		var infoWindow = null;
		function openInfoWindow(marker) {
		    var markerLatLng = marker.getPosition();
                    document.getElementById('latitud').value = markerLatLng.lat();
                    document.getElementById('longitud').value = markerLatLng.lng();
		    infoWindow.setContent([
		        '<strong>La posicion del marcador es:</strong><br/>',
		        markerLatLng.lat(),
		        ', ',
		        markerLatLng.lng(),
		        '<br/>Arrástrame y haz click para actualizar la posición.'
		    ].join(''));
		    infoWindow.open(map1, marker);
		}
		function initialize() {
		    var myLatlng = new google.maps.LatLng(19.323447,-99.179642);
		    var myOptions = {
		      zoom: 21,
		      center: myLatlng,
		      mapTypeId: 'satellite'
		    }
		    map1 = new google.maps.Map($("#map1").get(0), myOptions);
		    infoWindow = new google.maps.InfoWindow();
		    var marker = new google.maps.Marker({
		        position: myLatlng,
		        draggable: true,
		        map: map1
		    });
		    google.maps.event.addListener(marker, 'click', function(){
		        openInfoWindow(marker);
		    });
		}
		$(document).ready(function() {
		    initialize();
		});