<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<link href="./resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link href="./resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic"
	rel="stylesheet" type="text/css">
<link
	href="./resources/vendor/simple-line-icons/css/simple-line-icons.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="./resources/css/createPhoto.css" rel="stylesheet">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	var map;
	var markers = [];
	var marker;
	var geocoder;
	var getlat = parseFloat("${Photo.lat}");
	var getlng = parseFloat("${Photo.lng}");
	var sel_file;
	var labelName = '';
	var placeSearch, autocomplete; //검색 자동완성
	var infowindow;

	function initMap() {
		
		geocoder = new google.maps.Geocoder();
		infowindow = new google.maps.InfoWindow;
		
		if(!isNaN(getlat) && !isNaN(getlng)){
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : getlat,
					lng : getlng
				},
				zoom : 8
			});
			
			geocoder.geocode( { 'address': '${Photo.landmark}'}, function(results, status) {
	 	        if (status == google.maps.GeocoderStatus.OK) {
	 	            map.setCenter(results[0].geometry.location);
	 	            	marker = new google.maps.Marker({
	 	                map: map,
	 	                position: results[0].geometry.location
	 	            });
	 	 
	 	           infowindow.setContent(
	                		'<div class="wrap">' 
	                		+ '   <div class="info">'
	                		+ '		<div class="title"><strong>' + '${Photo.landmark}' + '</strong></div><br>'
	                		+ '        <div class="body">'
	                		+ '            <div class="desc">' 
	                		+ '					<div class="ellipsis"><strong>주소: </strong>' + results[0].formatted_address +'</div>'
	    					+ '					<div class="jibun ellipsis"><strong>위치정보: </strong>' + getlat + ", " + getlng + '</div><br>'
	    					+ '            </div>'
	    					+ '        </div>'
	    					+ '   </div>'
	    					+ '</div>')
	    					
	                infowindow.open(map, marker);
	 	        } 
	 	    });
			
		}
		else{
			map = new google.maps.Map(document.getElementById('map'), {
				center : {
					lat : -34.397,
					lng : 150.644
				},
				zoom : 8
			});
		}
		 
	}
	
	
	/*  */
	
	
	/* 변수들 */


		/* 썸네일 이미지 변경 */
		function readURL(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();
				reader.onload = function(e) {
					$('#imagePreview').css('background-image',
							'url(' + e.target.result + ')');
					$('#imagePreview').hide();
					$('#imagePreview').fadeIn(650);
				}
				reader.readAsDataURL(input.files[0]);
			}
			
			var form = $('#fileform')[0];
	        var formData = new FormData(form);
	        formData.append("fileObj", $("#imageUpload")[0].files[0]);
	        
	        $.ajax({
	        	url:"ajaximage",
	                    processData: false,
	                    contentType : false,
	                    data: formData,
	                    type: 'POST',
	                    success: function(result){
	                    	imageAnalysis(result);
	                    	$("#photoimg").val(result);
	                    	//$("#fileform").submit();
	                    }
	            });
			
			
		}
		
		/* 썸네일 이미지 변화시 */
		$("#imageUpload").change(function(e) {
			readURL(this);
		});
		
		/* 이미지 분석 */
		function imageAnalysis(tempImg){
			 $.ajax({
	         	url:"imageAnalysis",
	            data: 'tempImg=' + tempImg,
	            type: 'POST',
	            success: function(result){
	            	var tokens = tokenizer(result);
	            	$('#search').html('');
	            	if(tokens.length == 1){
	            		labelName = result;
						getPhotoInfo();
						$('#landmark').val(labelName);
						rebootMap(labelName);
	            	}else{
	            		getPhotoInfo();
	            		rebootMap_Land(result);
	            		$('#landmark').val(tokens[0]);
	            	}
	            }
	         });
		}
		
		
		/* 맵 초기화 */
		function rebootMap(labelName) {
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : -34.397,
					lng : 150.644
				}
			});
			if(autocomplete == null) {
				photoGeometry();
			}
			
			if(autocomplete != null) {
				marker = null;
				cancleTemp();
			}
		}
		
		/* 랜드마크 디텍팅 초기화 */
		function rebootMap_Land(result) {
			marker = null;
			var tokens = tokenizer(result);
			
			map = new google.maps.Map(document.getElementById('map'), {
				zoom : 15,
				center : {
					lat : parseFloat(tokens[1]),
					lng : parseFloat(tokens[2])
				}
			});
			
			geocoder = new google.maps.Geocoder();
			infowindow = new google.maps.InfoWindow;

			var latlng = {lat: parseFloat(tokens[1]), lng: parseFloat(tokens[2])};
			geocoder.geocode({'location': latlng},function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					map.setCenter(results[0].geometry.location);
					console.log(results[0].geometry.location);
						marker = new google.maps.Marker({
						position : latlng,
						map : map
					});
					infowindow.setContent('<div class="wrap">'
					+ '<div class="info">'
					+ '<div class="title"><strong>'
					+ tokens[0]
					+ '</strong></div><br>'
					+ '<div class="body">'
					+ '<div class="desc">'
					+ '<div class="ellipsis"><strong>주소: </strong>'
					+ results[0].formatted_address
					+ '</div>'
					+ '<div class="jibun ellipsis"><strong>위치정보: </strong>'
					+ tokens[1] + ", " + tokens[2]
					+ '</div><br>'
					+ '</div>'
					+ '</div>'
					+ '</div>' 
					+ '</div>')

					infowindow.open(map, marker);
				} else {
					alert('사진정보를 받아오지 못하였습니다.'
						+ status);
				}
				
				$("#lat").attr('value', tokens[1]);
				$("#lng").attr('value', tokens[2]);
			});
		}
		
		
		/* 문자열 자르기 */
		function tokenizer(tokens){
			var str = tokens.split(";");
			return str;
		}
		
		
		/* 사진 웹분석 */
		function photoGeometry(){
			geocoder = new google.maps.Geocoder();
			infowindow = new google.maps.InfoWindow;
			$("#pac-input").attr("value", labelName);
			var address = $("#pac-input").val();
			geocoder.geocode({'address' : address},function(results, status) {
				if (status == google.maps.GeocoderStatus.OK) {
					map.setCenter(results[0].geometry.location);
						marker = new google.maps.Marker({
						map : map,
						position : results[0].geometry.location
					});
					var lat = results[0].geometry.location.lat();
					var lng = results[0].geometry.location.lng();

					infowindow.setContent('<div class="wrap">'
					+ '<div class="info">'
					+ '<div class="title"><strong>'
					+ labelName
					+ '</strong></div><br>'
					+ '<div class="body">'
					+ '<div class="desc">'
					+ '<div class="ellipsis"><strong>주소: </strong>'
					+ results[0].formatted_address
					+ '</div>'
					+ '<div class="jibun ellipsis"><strong>위치정보: </strong>'
					+ lat + ", " + lng
					+ '</div><br>'
					+ '</div>'
					+ '</div>'
					+ '</div>' 
					+ '</div>')

					infowindow.open(map, marker);

					$("#lat").attr('value', lat);
					$("#lng").attr('value', lng);

				} else {
					alert('사진 정보를 받아오지 못하였습니다.'
						+ status);
				}
			});
		}
		
		/* 마커 웹분석 */
		function placeSearchBox() {
			marker = null;
			geocoder = new google.maps.Geocoder();
			infowindow = new google.maps.InfoWindow;
			
			var input = document.getElementById('pac-input2');
			var searchBox = new google.maps.places.SearchBox(input);
			
			map.addListener('bounds_changed', function() {
		    	searchBox.setBounds(map.getBounds());
		    });
			
			markers = [];
			
			searchBox.addListener('places_changed', function() {
		        var places = searchBox.getPlaces();

		        if (places.length == 0) {
		        return;
		    }
		        
		     // Clear out the old markers.
		   	markers.forEach(function(marker) {
		    	marker.setMap(null);
		    });
		    markers = [];    
		       
		    var bounds = new google.maps.LatLngBounds();
		    places.forEach(function(place) {
		    	if (!place.geometry) {
		    		console.log("Returned place contains no geometry");
		    		return;
		    	}
		   	markers.push(new google.maps.Marker({
		   		map: map,
		    	title: place.name,
		    	position: place.geometry.location
		    }));
		    if (place.geometry.viewport) {
	              // Only geocodes have viewport.
	            bounds.union(place.geometry.viewport);
	        } else {
	            bounds.extend(place.geometry.location);
	        }
		    });
	          map.fitBounds(bounds);
	        });
		} 
		
		
		
		/* 취소버튼을 눌렀을 때 */
		function cancleTemp(){
			$("#upResult2").html('');
			var text2 = '';
			
			text2 += '<div class="pac-card" id="pac-card">';
			text2 += '<div class="pac-sec">';
			text2 += '<div id="title">Autocomplete search</div>';
			text2 += '<div id="pac-container">';
			text2 += '<input id="pac-input2" type="text" placeholder="Enter a location">';
			text2 += '</div>';
			text2 += '</div>';
			text2 += '</div>';
			
			$('#search').html(text2);
			marker = null;
			placeSearchBox();
		}
		
		/* 위치정보 획득 */
		function getPhotoInfo() {
			var text = '';

			text += '<div> ';
			text += '<p> 해당 위치정보가 맞습니까?';
			text += '<input type="button" id="callMap" value="확인">';
			text += '<input type="button" id="cancle" value="취소">';
			text += '</p> ';
			text += '</div> ';

			$("#upResult2").html(text);
			
			$("#callMap").on('click', function(){
				$("#upResult2").html('');
				
			});
			
			$("#cancle").on('click', function(){
				marker.setMap(null);
		        cancleTemp();
				$("#upResult2").html('');
			
			});
		}
		
		function posting(){
			$('#fileform').submit();
		} 
	
