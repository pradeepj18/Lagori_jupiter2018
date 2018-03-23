<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournament</title>
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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<script type="text/javascript">
 $(document).ready(function($) { 	
 $("#myCarousel").carousel({
	 interval : false
 });

 $('#myCarousel1').carousel({
	interval:3000,
	pause:"false"
 });
});

function goToSlide(number) {
	   $("#myCarousel").carousel(number);
	}

</script>

<style>
body {
	background: url("images/bg-footer.jpg");
	background-position: center -50px;
	background-repeat: no-repeat;
	background-size: 100% 18%;
	position: relative;
	width: 100%;
	height: 50%;
	max-width: 100%;
	overflow-x: hidden;
	clear: both;
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
	margin-left: -4.2%;
	width: 76%;
}

.com-red {
	color: #e21e22 !important;
	font-weight: 700;
	font-size: 15px;
	line-height: 20px;
	word-spacing: 1.3px;
}

#topbar {
	color: white;
}

#container-tour-image {
	background-image: url("images/grnd.jpg");
	background-color: #333;
	background-position: center -10px;
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	float: left;
	margin-left: -3%;
	height: 380%;
	clear: both;
	margin-top: -20px;
}

.tour-image-text {
	color: white;
	float: right;
	margin-top: 1%;
	margin-right: 30%;
}

.design {
	background-image: url("images/mahaLagori.png");
	background-color: #333;
	background-position: center 0px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	width: auto;
	height: 280%;
}

#tour-tabs {
	float: left;
	margin-left: 4%;
	margin-top: -2.8%;
}

#presentation {
	background-color: #030825;
	color: white;
	display: block;
	font-size: 12px;
	padding: 10px 30px;
	text-transform: uppercase;
	font-family: 'Open Sans', sans-serif;
}

#presentation1 {
	background-color: #fff;
	color: #030825;
	font-weight: bold;
	display: block;
	font-size: 12px;
	padding: 10px 30px;
	text-transform: uppercase;
	font-family: 'Open Sans', sans-serif;
}

.venue {
	float: left;
	margin-left: 75%;
	margin-top: -15%;
}

.tour-date {
	float: left;
	margin-left: 75%;
	margin-top: -9%;
}

.teamhead {
	font-family: 'Open Sans', sans-serif;
	background: #0E1957;
	/* background-color:#e21e22; */
	color: #ffffff;
	border-left: 1px solid #e4e4e2;
	border-right: 1px solid #e4e4e2;
	border-top: 1px solid #e4e4e2;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	display: block;
	font-size: 16px;
	font-weight: bold;
	padding: 8px 0;
	text-align: center;
	margin-left: 13%;
}

.teamdropdown {
	height: 627px;
	width: 87%;
	margin-left: 13%;
	overflow: hidden;
	overflow-y: scroll;
	border-radius: 5px;
	box-shadow: 6px 2px 5px #888888;
}

.teamdropdown::-webkit-scrollbar {
	width: 4px;
}

.teamdropdown::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.teamdropdown::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px #333;
}

.fixture-head {
	line-height: 38px;
	font-size: 24px;
	color: #030825;
	font-weight: 700;
}

.teamscore1 {
	background-color: rgb(255, 255, 255);
	height: 116px;
	width: 24%;
}

.teamscore2 {
	background-color: rgb(255, 255, 255);
	height: 116px;
	margin-left: 2%;
	width: 24%;
}

.photo-head {
	float: left;
	margin-left: 4.5%;
}

.league-head {
	margin-top: 6%;
	margin-left: -5.3%;
}

/*CAROSAL*/
.carousel {
	background: #001e35;
	margin-top: 20px;
	box-shadow: 5px 1px 5px #888888;
}

.carousel .item img {
	margin: 0 auto; /* Align slide image horizontally center */
}

.bs-example {
	margin: 20px;
}

.carousel-indicators li {
	visibility: hidden;
}
/*END*/
a {
	font-weight: 700;
	color: #333;
	text-decoration: none;
}

a:hover {
	font-weight: 700;
	color: #000;
	text-decoration: none;
}

/*TABLE CSS*/
.table-fixed thead {
	width: 97%;
	margin-left: 2%;
	color: #ffffff;
}

