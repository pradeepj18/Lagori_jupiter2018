<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Tournament</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
<style>
.btn-group>.btn:first-child {
	margin-left: -100px;
}

body {
	background: url("images/bg-footer.jpg");
	background-color: #333;
	background-position: center -100px;
	background-repeat: x-repeat;
	background-size: cover;
	width: 100%;
	height: 200px;
	overflow-y:scroll;yy
}

.bar-time {
	color: white;
	font-size: 17pt;
	margin-top: 1.6%;
	float: left;
}

.stm-list-duty {
	padding: 3px;
	float: right;
	list-style: none;
	font-size: 16pt;
	margin-top: 9px;
}

img#mahaLagori {
	-webkit-filter: brightness(100%); /* Chrome, Safari, Opera */
	filter: brightness(100%);
	background-color: #cccccc;
	z-index: -2;
}

.navbar-default {
	background-color: #f8f8f8;
	border-color: #030825;
}

#logo {
	float: left;
	margin-left: -5%;
	width: 76%;
}

#topbar {
	color: white;
}

.com-red {
	color: #e21e22 !important;
	font-weight: 700;
	font-size: 15px;
	line-height: 20px;
	word-spacing: 1.3px;
}
.open > .dropdown-menu {
    display: block;
    margin-left: 0px;
}
.btn-group > .btn:first-child {
    margin-left: 0px;
}
</style>
</head>
<body onload="startTime();">
	<div class="container-fluid">
		<!-- <div class="row" id="topbar">
			<div class="col-xs-2 col-md-2" style="background-color:white;">
				<span><img alt="company logo" src="images/PlaysoftechLogo.png" width="200"></span>
			</div>
			<div class="col-xs-6 col-md-6">
				<span class="bar-time"> 
				<span id="txt"></span>
				</span>
			</div>
			<div class="col-md-4">
				<div class="socials-holder">
					<ul class="top-bar-socials stm-list-duty">
						<li><a href="https://www.facebook.com/" target="_blank"
							style="color: #ffffff !important;"> <i class="fa fa-facebook"></i>
						</a></li>
						<li><a href="https://twitter.com/" target="_blank"
							style="color: #ffffff !important;"> <i class="fa fa-twitter"></i>
						</a></li>
						<li><a href="https://www.instagram.com/" target="_blank"
							style="color: #ffffff !important;"> <i
								class="fa fa-instagram"></i>
						</a></li>
						<li><a href="https://www.linkedin.com/" target="_blank"
							style="color: #ffffff !important;"> <i class="fa fa-linkedin"></i>
						</a></li>
					</ul>
				</div>
			</div>
			
		</div> -->
		<div class="row">
			<nav class="navbar navbar-inverse" style="background-color:#2045a5;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#myHeader"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<div class="collapse navbar-collapse" id="myHeader">
					<ul class="nav navbar-nav">
						<li style="margin-left: -120px"><a href="home.jsp"><font
								color="white">HOME</font></a></li>
						<li class="nav-item dropdown active"><a
							class="nav-link dropdown-toggle" data-toggle="dropdown" href=""
							role="button" aria-haspopup="true" aria-expanded="false"
							style="padding: 16px;">SELECT TOURNAMENT<span class="sr-only">(current)</span></a>
						</li>

						<!-- <li><a href="addTeam.jsp"><font color="white">ADD TEAMS</font></a></li> -->
						<li><a href="#"><font color="white">UPDATE</font></a></li>
						<li><a href="#"><font color="white">SELECT MATCH</font></a></li>
						<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
						<li><a href="#"><font color="white">STATISTICS</font></a></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>
	</div>
	<div class="container">
		<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4" style="margin-left: -100px;">
		
			<select id="tyear" class="selectpicker" onchange="showtour();">
				<option value="SelectYear">Select Tournament Year</option>
				<%
					try {
						ResultSet rs = null;
						DBManager.loadDriver();
						rs = DBManager.fetchQuery(
								"select distinct ucase(DATE_FORMAT(tourSDate,'%Y')) as date1 from tournament group by date1; ");
						while (rs.next()) 
						{
				%>
				<option value="<%=rs.getInt("date1")%>"><%=rs.getInt("date1")%></option>
				<%
					}
					} catch (Exception e) {
					}
				%>
			</select>
			</div>
<div class="col-md-4"></div>
</div><br>
		<div class="row" id="st">
		</div>
	

	</div>
</body>
<script type="text/javascript">
	function showtour() {

		var xmlhttp = false;
		var tyear = document.getElementById("tyear").value;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}

		if (xmlhttp) {
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("st").innerHTML = xmlhttp.responseText;
					showschedule(tourId);
					start();
				}
			};
		}

		xmlhttp.open("GET", "showtour.jsp?tyear=" + tyear, true);
		xmlhttp.send(null);
	}
</script>
</html>