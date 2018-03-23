<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lagori</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>

<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


<script>
	function start() {
		$('#totalhitmissgolden').carousel({
			interval : 4000,
			pause : "false"
		});

		$('#totalteamplayerofficial').carousel({
			interval : 7000,
			pause : "false"
		});
		$('#totalmatchscorewicket').carousel({
			interval : 6000,
			pause : "false"
		});
		$('#highestscore').carousel({
			interval : 7000,
			pause : "false"
		});
		$('#bestplayer').carousel({
			interval : 8000,
			pause : "false"
		});
		$('#highestscoremale').carousel({
			interval : 5000,
			pause : "false"
		});

		$('#bestplayermale').carousel({
			interval : 8000,
			pause : "false"
		});
		$('#boysteamwinner').carousel({
			interval : 10000,
			pause : "false"
		});

		$('#maletotalmatchwicket').carousel({
			interval : 5000,
			pause : "false"
		});

	}
</script>
</head>
<body onload="showslides();">
	<%
		try {
			DBManager.loadDriver();
			ResultSet rs=null;
	%>
	<div class="container-fluid">


		<nav class="navbar navbar-inverse" style="background-color: #2045a5;">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-target="#myHeader">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myHeader">
					<ul class="nav navbar-nav">
						<li class="nav-item dropdown active"><a
							class="nav-link dropdown-toggle" data-toggle="dropdown" href=""
							role="button" aria-haspopup="true" aria-expanded="false"
							style="margin-left: -80px; padding: 16px;">HOME<span
								class="sr-only">(current)</span></a></li>

						<li class="dropdown"><a class="dropdown-toggle"
							data-toggle="dropdown" role="button"
							style="margin-left: 10px; color: white;">TOURNAMENT <span
								class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="addTournament.jsp">Add Tournament</a></li>
								<li><a href="AddMember.jsp">Add Members</a></li>
								<li><a href="addTeam.jsp">Add Teams</a></li>
								<li><a href="tournament.jsp">Select Tournament</a></li>
							</ul></li>
						<!-- 	<li><a href="addTeam.jsp"><font color="white">TEAMS</font></a></li> -->
						<li><a href="#"><font color="white">UPDATE</font></a></li>
						<li><a href="#"><font color="white">SELECT MATCH</font></a></li>
						<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
						<li><a href="#"><font color="white">STATISTICS</font></a></li>
						<li style="font-weight: 300; margin-left: 230px; font-size: 15pt"><a
							style="text-decoration: none; color: antiquewhite; cursor: pointer">Sign
								In</a></li>
					</ul>

				</div>

			</div>

		</nav>
	</div>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-8 col-xs-12">
				<div class="row">
					<div class="col-md-6">
						<select id="tourId" class="form-control" onchange="showslides();">
							<%
						rs = null;
							rs = DBManager.fetchQuery("select tourId,tourName from tournament");
							while (rs.next()) {
					%>
							<option value="<%=rs.getInt("tourId")%>"><%=rs.getString("tourName")%></option>
							<%
						}
					%>
						</select>
					</div>
				</div>
				<br>
				<div id="innumber"></div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-3 col-xs-12">
				<h3>
					<span style="font-size: 24px; font-weight: 700; color: #16224d;">LATEST
						RESULT</span>
				</h3>

			</div>
			<div id="innumber1"></div>
		</div>
	</div>

	<div id="schedule"></div>
	<%
		} catch (Exception e) {
			System.out.println("Exception in home.jsp" + e);
		}
	%>
</body>
<script type="text/javascript">
	function showslides() {
		var xmlhttp = false;
		var tourId = document.getElementById("tourId").value;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}

		if (xmlhttp) {
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("innumber").innerHTML = xmlhttp.responseText;
					showschedule(tourId);
					showslides1(tourId);
					start();
				}
			};
		}

		xmlhttp.open("GET", "home1.jsp?tourId=" + tourId, true);
		xmlhttp.send(null);
	}
	function showslides1(tourId) {
		var xmlhttp = false;
		
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}

		if (xmlhttp) {
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("innumber1").innerHTML = xmlhttp.responseText;
				}
			};
		}

		xmlhttp.open("GET", "home2.jsp?tourId=" + tourId, true);
		xmlhttp.send(null);
	}
	function showschedule(tourId) {
		var xmlhttp = false;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}

		if (xmlhttp) {
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("schedule").innerHTML = xmlhttp.responseText;
				}
			};
		}

		xmlhttp.open("GET", "matchschedule.jsp?tourId=" + tourId, true);
		xmlhttp.send(null);
	}
</script>
</html>