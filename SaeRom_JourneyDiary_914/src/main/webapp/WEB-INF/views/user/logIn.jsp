<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html lang="ko">

  <head>
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
  		span#emailCheck {
  			color : red;
  		};
  	</style>
    
        <script>
    	$(function(){
    		
    		$('#useremail').on('focusout', function(){
    			
    			var useremailL = $('#useremail').val().length;
    			if(useremailL == 0){
    				 $("#emailCheck").text("이메일을 입력해주세요.");
    				 return;
    			}
    			
    			//email주소 유효성 검사 
    			var regex=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
    			var useremail = $("#useremail").val();
    			var result = (useremail != '' && useremail != 'undefined' && regex.test(useremail))
    			console.log("useremail유효성 검사 : " + result);
    			if(!result){
    				 $("#emailCheck").text("이메일을 다시 입력해주세요.");
    				 $("#emailCheck").val("").focus();
    				 return;
    			}
    			
 
    			$.ajax({
    				url  : "checkEmail"
    	    	  , type : "POST"
    	   		  , data : {"useremail" : $("#useremail").val()}
     			  , success : function(data){
    	    				  console.log(data);
    	    				  if(data == 1){
    	    				  	  $("#emailCheck").text("올바른 메일 주소입니다. 비밀번호를 입력해주세요.");
    	    	
    	    				  } else {
    	    					  $("#emailCheck").text("이메일 정보가 없습니다.");
    	    			
    	    				  }
    	    			   }
    			});
    		});
			
    		var userpasswordL = $('#userpassword').val().length;
			if(userpasswordL < 8){
				 $("#emailCheck").text("이메일을 입력해주세요.");
				 return;
			}	
    	});
    	
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
           <div class="container">
		    <div class="row" style="margin-top: 9em;">
		    	<div class="block-3 d-md-flex ftco-animate" data-scrollax-parent="true">
		        <div class="card card-signin my-5" style="width: 400px; margin-left: 25em;">
		          <div class="card-body">
					<h1 style="text-align: center; font-size: 70px; margin-top: 5%; margin-bottom: 5%;">
						<b style="font-weight: 900;"><font style="color: #3ac6ff;"><a href="#" >Sign In</a></font></b></h1>
		            <span id="emailCheck"></span>
		            <form class="form-signin" action="logIn" method="post">
		              <div class="form-label-group">
		                <input type="email" id="useremail" name="useremail" class="form-control" placeholder="Email address" required autofocus>
		              </div>
		              <div class="form-label-group">
		                <input type="password" id="userpassword" name="userpassword"  class="form-control" placeholder="Password" required>   
		              </div>
		              <br>
		              <button class="btn btn-lg btn-primary btn-block text-uppercase" id="loginBtn" type="submit" style="width: 50%">Sign in</button>
		              <p class="btn btn-lg btn-primary btn-block text-uppercase"><a href="register">Sign up</a></p>
		            </form>
		          </div>
		        </div>
		       </div>
		    </div>
		  </div>
        </div>
      </div>
 </div> 
  
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
