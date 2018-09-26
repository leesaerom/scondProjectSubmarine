<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>

<head>


</head>

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

<h1>앨범 작성 성공</h1>

</body>

</html>
