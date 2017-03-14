<!DOCTYPE html>
<html>
<head>
<style type="text/css">
html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

#map {
	height: 100%;
}
</style>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js">
	
</script>
</head>
<body onload="initialize()">
	<div id="map" style="width: 320px; height: 480px;"></div>
  <div>
    <input id="address" type="textbox" value="perez del viso 4428">
    <input type="button" value="Encode" onclick="codeAddress()">
    <div id="lat"></div>
    <div id="lng"></div>
    
  </div>
	<script type="text/javascript">

	var geocoder;
	  var map;
	  function initialize() {
	    geocoder = new google.maps.Geocoder();
	    var latlng = new google.maps.LatLng(-34.397, 150.644);
	    var mapOptions = {
	      zoom: 8,
	      center: latlng
	    }
	    map = new google.maps.Map(document.getElementById("map"), mapOptions);
	  }

	  function codeAddress() {
	    var address = document.getElementById("address").value;
	    geocoder.geocode( { 'address': address}, function(results, status) {
	      if (status == google.maps.GeocoderStatus.OK) {
		    $("#lat").html(results[0].geometry.location.lat());
		    $("#lng").html(results[0].geometry.location.lng());
		    
	        map.setCenter(results[0].geometry.location);
	        var marker = new google.maps.Marker({
	            map: map,
	            position: results[0].geometry.location
	        });
	      } else {
	        alert("Geocode was not successful for the following reason: " + status);
	      }
	    });
	  }
	  </script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDY3zs1zhvibm2AGctNPAPd2AC6Fe7QvPA&callback=initialize">
    </script>
</body>
</html>