<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<title>Snipp - Free Bootstrap 4 Template by Colorlib</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Work+Sans:100,200,300,400,700,800"
	rel="stylesheet">

<link rel="stylesheet"
	href="./resources/css/open-iconic-bootstrap.min.css">
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
<style>
	#map {
		width: 45em;
		height: 31em;
		float: left;
	}
</style>
<script>
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
	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="index2">Journey Diary :D</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a href="index2" class="nav-link">Home</a></li>
					<li class="nav-item"><a href="about" class="nav-link">About</a></li>
					<li class="nav-item"><a href="services" class="nav-link">Services</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="portfolio.html"
						id="dropdown04" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false">Diaries</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="photoList">Journey Diary</a> <a
								class="dropdown-item" href="javascript:logins()">My
								Journey Diary</a>
						</div></li>
					<c:if test="${sessionScope.username != null}">
						<li class="nav-item"><a href="viewProfile" class="nav-link">My
								Page</a></li>
						<li class="nav-item cta"><a href="logout" class="nav-link"><span>Log
									Out</span></a></li>
					</c:if>
					<c:if test="${sessionScope.username == null}">
						<li class="nav-item cta"><a href="logIn" class="nav-link"><span>Log
									In</span></a></li>
					</c:if>
				</ul>
				<div class="SearchBar">
					<input type="text" placeholder="Please put keywords" />
					<div class="fa fa-search"></div>
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
			<div
				class="row no-gutters slider-text align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-6 ftco-animate text-center"
					data-scrollax=" properties: { translateY: '70%' }">
					<p class="breadcrumbs"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">
						<span class="mr-2"><a href="index2">Home</a></span> <span>About</span>
					</p>
					<h1 class="mb-3 bread"
						data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">About
						Us</h1>
					<br>
					<div class="cntr">
						<div class="cntr-innr">
						  <label class="search" for="inpt_search">
								<input id="inpt_search" type="text" style="padding-bottom: 5px;"/>
							</label>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="ftco-section" style="text-align: center;">
		<div class="container">
			<div class="row justify-content-center mb-5 pb-5">
				<div class="col-md-7 text-center heading-section ftco-animate">
					<span class="subheading">Team</span>
					<h2 class="mb-4">Submarine</h2>
					<p>Far far away, behind the word mountains, far from the
						countries Vokalia and Consonantia, there live the blind texts.
						Separated they live in</p>
				</div>
			</div>
			<div class="row">
				<div class="col-md-4 mb-5 ftco-animate" style="padding-left: 10em;">
					<div class="block-10" style="width: 15em;">
						<div class="person-info mb-2">
							<span class="name">Kim Daehoon</span> <span class="position">Web
								Developer, Team Leader</span>
						</div>
						<img src="./resources/img/team/KimD.JPG" alt=""
							class="img-fluid mb-3">
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>

						<p>
							<span>Address:</span> 198 West 21th Street, Suite 721 New York NY
							10016
						</p>
						<p>
							<span>Phone:</span> <a href="tel://1234567920">+ 1235 2355 98</a>
						</p>
						<p>
							<span>Email:</span> <a href="mailto:info@yoursite.com">info@yoursite.com</a>
						</p>

						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-4 mb-5 ftco-animate" style="padding-left: 10em;">
					<div class="block-10" style="width: 15em;">
						<div class="person-info mb-2">
							<span class="name">Lee Saerom</span> <span class="position">Web
								Developer</span>
						</div>
						<img src="./resources/img/team/Lee.jpg" alt=""
							class="img-fluid mb-3">
						<p>A small river named Duden flows by their place and supplies
							it with the necessary regelialia.</p>

						<p>
							<span>Address:</span> 198 West 21th Street, Suite 721 New York NY
							10016
						</p>
						<p>
							<span>Phone:</span> <a href="tel://1234567920">+ 82 010 4935 0369</a>
						</p>
						<p>
							<span>Email:</span> <a href="mailto:info@yoursite.com">romjeru0902@gmail.com</a>
						</p>

						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-section testimony-section bg-light">
		<div class="container bg-light">
			<div class="row d-flex mb-5 contact-info">
				<div class="section overlay-container section-bg-color"
					style="background-image: url('./resources/segroup/images/classic/hd-4.jpg');">
					<div class="col-md-7 text-center heading-section ftco-animate">
					<h1
						style="text-align: center; font-size: 70px; margin-top: 5%; margin-bottom: 5%;">
						<b style="font-weight: 900;"><font style="color: #3ac6ff;">CONTACT</font></b>
					</h1>
					</div>
					
				<div class="row">
					<div class="col-md-12">
						<div class="item text-center">
						<div class="testimony-wrap p-4 pb-5" style="width: 20em; float: left;">
							<h4 class="text-m" data-langNum="22">주소</h4>
							<hr class="space xs" />
							<p data-langNum="23">
								06164 서울특별시<br /> 강남구 영동대로 513<br /> (삼성동, 코엑스4층)
							</p>
							<hr class="space s" />
							<h4 class="text-m" data-langNum="24">연락처</h4>
							<hr class="space xs" />
							<ul class="fa-ul">
								<li><i class="fa-li im-email"></i> hello@sesoc.global</li>
								<li><i class="fa-li im-phone"></i> 82-2-6000-6260</li>
								<li><i class="fa-li im-calendar"></i> 82-2-6000-6261</li>
							</ul>
						</div>
					
						
					<div class="col-md-4 mb-5 ftco-animate" style="padding-left: 2em; float: left;">
						<div class="block-10" style="width: 15em;">
							<div class="person-info mb-2">
								<p id="map"></p>
								<script>
									function initMap() {
										var myLatLng = {
											lat : 37.5115257,
											lng : 127.0589323
										};
	
										var map = new google.maps.Map(
											document.getElementById('map'),
											{
												zoom : 15,
												scrollwheel : false,
												center : myLatLng
											});
	
										var marker = new google.maps.Marker(
											{
												position : myLatLng,
												map : map
											});
										}
									</script>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>	
			</div>
		</div>
	</div>
	</section>

	<footer class="ftco-footer ftco-bg-dark ftco-section">
		<div class="container">
			<div class="row mb-5">
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Snipp.</h2>
						<p>Far far away, behind the word mountains, far from the
							countries Vokalia and Consonantia, there live the blind texts.</p>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4 ml-5">
						<h2 class="ftco-heading-2">Quick Links</h2>
						<ul class="list-unstyled">
							<li><a href="index2" class="py-2 d-block">Home</a></li>
							<li><a href="#" class="py-2 d-block">Case studies</a></li>
							<li><a href="services" class="py-2 d-block">Services</a></li>
							<li><a href="#" class="py-2 d-block">Portfolio</a></li>
							<li><a href="about" class="py-2 d-block">About</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Contact Information</h2>
						<ul class="list-unstyled">
							<li><a href="#" class="py-2 d-block">198 West 21th
									Street, Suite 721 New York NY 10016</a></li>
							<li><a href="#" class="py-2 d-block">+ 1235 2355 98</a></li>
							<li><a href="#" class="py-2 d-block">info@yoursite.com</a></li>
							<li><a href="#" class="py-2 d-block">email@email.com</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md">
					<div class="ftco-footer-widget mb-4">
						<ul
							class="ftco-footer-social list-unstyled float-md-left float-lft">
							<li class="ftco-animate"><a href="#"><span
									class="icon-twitter"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-facebook"></span></a></li>
							<li class="ftco-animate"><a href="#"><span
									class="icon-instagram"></span></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 text-center">

					<p>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						Copyright &copy;
						<script>
							document.write(new Date().getFullYear());
						</script>
						All rights reserved | This template is made with <i
							class="icon-heart" aria-hidden="true"></i> by <a
							href="https://colorlib.com" target="_blank">Colorlib</a>
						<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
					</p>
				</div>
			</div>
		</div>
	</footer>



	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="./resources/js/jquery-3.2.1.min.js"></script>
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
	<script src="./resources/js/scrollax.min.js"></script>
	<script async defer
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyABYid41RaVrQL5pT8XhbZcRo3ss-MYG2w&libraries=places&callback=initMap"></script>
	<!-- <script src="./resources/js/google-map.js"></script> -->
	<script src="./resources/js/main.js"></script>
	<script src="./resources/js/index.js"></script>
</body>
</html>