</script>

<body id="page-top">

	<!-- Navigation -->
	<a class="menu-toggle rounded" href="#"> <i class="fas fa-bars"></i>
	</a>
	<nav id="sidebar-wrapper">
		<ul class="sidebar-nav">
			<li class="sidebar-brand">
				<a class="js-scroll-trigger" href="index">Start Bootstrap</a>
			</li>
			<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="intro">About</a>
			</li>
			<c:if test="${sessionScope.username == null}">
				<li class="sidebar-nav-item">
					<a class="js-scroll-trigger" href="register">Register</a>
				</li>
				<li class="sidebar-nav-item">
					<a class="js-scroll-trigger" href="logIn">Log In</a>
				</li>
				
			</c:if>
			<c:if test="${sessionScope.username != null}">
        		<li class="sidebar-nav-item">
          			<a class="js-scroll-trigger" href="logout">Log Out</a>
        		</li>
        		<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="showAlbum">My Journey Diary</a>
				</li>
        	</c:if>
			<li class="sidebar-nav-item">
				<a class="js-scroll-trigger" href="#contact">Search</a>
			</li>
		</ul>
	</nav>
<h1>Photos view</h1>

	<form id="fileform" action="alterPhoto"  method="POST" enctype="multipart/form-data">
	<div class="avatar-upload">
		<div class="avatar-edit">
			<!-- <input multiple="multiple" type="file" name="filename[]"/> -->
			<input type='file' id="imageUpload" name="uploadfile" accept=".png, .jpg, .jpeg" onchange="readURL(this)" />
			<label for="imageUpload" style="background-image: url(./resources/img/templates/pencil.png); background-size: 30px 30px; background-repeat: no-repeat; background-position: center;"></label>
		</div>
		<div class="avatar-preview">
			<div id="imagePreview" style="background-image: url(${Photosrc}${Photo.photoimg});"></div>
		</div>
	</div>
	<c:if test="${Photo.privacy eq 'public'}">
		<input class="privacy" type="radio" name="privacy" value="공개" checked="checked">공개 
		<input class="privacy" type="radio" name="privacy" value="비공개">비공개<br>
	</c:if>
	<c:if test="${Photo.privacy eq 'private'}">
		<input class="privacy" type="radio" name="privacy" value="공개">공개 
		<input class="privacy" type="radio" name="privacy" value="비공개" checked="checked">비공개<br>
	</c:if>
	<textarea name="photocontent" rows="10" cols="90" style="resize: none">${Photo.photocontent}</textarea>
	<input type="text" value="${Photo.hashtag}" name="hashtag">
	<input type="hidden" name="photono" value="${Photo.photono}">
	<input type="hidden" name="albumno" value="${Photo.albumno}">
	<input type="hidden" id="photoimg" name="photoimg">
	<input type="hidden" id="landmark" name="landmark">
	<input type="hidden" id="lat" name="lat">
	<input type="hidden" id="lng" name="lng">
	<br>
	<input type="date" name="dateoftravel" value="${Photo.dateoftravel}"> 
		<c:if test="${Photo.lat != null}">
			<div id="search"></div>
			<div id="map" style="width: 650px; height: 350px; display: block;">지도</div>
    		<div id="upResult2"></div>
    		<input id="pac-input" class="controls" type="hidden">
    		<div id="infowindow-content"></div>
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
		</c:if>
	</form>
	<br><br><br><br><br><br><br>
	<div id="bottomnav" class="container text-center" >
		<button type="button" class="btn btn-xl btn-light mr-4" onclick="posting()">Confirm</button>
	</div>

</body>
</html>

