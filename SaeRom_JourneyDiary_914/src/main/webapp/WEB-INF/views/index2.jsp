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
    #rows{
    	display: none;
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
    
	    function moreList() {
	    	load('#photos', '5', '#allphotos');
	    }
    
   function load(id, cnt, btn) {
    	var list = id + "#photos:not(.active)";
        var length = $(list).length;
        var total_cnt;
        if (cnt < length) {
            total_cnt = cnt;
        } else {
            total_cnt = length;
            $('#allphotos').hide()
        }
        $(list + ":lt(" + total_cnt + ")").addClass("active");
    } 
    
    </script>
  </head>
  <body>
    
  <nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar">
    <div class="container">
      <a class="navbar-brand" href="index.html">Journey Diary :D</a>
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
            <h1 class="mb-4" data-scrollax="properties: { translateY: '30%', opacity: 1.6 }">We love to create Beautiful<br><strong>Journey Diary</strong> </h1>
          </div>
        </div>
      </div>
    </div>
    
    <div class="bg-light">
    <section class="ftco-section-featured ftco-animate">
      <div class="container-fluid" data-scrollax-parent="true">
        <div class="row no-gutters d-flex align-items-center" data-scrollax=" properties: { translateY: '-30%'}" style="padding: 30px;">
	        <div class="col-md-3 mb-3">
	           <a href="photoDetails?photono=${bestPhoto1.photono}" class="featured-img">
	              <div class="text-1 p-4 d-flex align-items-center">
	                <h3>${bestPhoto1.landmark}<br><span class="tag">#${bestPhoto1.hashtag}</span></h3>
	              </div>
	              <img src="${Photosrc}${bestPhoto1.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%; height: 100%">
	              <div class="text p-4 d-flex align-items-center">
	                <div class="user d-flex align-items-center" >
	                  <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
	                  <h3>글쓴이 <br><span class="position">${bestPhoto1.photocontent}</span></h3>
	                </div>
	              </div>
	        	</a>
	        </div>
          
 			<div class="col-md-6">
            <div class="row no-gutters">
              <div class="col-md-12" style="padding-bottom: 10px;">
                <div class="row no-gutters d-flex align-items-end">
                  <div class="col-md-8">
                    <a href="photoDetails?photono=${bestPhoto2.photono}" class="featured-img">
                      <div class="text-1 p-4 d-flex align-items-center">
                        <h3>${bestPhoto2.landmark}<br><span class="tag">#${bestPhoto2.hashtag}</span></h3>
                      </div>
                      <img src="${Photosrc}${bestPhoto2.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%;height: 150%">
                      <div class="text p-4 d-flex align-items-center">
                        <div class="user d-flex align-items-center">
                          <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
                          <h3>글쓴이 <br><span class="position">${bestPhoto2.photocontent}</span></h3>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4">
                    <a href="photoDetails?photono=${bestPhoto3.photono}" class="featured-img">
                      <div class="text-1 p-4 d-flex align-items-center">
                         <h3>${bestPhoto3.landmark}<br><span class="tag">#${bestPhoto3.hashtag}</span></h3>
                      </div>
                      <img src="${Photosrc}${bestPhoto3.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%; height: 150%">
                      <div class="text p-4 d-flex align-items-center">
                        <div class="user d-flex align-items-center">
                          <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
                          <h3>글쓴이 <br><span class="position">${bestPhoto3.photocontent}</span></h3>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
              
              <div class="col-md-12" style="padding-top: 10px;">
                <div class="row no-gutters d-flex align-items-start">
                  <div class="col-md-8">
                    <a href="photoDetails?photono=${bestPhoto4.photono}" class="featured-img">
                      <div class="text-1 p-4 d-flex align-items-center">
                        <h3>${bestPhoto4.landmark}<br><span class="tag">#${bestPhoto4.hashtag}</span></h3>
                      </div>
                      <img src="${Photosrc}${bestPhoto4.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%;height: 150%">
                      <div class="text p-4 d-flex align-items-center">
                        <div class="user d-flex align-items-center">
                          <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
                          <h3>글쓴이 <br><span class="position">${bestPhoto4.photocontent}</span></h3>
                        </div>
                      </div>
                    </a>
                  </div>
                  <div class="col-md-4">
                    <a href="photoDetails?photono=${bestPhoto5.photono}" class="featured-img">
                      <div class="text-1 p-4 d-flex align-items-center">
                        <h3>${bestPhoto5.landmark}<br><span class="tag">#${bestPhoto5.hashtag}</span></h3>
                      </div>
                      <img src="${Photosrc}${bestPhoto5.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%; height: 150%">
                      <div class="text p-4 d-flex align-items-center">
                        <div class="user d-flex align-items-center">
                          <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
                          <h3>글쓴이 <br><span class="position">${bestPhoto5.photocontent}</span></h3>
                        </div>
                      </div>
                    </a>
                  </div>
                </div>
              </div>
            </div>
          </div> 
          
          <div class="col-md-3">
            <a href="photoDetails?photono=${bestPhoto6.photono}" class="featured-img">
              <div class="text-1 p-4 d-flex align-items-center">
                <h3>${bestPhoto6.landmark}<br><span class="tag">#${bestPhoto6.hashtag}</span></h3>
              </div>
              <img src="${Photosrc}${bestPhoto6.photoimg}" class="img-fluid" alt="Best Top 5 Photos" style="object-fit: fill; width: 100%; height: 250%;">
              <div class="text p-4 d-flex align-items-center">
                <div class="user d-flex align-items-center">
                  <div class="user-img mr-3" style="background-image: url(./resources/img/images/person_1.jpg);"></div>
                   <h3>글쓴이 <br><span class="position">${bestPhoto6.photocontent}</span></h3>
                </div>
              </div>
            </a>
          </div>
        </div>
        <br><br><br>
        <div class="row mt-5 d-flex justify-content-center">
          <div class="col-md-8 text-center heading-section ftco-animate">
            <h2 class="h1">보아라!!!, 이 <strong class="px-3">Awesome</strong>한  Journey Diary를!!! 어때? 너도 하고싶지?? 그렇다면 너도 <strong class="px-3">Get Start</strong> 버튼을 어서 누르렴</h2>
            <br>
            <p><a class="btn btn-primary mt-3 py-3 px-5" onclick="logins()">Get Start !!</a></p>
          </div>
        </div>
      </div>
    </section>
    </div>
    
  
    <section class="ftco-section">
      <div class="container">
        <div class="row justify-content-center mb-5 pb-5">
          <div class="col-md-6 text-center heading-section ftco-animate">
            <span class="subheading">Our Services</span>
            <h2 class="mb-4">Web &amp; Mobile app design, bring your ideas to life</h2>
            <p>Far far away, behind the word mountains, far from the countries Vokalia and Consonantia, there live the blind texts. Separated they live in</p>
          </div>
        </div>
        <div class="row">
          <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon color-3 d-flex justify-content-center mb-3"><span class="align-self-center icon-lightbulb-o"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Strategy</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon color-1 d-flex justify-content-center mb-3"><span class="align-self-center icon-laptop"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Design</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>      
          </div>
          <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon color-2 d-flex justify-content-center mb-3"><span class="align-self-center icon-gear"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Development</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>    
          </div>

          <div class="col-md-6 col-lg-3 d-flex align-self-stretch ftco-animate">
            <div class="media block-6 services d-block text-center">
              <div class="d-flex justify-content-center"><div class="icon color-4 d-flex justify-content-center mb-3"><span class="align-self-center icon-live_help"></span></div></div>
              <div class="media-body p-2 mt-3">
                <h3 class="heading">Help &amp; Supports</h3>
                <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic.</p>
              </div>
            </div>      
          </div>
        </div>
      </div>
    </section>

    <section class="ftco-section-parallax">
      <div class="parallax-img d-flex align-items-center">
        <div class="container">
          <div class="row d-flex justify-content-center">
            <div class="col-md-7 text-center heading-section heading-section-white ftco-animate">
              <h2>Search Diary</h2>
              <p>키워드를 검색하여, 다양한 유저의 여행일기를 검색할 수 있습니다. 함께 멋진 나라를 구경해 봅시다~!</p>
              <div class="row d-flex justify-content-center mt-5">
                <div class="col-md-6">
                  <form action="#" class="subscribe-form">
                    <div class="form-group">
                      <span class="icon icon-paper-plane"></span>
                      <input type="text" class="form-control" placeholder="Enter Keyword Or Landmark">
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
    
