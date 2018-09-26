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
    <script>
    $("input:radio[name='privacy']").attr('disabled', true);
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
                <a class="dropdown-item" href="showAlbum">My Journey Diary</a>
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
            <p class="breadcrumbs" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }"><span class="mr-2"><a href="index2">Home</a></span> <span>My Journey Diary</span></p>
            <h1 class="mb-3 bread" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">Album List</h1>
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
   
   <section class="ftco-section">
      <div class="container">
        <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">Album</span>
            <h2 class="mb-4">View My Album</h2>
            <p>나의 이퓨리 이퓨리한 앨범 목록을 보아라! 찬양하여라!!!!</p>
            <p><a href="createAlbum" class="btn btn-primary px-4">Create Album</a></p>
          </div>
        </div>
        <div class="row">
          <c:forEach var="Album" items="${albumList}" varStatus="status">
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
          <c:if test="${status.index%2 == 0}">
          	<a href="#" class="image" style="background-image: url('${albumsrc}${Album.albumimg}');" data-scrollax=" properties: { translateY: '-20%'}"> 
            </a>
            <div class="text">
              <h2 class="heading">${Album.albumtitle}</h2>
              <h3 class="subheading">
				<c:if test="${Album.privacy == 'public'}">
				<span>
					<input class="privacy" type="radio" value="public" checked="checked">공개 
					<input class="privacy" type="radio" value="private">비공개&ensp;
				</span>
			    </c:if>
			    <c:if test="${Album.privacy == 'private'}">
				<span>
					<input class="privacy" type="radio" value="public">공개 
					<input class="privacy" type="radio" value="private" checked="checked">비공개&ensp;
				</span>
			    </c:if>
			  </h3>
			  <p style="padding-top: 2em; font-size: 20px;">${Album.albumintro}</p>
              <p style="color: white;">Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
              <p><a href="photoList?albumno=${Album.albumno}" class="btn btn-primary px-4">View Photos</a></p>
            </div>
          </c:if>
          <c:if test="${status.index%2 != 0}">
          	<a href="#" class="image image-2 order-2" style="background-image: url('${albumsrc}${Album.albumimg}');" data-scrollax=" properties: { translateY: '-20%'}"></a>
          	<div class="text">
              <h2 class="heading">${Album.albumtitle}</h2>
              <h3 class="subheading">
              	<c:if test="${Album.privacy eq 'public'}">
				<span>
					<input class="privacy" type="radio" value="public" checked="checked">공개 
					<input class="privacy" type="radio" value="private">비공개&ensp;
				</span>
			    </c:if>
			    <c:if test="${Album.privacy eq 'private'}">
				<span>
					<input class="privacy" type="radio" value="public">공개 
					<input class="privacy" type="radio" value="private" checked="checked">비공개&ensp;
				</span>
			    </c:if>
              </h3>
              <p style="padding-top: 2em; font-size: 20px;">${Album.albumintro}</p>
              <p style="color: white;">${Album.albumintro}
              Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.
              </p>
              <p><a href="photoList?albumno=${Album.albumno}" class="btn btn-primary px-4">View Photos</a></p>
            </div>
          </c:if>
          </div>
          </c:forEach>
        </div>
      </div>
    </section>
   

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
  <script src="./resources/js/scrollax.min.js"></script>
  <script src="./resources/js/main.js"></script>
  </body>
</html>
