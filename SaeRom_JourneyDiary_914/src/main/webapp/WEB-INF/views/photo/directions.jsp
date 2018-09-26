<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <title>My Journey Diary</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    
    <link href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800" rel="stylesheet">

    <link rel="stylesheet" href="./resources/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="./resources/css/animate.css">
    
    <link rel="stylesheet" href="./resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="./resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="./resources/css/magnific-popup.css">

    <link rel="stylesheet" href="./resources/css/aos.css">

    <link rel="stylesheet" href="./resources/css/ionicons.min.css">

    <link rel="stylesheet" href="./resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="./resources/css/jquery.timepicker.css">

    
    <link rel="stylesheet" href="./resources/css/flaticon.css">
    <link rel="stylesheet" href="./resources/css/icomoon.css">
    <link rel="stylesheet" href="./resources/css/style.css">
    <script src="./resources/js/jquery-3.2.1.min.js"></script>
<style>
#map {
  height: 100%;
  width: 80%;
}

html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

.controls {
  margin-top: 10px;
  border: 1px solid transparent;
  border-radius: 2px 0 0 2px;
  box-sizing: border-box;
  -moz-box-sizing: border-box;
  height: 32px;
  outline: none;
  box-shadow: 0 2px 6px rgba(0, 0, 0, 0.3);
}

#origin-input,
#destination-input {
  background-color: #fff;
  font-family: Roboto;
  font-size: 15px;
  font-weight: 300;
  margin-left: 12px;
  padding: 0 11px 0 13px;
  text-overflow: ellipsis;
  width: 200px;
}

#origin-input:focus,
#destination-input:focus {
  border-color: #4d90fe;
}

#mode-selector {
  color: #fff;
  background-color: #4d90fe;
  margin-left: 12px;
  padding: 5px 11px 0px 11px;
}

#mode-selector label {
  font-family: Roboto;
  font-size: 13px;
  font-weight: 300;
}

</style>
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
	var getlat = parseFloat("${photoDetail.lat}");
	var getlng = parseFloat("${photoDetail.lng}"); 
	var map;
	var txt;
	
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
	
	function AutocompleteDirectionsHandler(map) { //장소 자동 완성 및 길 찾기 
		//https://developers.google.com/maps/documentation/javascript/examples/places-autocomplete-directions 참고
		this.map = map;
		this.originPlaceId = null;
		this.travelMode = 'WALKING';
		var originInput = document.getElementById('origin-input');
		var modeSelector = document.getElementById('mode-selector');
		this.directionsService = new google.maps.DirectionsService;
		this.directionsDisplay = new google.maps.DirectionsRenderer;
		this.directionsDisplay.setMap(map);
		this.directionsDisplay.setPanel(document.getElementById('directions-panel'));
		
		var originAutocomplete = new google.maps.places.Autocomplete( //출발 칸
			originInput, {
				placeIdOnly: true
		});
		
		// 이동수단 클릭이벤트
		this.setupClickListener('changemode-walking', 'WALKING');
		this.setupClickListener('changemode-bicycling', 'BICYCLING');
	    this.setupClickListener('changemode-transit', 'TRANSIT');
	    this.setupClickListener('changemode-driving', 'DRIVING');
		
	    //도착 위치로 화면 이동
		this.setupPlaceChangedListener(originAutocomplete, 'ORIG');
	    
	    //맵 화면 상단 왼쪽에 검색창과 이동수단(radio형식) 버튼 위치
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(originInput);
		this.map.controls[google.maps.ControlPosition.TOP_LEFT].push(modeSelector);
	}
	
	//자동완성...클릭시 
	AutocompleteDirectionsHandler.prototype.setupClickListener = function(id, mode) { 
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
		
		//bindTo() - 해당 뷰포트가 변경되는 경우에도 결과를지도의 viewport에 ....
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
	
	//루트 검색과 정보를 뿌림(수정중)
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
		    	txt = {};
		    	var legs = response.routes[0].legs;
		    	
		    	for (i = 0; i < legs.length; i++) { //경로 ...수정중
		    		var steps = legs[i].steps;
		    		for (j = 0; j < steps.length; j++) {
		    			if (steps[j].duration.value > 100) {
		    				txt[j] = document.createElement('a');
		    				txt[j].appendChild(document.createTextNode('text for a custom link'));
		                    txt[j].setAttribute('href','#something')
		                    steps[j].instructions = steps[j].instructions;
		    			}
		    		}
		    	}
		      me.directionsDisplay.setDirections(response);
		      
		      
		    /*   var center = response.routes[0].overview_path[Math.floor(response.routes[0].overview_path.length / 2)];
			    infowindow.setPosition(center);
			    infowindow.setContent(response.routes[0].legs[0].duration.text + "<br>" + response.routes[0].legs[0].distance.text);
			    infowindow.open(me.map); */
		    } else {
		      window.alert('Directions request failed due to ' + status);
		    }
		  });
		
	}
</script>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index2">Journey Diary :D</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="oi oi-menu"></span> Menu
      </button>

      <div class="collapse navbar-collapse" id="ftco-nav">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active"><a href="index2" class="nav-link">Home</a></li>
          <li class="nav-item"><a href="about" class="nav-link">About</a></li>
          <li class="nav-item"><a href="services" class="nav-link">Services</a></li>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="portfolio.html" id="dropdown04" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Diaries</a>
              <div class="dropdown-menu" aria-labelledby="dropdown04">
                <a class="dropdown-item" href="photoList">Journey Diary</a>
                <a class="dropdown-item" href="javascript:logins()">My Journey Diary</a>
              </div>
          </li>
          <c:if test="${sessionScope.username != null}">
          <li class="nav-item"><a href="viewProfile" class="nav-link">My Page</a></li>
          <li class="nav-item cta"><a href="logout" class="nav-link"><span>Log Out</span></a></li>
          </c:if>
          <c:if test="${sessionScope.username == null}">
          <li class="nav-item cta"><a href="logIn" class="nav-link"><span>Log In</span></a></li>
          </c:if>
        </ul>
        <div class="SearchBar">
  			<input type="text" placeholder="Please put keywords" /><div class="fa fa-search"></div>
  		</div>
      </div>
    </div>
  </nav>
    <!-- END nav -->
    
  <div class="hero-wrap js-fullheight">
      <div class="overlay"></div>
      <div id="particles-js"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index2">Home</a></span> <span>directions</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Journey Diary</h1>
          </div>
        </div>
      </div>
    </div>
    
      		
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
    <div id="directions-panel">
    	<b>출발</b>
    	<label></label>
    	<b>도착</b>
    </div>
	<div id="result"></div>
	<input id="pac-input" class="controls" type="hidden">
	<div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="./resources/js/jquery.min.js"></script>
  <script src="./resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="./resources/js/popper.min.js"></script>
  <script src="./resources/js/bootstrap.min.js"></script>
  <script src="./resources/js/jquery.easing.1.3.js"></script>
  <script src="./resources/js/jquery.waypoints.min.js"></script>
  <script src="./resources/js/jquery.stellar.min.js"></script>
  <script src="./resources/js/owl.carousel.min.js"></script>
  <script src="./resources/js/jquery.magnific-popup.min.js"></script>
  <script src="./resources/js/aos.js"></script>
  <script src="./resources/js/jquery.animateNumber.min.js"></script>
  <script src="./resources/js/bootstrap-datepicker.js"></script>
  <script src="./resources/js/particles.min.js"></script>
  <script src="./resources/js/particle.js"></script>
  <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
  <script src="./resources/js/scrollax.min.js"></script>
  <script src="./resources/js/main.js"></script>
  </body>
</html>

