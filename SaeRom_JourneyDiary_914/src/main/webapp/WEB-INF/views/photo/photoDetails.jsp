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
<script type="text/javascript">
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
	}
	$("#imageUpload").change(function() {
		readURL(this);
	});

	$(function() {
		//글자수 제한 수정해야 함. 
		
		$('#the_text').keyup(function() {
		    
			  var characterCount = $(this).val().length,
			      current = $('#current_text'),
			      maximum = $('#maximum'),
			      theCount = $('#the-count');
			    
			  current.text(characterCount);
			 
			  
			  /*This isn't entirely necessary, just playin around*/
			  if (characterCount < 70) {
			    current.css('color', '#666');
			  }
			  if (characterCount > 70 && characterCount < 90) {
			    current.css('color', '#6d5555');
			  }
			  if (characterCount > 90 && characterCount < 100) {
			    current.css('color', '#793535');
			  }
			  if (characterCount > 100 && characterCount < 120) {
			    current.css('color', '#841c1c');
			  }
			  if (characterCount > 120 && characterCount < 139) {
			    current.css('color', '#8f0001');
			  }
			  
			  if (characterCount >= 140) {
			    maximum.css('color', '#8f0001');
			    current.css('color', '#8f0001');
			    theCount.css('font-weight','bold');
			  } else {
			    maximum.css('color','#666');
			    theCount.css('font-weight','normal');
			  }
			  
			      
			});

		
		$('#the_textarea').keyup(function() {
		    
			  var characterCount = $(this).val().length,
			      current = $('#current_textarea'),
			      maximum = $('#maximum'),
			      theCount = $('#the-count');
			    
			  current.text(characterCount);
			 
			  
			  /*This isn't entirely necessary, just playin around*/
			  if (characterCount < 70) {
			    current.css('color', '#666');
			  }
			  if (characterCount > 70 && characterCount < 90) {
			    current.css('color', '#6d5555');
			  }
			  if (characterCount > 90 && characterCount < 100) {
			    current.css('color', '#793535');
			  }
			  if (characterCount > 100 && characterCount < 120) {
			    current.css('color', '#841c1c');
			  }
			  if (characterCount > 120 && characterCount < 139) {
			    current.css('color', '#8f0001');
			  }
			  
			  if (characterCount >= 140) {
			    maximum.css('color', '#8f0001');
			    current.css('color', '#8f0001');
			    theCount.css('font-weight','bold');
			  } else {
			    maximum.css('color','#666');
			    theCount.css('font-weight','normal');
			  }
			  
			      
			});
	});
	
	
	
	var map;
	var markers = [];
	var geocoder;
	var getlat = parseFloat("${photo.lat}");
	var getlng = parseFloat("${photo.lng}");
	
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
			
			var latlng = {lat: getlat, lng: getlng};
			geocoder.geocode({'location': latlng}, function(results, status) {
	 	        if (status == google.maps.GeocoderStatus.OK) {
	 	            map.setCenter(results[0].geometry.location);
	 	            var marker = new google.maps.Marker({
	 	               position: latlng,
	 	               map: map
	 	            });
	 	 
	 	           infowindow.setContent(
	                		'<div class="wrap">' 
	                		+ '   <div class="info">'
	                		+ '		<div class="title"><strong>' + '${photo.landmark}' + '</strong></div><br>'
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
	function logins(){
	    if(${sessionScope.username == null}) {
	    	location.href="logIn";
	    }
	    else {
	    	location.href="showAlbum";
	    }
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
	
	<!-- <div class="js-fullheight"> -->
    <div class="hero-wrap js-fullheight">
      <div class="overlay"></div>
      <div id="particles-js"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-center justify-content-center" data-scrollax-parent="true">
          <div class="col-md-6 ftco-animate text-center" data-scrollax=" properties: { translateY: '70%' }">
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index2">Home</a></span> <span>PhotoDetais</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Journey Diary</h1>
          </div>
        </div>
      </div>
    </div>
    
   <section class="ftco-section ftco-degree-bg">
      	<div class="container">
       	 	<div class="row">
	          	<div class="col-md-8 ftco-animate">
	           	 	<p>
	            	  <img src="${Photosrc}${photo.photoimg}" alt="" class="img-fluid" style="width: 100%">
	            	</p> 
	    			<p>
						<div class="comment-body">
							<div>
			    				<c:if test="${photo.privacy eq 'public'}">
								<span>
									<input class="privacy" type="radio" name="privacy" value="public" checked="checked">공개 
									<input class="privacy" type="radio" name="privacy" value="private">비공개&ensp;
								</span>
								</c:if>
								<c:if test="${photo.privacy eq 'private'}">
								<span>
									<input class="privacy" type="radio" name="privacy" value="public">공개 
									<input class="privacy" type="radio" name="privacy" value="private" checked="checked">비공개&ensp;
								</span>
								</c:if>
								<span class="icon-calendar"></span> ${photo.dateoftravel} &ensp;
								<span class="icon-person"></span>글쓴이 &ensp;
								<span class="icon-chat"></span> 조회수
							</div>
						</div>
	    			</p>
	    			<h2 class="mb-3">${photo.photocontent}</h2>
	    			<div class="tag-widget post-tag-container mb-5 mt-5" style="padding: 0">
	    				<div class="tagcloud">
	    					<a href="#" class="tag-cloud-link">${photo.hashtag}</a>
			    		</div>
	    			</div>
	    			
	    			<div class="about-author p-5 bg-light">
	    				<!-- ############### -->
	    				<c:if test="${photo.lat != null}">
							<div class="wrapper" style="align: center;">
								<div id="map" style="width: auto; height: 350px; display: block;">Location</div>
							</div>
							<input id="pac-input" class="controls" type="hidden">
							<div id="infowindow-content"></div>
						</c:if>
						
						
	    				<!-- ################33 -->
	    			</div><br>
					<p><a href="directions" class="btn btn-primary py-3 px-5">거리 검색</a>
	    		</div> <!-- .col-md-8 -->
          <div class="col-md-4 sidebar ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="icon fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Recent Blog</h3>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url('./resources/img/images/image_1.jpg');"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url('./resources/img/images/image_2.jpg');"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <a class="blog-img mr-4" style="background-image: url('./resources/img/images/image_3.jpg');"></a>
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">dish</a>
                <a href="#" class="tag-cloud-link">menu</a>
                <a href="#" class="tag-cloud-link">food</a>
                <a href="#" class="tag-cloud-link">sweet</a>
                <a href="#" class="tag-cloud-link">tasty</a>
                <a href="#" class="tag-cloud-link">delicious</a>
                <a href="#" class="tag-cloud-link">desserts</a>
                <a href="#" class="tag-cloud-link">drinks</a>
              </div>
            </div>

            <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, autem necessitatibus voluptate quod mollitia delectus aut, sunt placeat nam vero culpa sapiente consectetur similique, inventore eos fugit cupiditate numquam!</p>
            </div>
          </div>

        </div>
      </div>
   		
	</section>
	
	<%-- <input type="button" value="위치정보추가" onclick="insertPosition(${photo.photono})"> --%>
 <footer class="ftco-footer ftco-bg-dark ftco-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Submarine</h2>
              <p>끝없이 잠수한다.</p>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4 ml-5">
              <h2 class="ftco-heading-2">Quick Links</h2>
              <ul class="list-unstyled">
                <li><a href="index2" class="py-2 d-block">Home</a></li>
                <li><a href="about" class="py-2 d-block">About</a></li>
                <li><a href="services" class="py-2 d-block">Services</a></li>
                <li><a href="#" class="py-2 d-block">My Journey Diary</a></li>
                <li><a href="#" class="py-2 d-block">My Page</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
             <div class="ftco-footer-widget mb-4">
              <h2 class="ftco-heading-2">Contact Information</h2>
              <ul class="list-unstyled">
                <li><a href="#" class="py-2 d-block">한국무역협회 (06164) 서울특별시 강남구 영동대로 513 COEX office, 9강의실</a></li>
                <li><a href="#" class="py-2 d-block">+ 1235 2355 98</a></li>
                <li><a href="#" class="py-2 d-block">submarine@gmail.com</a></li>
              </ul>
            </div>
          </div>
          <div class="col-md">
            <div class="ftco-footer-widget mb-4">
              <ul class="ftco-footer-social list-unstyled float-md-left float-lft">
                <li class="ftco-animate"><a href="#"><span class="icon-twitter"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-facebook"></span></a></li>
                <li class="ftco-animate"><a href="#"><span class="icon-instagram"></span></a></li>
              </ul>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
		
            <p><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
			  Copyright &copy;<script>document.write(new Date().getFullYear())</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>
			  <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
          </div>
        </div>
      </div>
    </footer>
  <!-- loader -->
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