.table-fixed tbody {
	height: 185px;
	overflow-y: auto;
	width: 97%;
	margin-left: 2%;
}

.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td,
	.table-fixed th {
	display: block;
}

.table-fixed tbody td, .table-fixed thead>tr>th {
	float: left;
	border-bottom-width: 0;
}

.table-hover tbody tr:hover td, .table-hover thead tr:hover th {
	background-color: #0E1957;
	color: #eeeeee;
}
/*END*/

/*MOBILE*/
@media ( max-width :767px) {
	.image-example {
		float: left;
		margin-left: 4.5%;
		/* width:800px; */
	}
}

/*LAPTOP*/
@media ( min-width :768px) {
	.image-example {
		float: left;
		margin-left: 4.5%;
		width: 800px;
	}
}
</style>
</head>
<body onload="startTime();">
	<%
		try {
			DBManager.loadDriver();
			ResultSet rs = null;
			if (request.getParameter("tourId") != null) {
				//out.println("++++"+request.getParameter("tourId"));
	%>
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
			<nav class="navbar navbar-inverse"
				style="background-color:#2045a5;opacity:0.9;">
			<div class="container-fluid">
				<div class="navbar-header">
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<ul class="nav navbar-nav">
					<li style="margin-left: -120px"><a href="home.jsp"><font
							color="white">HOME</font></a></li>
					<li class="active"><a href="tournament.jsp" style="padding: 16px;">TOURNAMENT</a></li>
					<li><a
						href="updateHMR.jsp?tourId=<%=request.getParameter("tourId")%>"><font
							color="white">UPDATE</font></a></li>
					<li><a href="selectMatch.jsp"><font color="white">SELECT
								MATCH</font></a></li>
					<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
					<li><a href="#"><font color="white">STATISTICS</font></a></li>

					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#"><font color="white">PRINT<span
								class="caret"></span></font></a>
						<ul class="dropdown-menu" style="z-index:20px;">
							<li><a href="MatchSchedule_Type1.jsp">MATCH SCHEDULE</a></li>
							<li><a href="PrintPool.jsp">POOL</a></li>
							<li><a href="print_teams_player.jsp">TEAM PLAYER</a></li>
							<li><a href="lagoriScoreSheet.jsp">SCORE SHEET</a></li>
						</ul>
					</li>
					
				</ul>
			</div>
			</nav>
		</div>
		<%-- <div class="row">
		<nav class="navbar navbar-inverse" style="background-color:#2045a5;opacity:0.9;" >
			<div class="container-fluid" >
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myHeader" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<div  >
				<ul class="nav navbar-nav">
					<li style="margin-left:-120px"><a href="home.jsp"><font color="white">HOME</font></a></li>
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false" style="padding: 16px;">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
				<!-- 	<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li><a href="updateHMR.jsp?tourId=<%=request.getParameter("tourId") %>"><font color="white">UPDATE</font></a></li>
					<li><a href="selectMatch.jsp"><font color="white">SELECT MATCH</font></a></li>
					<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
					<li><a href="#"><font color="white">STATISTICS</font></a></li>
					<li class="dropdown">
        <a class="dropdown-toggle" data-toggle="dropdown" role="button"  style="margin-left:10px;color:white;">PRINT
        <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li ><a href="MatchSchedule_Type1.jsp">MATCH SCHEDULE</a></li>
          <li><a href="PrintPool.jsp">POOL</a></li>
          <li><a href="print_teams_player.jsp">TEAM PLAYER</a></li>
            <li><a href="lagoriScoreSheet.jsp">SCORE SHEET</a></li>
        </ul>
      </li>
				</ul>
				</div>
			</div>
		</nav>
	</div> --%>
		<div class="container-fluid">
			<div class="row" id="container-tour-image">
				<div class="col-md-12 col-sm-12 col-lg-12">
					<div class="design">
						<div class="tour-image-text">
							<img src="images/2(1).png" width="1111" height="320"
								style="float: right; margin-top: -1.2%; margin-right: -41.6%; overflow-x: hidden; background-size: cover;">
							<img src="images/mahaLagori.png" width="200" height="200"
								style="float: right; margin-right: -99%;"> <img
								src="images/calli(1).png" width="140" height="140"
								style="float: right; margin-right: -55%; margin-top: 1%;">
							<dl class="dl-horizontal venue">
								<dt>VENUE:</dt>
								<dd>Shiv Chatrapati Sports Complex,Akluj,Solapur</dd>
							</dl>
							<dl class="dl-horizontal tour-date">
								<dt>DATE:</dt>
								<dd>20th Oct to 21th Oct 2016</dd>
							</dl>

						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<ul class="nav nav-tabs" id="tour-tabs">
				<li class="active"><a
					href="tournamentnext.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation1">OVERVIEW</a></li>
				<li class="active"><a
					href="addtour.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">ADD</a></li>
				<li class="active"><a
					href="selectMatch.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">SELECT MATCH</a></li>
				<li class="active"><a
					href="updateplayer.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">EDIT PLAYER</a></li>
				<li class="active"><a
					href="viewList.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">VIEW</a></li>

			</ul>
		</div>
		<!-- <center><img src="images/wcplogo.png" width="800" height="350"></center> -->
		<br>
		<br>
		<div class="row">
			<div class="col-md-3">
				<div class="teamhead">
					<b>Team List</b>
				</div>
				<div class="list-group col-md-12 teamdropdown">
					<%
						rs = null;
								rs = DBManager.fetchQuery(
										"select distinct(tId),(select tName from team where tId = tt.tId) as tname,(select SUBSTRING_INDEX(tFlag,'/',-2) from team where tId = tt.tId ) as flag from tourTeam tt where tourId="
												+ request.getParameter("tourId") + " order by tname asc;");
								while (rs.next()) {
					%>
					<a
						href="playerlist.jsp?tourId=<%=request.getParameter("tourId")%>&tId=<%=rs.getInt("tId")%>">
						<div class="list-group-item">
							&nbsp; <img src=<%=rs.getString("flag")%> width=50 height=50
								style="border-radius: 50%;"> &nbsp;&nbsp;&nbsp;
							<%
								if (rs.getString("tname").length() <= 12) {
							%>
							<span><%=rs.getString("tname")%></span>
							<%
								} else {
							%>
							<span
								style="white-space: nowrap; float: left; margin-left: 77px; margin-top: -34px;"><%=rs.getString("tname")%></span>
							<%
								}
							%>
						</div>
					</a>
					<%
						}
					%>

				</div>

			</div>
			<div class="col-md-9">
				<center>
					<span class="fixture-head">PLAYED MATCHE'S SUMMARY</span>
				</center>
				<div class="bs-example">
					<%
						int i = 0;
								rs = null;
								ResultSet rs1 = null;
								rs = DBManager.fetchQuery(
										"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as tname2,gender,mtype,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from print_match pm where tourId="
												+ request.getParameter("tourId") + " order by srno desc;");
								rs.last();
								int count[] = new int[rs.getRow()];
								int tid1[] = new int[rs.getRow()];
								int tid2[] = new int[rs.getRow()];
								String gender[] = new String[rs.getRow()];
								rs.beforeFirst();
								while (rs.next()) {
									count[i] = rs.getInt("mid");
									gender[i] = rs.getString("gender");
									tid1[i] = rs.getInt("tid1");
									tid2[i] = rs.getInt("tid2");
									i = i + 1;
								}
								rs.beforeFirst();
					%>

					<div id="myCarousel" class="carousel slide" data-ride="carousel">
						<!-- Carousel indicators -->
						<ol class="carousel-indicators">
							<%
								for (i = 0; i < count.length && count.length < 1; i++) {
							%>
							<li data-target="#myCarousel" data-slide-to="<%=i%>"
								class="active"></li>
							<%
								}
							%>
							<%
								for (int j = i; j < count.length; j++) {
							%>
							<li data-target="#myCarousel" data-slide-to="<%=j%>"></li>
							<%
								}
							%>

						</ol>
						<!-- Wrapper for carousel items -->
						<div class="carousel-inner">
							<%
								if (count.length == 0) {
							%>
							<div class="item active">
								<span
									style="background-color: rgb(255, 255, 255); height: 123px; width: 28%; font-size: 48px; float: left; margin-left: 36%; margin-top: 1%;">NO
									MATCH &nbsp;&nbsp;&nbsp;PLAYED</span>

							</div>
							<%
								}
							
								for (i = 0; i < count.length && i < 1; i++) {
							%>
							<div class="item active">
								<%
									if (gender[i].equals("M")) {
								%>
								<center>
									<span style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
										MATCH <%=count[i]%></span>
								</center>
								<%
									rs1 = null;
													rs1 = DBManager
															.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[i]
																	+ " and ttId=" + tid1[i] + " and tourId = " + request.getParameter("tourId")
																	+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[i]
																	+ " and ttId=" + tid2[i] + " and tourId = " + request.getParameter("tourId")
																	+ " group by ttId) as score2  from wmatch w where mid=" + count[i]
																	+ " and gender ='" + gender[i] + "';");
													if (rs1.next()) {
								%>
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3 teamscore1">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-3 teamscore2">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>
									<div class="col-md-3"></div>
								</div>


								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
													rs1 = DBManager.fetchQuery(
															"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid1[i] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid2[i] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname2 from tourTeam tt;");
													if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3"></div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname1")%></span>
										</center>
									</div>
									<div class="col-md-1"
										style="background-color: #fff; float: left; margin-left: -27px; height: 30px;">
										<span
											style="color: red; font-weight: 700; font-size: 24px; float: left; margin-top: -3px;">VS</span>
									</div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px; margin-left: -34px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname2")%></span>
										</center>
									</div>
									<div class="col-md-2"></div>
								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->

								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="row" style="background-color: #fff;">
											<div class="col-md-12">
												<center>
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</center>
											</div>
										</div>
										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;

																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(wno) from tourWicket th where mid=" + count[i]
																				+ " and turn=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[i]
																				+ " and turn=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourWicket;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(hno) from tourHit th where mid=" + count[i]
																				+ " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i]
																				+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourHit;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(mno) from tourMiss th where mid=" + count[i]
																				+ " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[i]
																				+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourMiss;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and htype=6 and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and htype=6 and tourId="
																		+ request.getParameter("tourId") + ") as count2 from tourHit;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>


											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END GOLDEN -->
									</div>
									<div class="col-md-3"></div>
								</div>
								<br>
								<!-- END THIRD ROW -->

								<%
									} else {
								%>
								<!-- WOMENS -->

								<center>
									<span style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
										MATCH <%=count[i]%></span>
								</center>
								<%
									rs1 = null;
													rs1 = DBManager
															.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[i]
																	+ " and ttId=" + tid1[i] + " and tourId = " + request.getParameter("tourId")
																	+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[i]
																	+ " and ttId=" + tid2[i] + " and tourId = " + request.getParameter("tourId")
																	+ " group by ttId) as score2  from wmatch w where mid=" + count[i]
																	+ " and gender ='" + gender[i] + "';");
													if (rs1.next()) {
								%>
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3 teamscore1">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-3 teamscore2">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>
									<div class="col-md-3"></div>
								</div>
								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
													rs1 = DBManager.fetchQuery(
															"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid1[i] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid2[i] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname2 from tourTeam tt;");
													if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3"></div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname1")%></span>
										</center>
									</div>
									<div class="col-md-1"
										style="background-color: #fff; float: left; margin-left: -27px; height: 30px;">
										<span
											style="color: red; font-weight: 700; font-size: 24px; float: left; margin-top: -3px;">VS</span>
									</div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px; margin-left: -34px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname2")%></span>
										</center>
									</div>
									<div class="col-md-2"></div>
								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->

								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="row" style="background-color: #fff;">
											<div class="col-md-12">
												<center>
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</center>
											</div>
										</div>
										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(wno) from tourWicket th where mid=" + count[i]
																				+ " and turn=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[i]
																				+ " and turn=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourWicket;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(hno) from tourHit th where mid=" + count[i]
																				+ " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i]
																				+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourHit;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(mno) from tourMiss th where mid=" + count[i]
																				+ " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[i]
																				+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourMiss;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and htype=6 and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and htype=6 and tourId="
																		+ request.getParameter("tourId") + ") as count2 from tourHit;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END GOLDEN -->
									</div>
									<div class="col-md-3"></div>
								</div>
								<br>
								<!-- END THIRD ROW -->
								<%
									}
								%>
								<!--  <img src="images/slider/slide1.png" alt="First Slide"> -->
								<!-- FETCH FROM DATABASE MATCH WITH MID AND GENDER -->

							</div>
							<%
								}
										for (int j = i; j < count.length; j++) {
							%>
							<div class="item">
								<%
									if (gender[j].equals("M")) {
								%>
								<center>
									<span style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
										MATCH <%=count[j]%></span>
								</center>
								<%
									rs1 = null;
													rs1 = DBManager
															.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[j]
																	+ " and ttId=" + tid1[j] + " and tourId = " + request.getParameter("tourId")
																	+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[j]
																	+ " and ttId=" + tid2[j] + " and tourId = " + request.getParameter("tourId")
																	+ " group by ttId) as score2  from wmatch w where mid=" + count[j]
																	+ " and gender ='" + gender[j] + "';");
													if (rs1.next()) {
								%>
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3 teamscore1">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-3 teamscore2">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>
									<div class="col-md-3"></div>
								</div>
								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
													rs1 = DBManager.fetchQuery(
															"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid1[j] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid2[j] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname2 from tourTeam tt;");
													if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3"></div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname1")%></span>
										</center>
									</div>
									<div class="col-md-1"
										style="background-color: #fff; float: left; margin-left: -27px; height: 30px;">
										<span
											style="color: red; font-weight: 700; font-size: 24px; float: left; margin-top: -3px;">VS</span>
									</div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px; margin-left: -34px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname2")%></span>
										</center>
									</div>
									<div class="col-md-2"></div>
								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->
								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="row" style="background-color: #fff;">
											<div class="col-md-12">
												<center>
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</center>
											</div>
										</div>
										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(wno) from tourWicket th where mid=" + count[j]
																				+ " and turn=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[j]
																				+ " and turn=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourWicket;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(hno) from tourHit th where mid=" + count[j]
																				+ " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[j]
																				+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourHit;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(mno) from tourMiss th where mid=" + count[j]
																				+ " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[j]
																				+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourMiss;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and htype=6 and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and htype=6 and tourId="
																		+ request.getParameter("tourId") + ") as count2 from tourHit;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END GOLDEN -->
									</div>
									<div class="col-md-3"></div>
								</div>
								<br>
								<!-- END THIRD ROW -->


								<%
									} else {
								%>
								<center>
									<span style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
										MATCH <%=count[j]%></span>
								</center>
								<%
									rs1 = null;
													rs1 = DBManager
															.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[j]
																	+ " and ttId=" + tid1[j] + " and tourId = " + request.getParameter("tourId")
																	+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[j]
																	+ " and ttId=" + tid2[j] + " and tourId = " + request.getParameter("tourId")
																	+ " group by ttId) as score2  from wmatch w where mid=" + count[j]
																	+ " and gender ='" + gender[j] + "';");
													if (rs1.next()) {
								%>
								<div class="row">
									<div class="col-md-3"></div>
									<div class="col-md-3 teamscore1">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-3 teamscore2">
										<span
											style="float: left; margin-left: 29%; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>
									<div class="col-md-3"></div>
								</div>

								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
													rs1 = DBManager.fetchQuery(
															"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid1[j] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																	+ tid2[j] + " and tourId=" + request.getParameter("tourId")
																	+ ") as tname2 from tourTeam tt;");
													if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-3"></div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname1")%></span>
										</center>
									</div>
									<div class="col-md-1"
										style="background-color: #fff; float: left; margin-left: -27px; height: 30px;">
										<span
											style="color: red; font-weight: 700; font-size: 24px; float: left; margin-top: -3px;">VS</span>
									</div>
									<div class="col-md-3"
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px; margin-left: -34px;">
										<center>
											<span
												style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap;"><%=rs1.getString("tname2")%></span>
										</center>
									</div>
									<div class="col-md-2"></div>
								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->
								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">
									<div class="col-md-3"></div>
									<div class="col-md-6">
										<div class="row" style="background-color: #fff;">
											<div class="col-md-12">
												<center>
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</center>
											</div>
										</div>
										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(wno) from tourWicket th where mid=" + count[j]
																				+ " and turn=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[j]
																				+ " and turn=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourWicket;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 33px; margin-top: 5px;">WICKET</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>


											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(hno) from tourHit th where mid=" + count[j]
																				+ " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[j]
																				+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourHit;");
																if (rs1.next()) {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 51px; margin-top: 5px;">HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery(
																		"select distinct(select count(mno) from tourMiss th where mid=" + count[j]
																				+ " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[j]
																				+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																				+ ") as count2 from tourMiss;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 45px; margin-top: 5px;">MISS</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff;">
											<div class="col-md-2"></div>
											<%
												rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId") + ") as count2 from tourRestore;");
																if (rs1.next()) {
											%>

											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4">
												<span
													style="float: left; font-weight: 700; font-size: 15px; margin-left: 22px; margin-top: 5px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-2">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
											<div class="col-md-2"></div>
										</div>
										<!-- END GOLDEN -->
									</div>
									<div class="col-md-3"></div>
								</div>
								<br>
								<!-- END THIRD ROW -->

								<%
									}
								%>
							</div>
							<%
								}
							%>
						</div>
						<!-- Carousel controls -->
						<a class="carousel-control left" href="#myCarousel"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="carousel-control right" href="#myCarousel"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>



				<!-- END CAROUSEL -->
				<div class="row">

					<div class="col-md-12" style="width: 99%; margin-top: -1.5%;">
						<table class="table table-fixed table-hover">
							<thead>
								<tr>
									<th class="col-xs-1" style="background: #e21e22;">#</th>
									<th class="col-xs-4" style="background: #e21e22;">TEAMS</th>
									<th class="col-xs-3" style="background: #e21e22;">DATE &
										TIME(IST)</th>
									<th style="background: #e21e22;" class="col-xs-2">MATCH</th>
									<th style="background: #e21e22;" class="col-xs-2">GENDER</th>
								</tr>
							</thead>
							<tbody
								style="background: #f0f0ef; box-shadow: 5px 1px 5px #888888; cursor: pointer;">
								<%
									i = 0;
							 	 if(rs.next())
					          	 {
									rs.beforeFirst();
					          		 while (rs.next()) {
								%>
								<tr class="table-row" onClick="javascript:goToSlide(<%=i%>);"
									data-href="2">
									<td class="col-xs-1"><b><%=i + 1%></b></td>
									<td class="col-xs-4"><span id="tname-fixture"><%=rs.getString("tname1")%></span><em
										style="color: #333; font-family: gotham-medium, sans-serif; font-size: 12px; padding: 0 20px; font-style: normal; vertical-align: middle;"><b>VS</b></em><%=rs.getString("tname2")%></td>
									<td class="col-xs-3"><b><span
											style="color: #333; font-size: 13px;"><%=rs.getString("mdate")%></span></b>&nbsp;<b><span
											style="color: #999; font-size: 13px; line-height: 2px;">&nbsp;&nbsp;<%=rs.getString("time")%>
												(IST)
										</span></b></td>
									<td class="col-xs-2"><b><%=rs.getString("mtype").toUpperCase()%></b></td>
									<td class="col-xs-2"><b><center><%=rs.getString("gender")%></center></b></td>
								</tr>
								<%
									i = i + 1;
											}
					          	 }
					          	 else
					          	 {
					          		 %>
					          		 <h4>MATCH NOT FOUND</h4>
					          		 <% 
					          		 }
								%>
							</tbody>
						</table>

					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8">
				<span class="photo-head fixture-head">PHOTOS</span>
				<div class="image-example">
					<div id="myCarousel1" class="carousel slide" data-ride="carousel1"
						style="height: 500px;">
						<!-- Carousel indicators -->
						<ol class="carousel-indicators">
							<li data-target="#myCarousel1" data-slide-to="0" class="active"></li>
							<li data-target="#myCarousel1" data-slide-to="1"></li>
							<li data-target="#myCarousel1" data-slide-to="2"></li>
						</ol>
						<!-- Wrapper for carousel items -->
						<div class="carousel-inner" style="height: inherit;">
							<div class="item active">
								<img src="images/portfolio/3.JPG" alt="First Slide">
							</div>
							<div class="item">
								<img src="images/portfolio/4.JPG" alt="Second Slide">
							</div>
							<!--  <div class="item">
		                <img src="images/portfolio/2.jpg" alt="Second Slide">
		            </div> -->
							<!--  <div class="item">
		                <img src="images/portfolio/1.jpg" alt="Second Slide">
		            </div>
		             <div class="item">
		                <img src="images/portfolio/5.jpg" alt="Second Slide">
		            </div> -->

						</div>
						<!-- Carousel controls -->
						<a class="carousel-control left" href="#myCarousel1"
							data-slide="prev"> <span
							class="glyphicon glyphicon-chevron-left"></span>
						</a> <a class="carousel-control right" href="#myCarousel1"
							data-slide="next"> <span
							class="glyphicon glyphicon-chevron-right"></span>
						</a>
					</div>
				</div>

			</div>
			<div class="col-md-4">
				<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [ MALE ]</h5>
					</div>

					<div class="panel-body"
						style="height: 230px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								
								int ic = 1;
							
								rs = null; rs1 = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + request.getParameter("tourId")  + " and tpgender='M' group by pname;");
								if (rs.last())
									pcnt = rs.getRow();
								else
								{
									%>
						<h3>NO MATCHE FOUND</h3>
						<% 
								}

								for (int k = 0; k < pcnt; k++) {
									rs = null;
						%>
						
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team <span style="color:#e21e22">[</span> POOL - <%=((char) (65 + k))%> <span style="color:#e21e22">]</span></th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
							
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+request.getParameter("tourId") +" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+request.getParameter("tourId") +" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+request.getParameter("tourId") +" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+request.getParameter("tourId")+" and tpgender='M' and pname="+(k+1)+" order by W desc limit 4;");
										if(rs.next())
										{
											rs.beforeFirst();
										while(rs.next())
										{
							%>

								<tr>
									<td style="font-size: 16px;"><b><%=ic++%></b></td>
									<td><span
										style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
									<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
									<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W")*2)%></b></td>
								</tr>
								<%	
								
									}
										}
										else
										{
										}
										ic=1;
										%>
							</tbody>
						</table>
						<%
							}
							} catch (Exception e) {
								e.getMessage();
							}
						%>
				</div></div></div>
				<!-- FEMALE -->
				<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [ FEMALE ]</h5>
					</div>

					<div class="panel-body"
						style="height: 230px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								
								int ic = 1;
							
								rs = null; rs1 = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + request.getParameter("tourId")  + " and tpgender='F' group by pname;");
								if (rs.last())
									pcnt = rs.getRow();
								else
								{
									%>
						<h3>NO MATCHE FOUND</h3>
						<% 
								}

								for (int k = 0; k < pcnt; k++) {
									rs = null;
						%>
						
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team <span style="color:#e21e22">[</span> POOL - <%=((char) (65 + k))%> <span style="color:#e21e22">]</span></th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
							
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+request.getParameter("tourId") +" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+request.getParameter("tourId") +" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+request.getParameter("tourId") +" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+request.getParameter("tourId")+" and tpgender='F' and pname="+(k+1)+" order by W desc limit 4;");
										if(rs.next())
										{
											rs.beforeFirst();
										while(rs.next())
										{
							%>

								<tr>
									<td style="font-size: 16px;"><b><%=ic++%></b></td>
									<td><span
										style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
									<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
									<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W")*2)%></b></td>
								</tr>
								<%	
								
									}
										}
										else
										{
											
										}
										ic=1;
										%>
							</tbody>
						</table>
						<%
							}
							} catch (Exception e) {
								e.getMessage();
							}
						%>
				</div></div></div>
				
				<!-- END FEMALE -->
			</div>
		</div>
		<br> <br>
		<%
			} else {
		%>
		<script type='text/javascript'>
	swal({
		  title: "Select Tournament",
		  text: "Click On Yes To Redirect...",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes, Go!",
		  closeOnConfirm: false
		},
		function(){
		  swal("Redirecting!", "Let's Go....", "success");
			window.location.replace("tournament.jsp");
		});

	
</script>
		<%
			}
			} catch (Exception e) {
				System.out.println("TOurnamentnext" + e);
			}
		%>


	</div>
</body>
</html>