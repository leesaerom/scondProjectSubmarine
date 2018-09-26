<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel Modes in Directions</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var directionsDisplay;
	var directionsService;
	var originPlaceId = null; //출발id
	var destinationPlaceId = null; //도착id
	var originInput //출발
	var destinationInput //도착입력
	var modeSelector;
	var marker;
	var infowindow;
	/* var getlat = parseFloat("${photoDetail.lat}");
	var getlng = parseFloat("${photoDetail.lng}"); */
	var map;

	output();
	function output() {
		var result ='';
		var length = ${photoListlength};
		var resp2 = ${photoList};
		
		alert(resp2);
		alert("${photoList[0].photono}, ${photoList[0].albumno}, ${photoList[0].keyword},${photoList[0].dateoftravel}");
		alert(resp2.photono);
		for(var i; i< length; i++) {
			result += '<div class="content"> ';
			result += '<p>'+ ${photoList[i].photono} + '</p> ';
			result += '<p>'+ resp2[i].albumno +'</p> ';
			result += '<p>'+ resp2[i].keyword   +'</p> ';
			/* result += '<p>'+ resp[i].dateoftravel   +'</p> ';
			result += '<p>'+ resp[i].lat   +'</p> ';
			result += '<p>'+ resp[i].lng   +'</p> '; */
			result += '</div>';
		}
		alert(result);
		$("#result").html(result);
	}
	
	function initMap(latitude, longitude) {
		map = new google.maps.Map(document.getElementById('map'), {
			center : {
				lat : getlat,
				lng : getlng
			},
			zoom : 14,
			panControl : true,
			zoomControl : true,
			mapTypeControl : true,
			scaleControl : true,
			streetViewControl : true,
			overviewMapControl : true,
			rotateControl : true,
			mapTypeId : google.maps.MapTypeId.ROADMAP
		});
		marker = new google.maps.Marker({
		    map: map,
		    position: new google.maps.LatLng(getlat, getlng)
		});
		infowindow = new google.maps.InfoWindow();
		new AutocompleteDirectionsHandler(map);
 	}
		
	
	function AutocompleteDirectionsHandler(map) {
		this.map = map;
		this.originPlaceId = null;
		this.travelMode = 'WALKING';
		var originInput = document.getElementById('origin-input');
		var modeSelector = document.getElementById('mode-selector');
		this.directionsService = new google.maps.DirectionsService;
		this.directionsDisplay = new google.maps.DirectionsRenderer;
		this.directionsDisplay.setMap(map);
		
		var originAutocomplete = new google.maps.places.Autocomplete( //출발 칸
			originInput, {
				placeIdOnly: true
		});
		
		this.setupClickListener('changemode-walking', 'WALKING');
		this.setupClickListener('changemode-bicycling', 'BICYCLING');
	    this.setupClickListener('changemode-transit', 'TRANSIT');
	    this.setupClickListener('changemode-driving', 'DRIVING');
		
		this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
	}
	
	AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) { //자동완성...
		var radioButton = document.getElementById(id);
		var me = this;
		radioButton.addEventListener('click', function() { //이동수단 선택
			marker.setMap(null);
			me.travelMode = mode;
			me.route();
			me.infowindow=null;
		});
	}
	
	AutocompleteDirectionsHandler.prototype.setupPlaceChangedListener = function(autocomplete, mode) {
		var me = this;
		autocomplete.bindTo('bounds', this.map);
		autocomplete.addListener('place_changed', function() {
			var place = autocomplete.getPlace();
			if (!place.place_id) {
				window.alert("Please select an option from the dropdown list.");
				return;
			}
			me.originPlaceId = place.place_id;
			me.route();
		});
	}
	
	AutocompleteDirectionsHandler.prototype.route = function() {
		  if (!this.originPlaceId) {
		    return;
		  }
		  var me = this;
		  this.directionsService.route({
		    origin: {
		      'placeId': this.originPlaceId
		    },
		    destination: new google.maps.LatLng(getlat, getlng),
		    travelMode: this.travelMode
		  }, function(response, status) {
		    if (status === 'OK') {
		      me.directionsDisplay.setDirections(response);
		      var center = response.routes[0].overview_path[Math.floor(response.routes[0].overview_path.length / 2)];
			    infowindow.setPosition(center);
			    infowindow.setContent(response.routes[0].legs[0].duration.text + "<br>" + response.routes[0].legs[0].distance.text);
			    infowindow.open(me.map);
		    } else {
		      window.alert('Directions request failed due to ' + status);
		    }
		  });
		
	}
	
		
</script>
<style>
#map {
	height: 80%;
	width: 80%;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}

</style>
</head>

<body>
	<h1>photoDetails view</h1>
	<input id="origin-input" class="controls" type="text" placeholder="Enter an origin location">

    <div id="mode-selector" class="controls">
      <input type="radio" name="type" id="changemode-walking" checked="checked">
      <label for="changemode-walking">Walking</label>
      
      <input type="radio" name="type" id="changemode-bicycling">
      <label for="changemode-bicycling">Bicycling</label>

      <input type="radio" name="type" id="changemode-transit">
      <label for="changemode-transit">Transit</label>

      <input type="radio" name="type" id="changemode-driving">
      <label for="changemode-driving">Driving</label>
    </div>

    <div id="map"></div>
    <div id="directions-panel"></div>
	
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
</body>
</html>