<!-- 추천글 목록 -->
    <section class="ftco-section">
      <div class="container">
        <div class="row no-gutters justify-content-center mb-5 pb-5">
          <div class="col-md-7 text-center heading-section ftco-animate">
            <span class="subheading">Recommendation</span>
            <h2 class="mb-4">Recommended Photos <br>of the Month</h2>
            <p>Show recommended photos for this month.
				Let's enjoy the nice photos together.</p>
          </div>
        </div>
        <div class="row">
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <a href="portfolio.html" class="image" style="background-image: url('./resources/img/images/work-1.jpg'); " data-scrollax=" properties: { translateY: '-20%'}">
            </a>
            <div class="text">
              <h4 class="subheading">Illustration</h4>
              <h2 class="heading"><a href="portfolio.html">Even the all-powerful Pointing has no control</a></h2>
              <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
              <p><a href="portfolio.html" class="btn btn-primary px-4">View Portfolio</a></p>
            </div>
          </div>
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <a href="portfolio.html" class="image image-2 order-2" style="background-image: url('./resources/img/images/work-2.jpg');" data-scrollax=" properties: { translateY: '-20%'}"></a>
            <div class="text order-1">
              <h4 class="subheading">Application</h4>
              <h2 class="heading"><a href="portfolio.html">Even the all-powerful Pointing has no control</a></h2>
              <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
              <p><a href="portfolio.html" class="btn btn-primary px-4">View Portfolio</a></p>
            </div>
          </div>
          <div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
            <a href="portfolio.html" class="image" style="background-image: url('./resources/img/images/work-3.jpg'); " data-scrollax=" properties: { translateY: '-20%'}"></a>
            <div class="text">
              <h4 class="subheading">Web Design</h4>
              <h2 class="heading"><a href="portfolio.html">Even the all-powerful Pointing has no control</a></h2>
              <p>Even the all-powerful Pointing has no control about the blind texts it is an almost unorthographic life One day however a small line of blind text by the name of Lorem Ipsum decided to leave for the far World of Grammar.</p>
              <p><a href="portfolio.html" class="btn btn-primary px-4">View Portfolio</a></p>
            </div>
          </div>
        </div>
        <div class="row">
          <div class="col-md-12 text-center">
            <span><a href="javascript:moreList()" class="btn btn-primary py-3 px-5" id="allphotos">View All Photos</a></span>
          </div>
          
           <div class="sidebar-box ftco-animate" id="rows">
              <h3>Recent Blog</h3>
              <c:forEach var="Photo" items="${photoList}" varStatus="status">
              <div class="block-21 mb-4 d-flex" id="photos">
                <img class="blog-img mr-4" src="${Photosrc}/${Photo.photoimg}"></img>
                <div class="text">
                  <h3 class="heading"><a href="photoDetails?photono=${Photo.photono}">${Photo.photocontent}</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="icon-calendar"></span> July 12, 2018</a></div>
                    <div><a href="#"><span class="icon-person"></span> Admin</a></div>
                    <div><a href="#"><span class="icon-chat"></span> 19</a></div>
                  </div>
                </div>
              </div>
              </c:forEach>
            </div>
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
                <li><a href="javascript:logins()" class="py-2 d-block">My Journey Diary</a></li>
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
