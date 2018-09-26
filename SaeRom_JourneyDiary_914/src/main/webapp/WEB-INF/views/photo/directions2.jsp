<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Travel Modes in Directions</title>
<style>
#map {
  height: 85%;
  width: 80%;
}

html,
body {
  height: 100%;
  margin: 0;
  padding: 0;
}

#panel {
	position: absolute;
	top: 5px;
	left: 50%;
	margin-left: -180px;
	z-index: 5;
	/*background-color: #fff;*/
	padding: 5px;
	border: 1px solid #999;
}

.adp{margin-bottom:120px !important;}

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

#directions-panel {
	background:rgba(255, 255, 255, 0.8);
	position:absolute;
	right:0;
	top:0;
	z-index:99;
	padding:80px 15px 40px 15px;
	height: 100%;
	float: right;
	width: 30%;
	overflow: auto;
}

@media print {
	#map {
		height: 500px;
		margin: 0;
	}

	#directions-panel {
		float: none;
		width: auto;
	}
}
</style>

</head>

<body>
	<h1>photoDetails view</h1>
</body>
</html>

