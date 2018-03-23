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
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


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
	width: 75%;
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
	margin-top: -20px;
	clear: both;
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

.match-head {
	line-height: 38px;
	font-size: 24px;
	color: #030825;
	font-weight: 700;
}

.league-head {
	margin-top: 6%;
}

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
	margin-top: -1%;
}

.carousel-indicators li {
	visibility: hidden;
}

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
	height: 350px;
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

/* DROP DOWN */
.bootstrap-select
:not
 
(
[
class
*=
"col-"
]
 
)
:not
 
(
[
class
*=
"form-control"
]
 
)
:not

	
(
.input-group-btn
 
){
width
:
 
300
px
;


}

/*END*/

/*ACCORDION*/
.table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th,
	.table>thead>tr>td {
	padding: 0px;
	line-height: 3.429;
	vertical-align: top;
	border-top: 1px solid #ddd;
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
			ResultSet rs = null;
			DBManager.loadDriver();
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
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#myHeader"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myHeader">
					<ul class="nav navbar-nav">
						<li style="margin-left: -120px"><a href="home.jsp"><font
								color="white">HOME</font></a></li>
						<li class="nav-item dropdown active"><a
							style="padding: 16px;" class="nav-link dropdown-toggle"
							data-toggle="dropdown" href="tournament.jsp" role="button"
							aria-haspopup="true" aria-expanded="false">TOURNAMENT<span
								class="sr-only">(current)</span></a></li>

						<!-- 	<li><a href="#"><font color="white">TEAMS</font></a></li> -->
						<li><a
							href="updateHMR.jsp?tourId=<%=request.getParameter("tourId")%>"><font
								color="white">UPDATE</font></a></li>
						<li><a href="selectMatch.jsp"><font color="white">SELECT
									MATCH</font></a></li>
						<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
						<li><a href="#"><font color="white">STATISTICS</font></a></li>
					</ul>
					<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="SEARCH">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						GO
						</button>
					</div>
				</form> -->
				</div>
			</div>
			</nav>
		</div>
		<div class="container-fluid">
			<div class="row" id="container-tour-image">
				<div class="col-md-12 col-sm-12 col-lg-12">
					<div class="design">
						<div class="tour-image-text">
							<img src="images/2(1).png" width="1110" height="320"
								style="float: right; margin-top: -1.2%; margin-right: -41.6%; overflow-x: hidden;">
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
					id="presentation">OVERVIEW</a></li>
				<li class="active"><a
					href="addtour.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">ADD</a></li>
				<li class="active"><a
					href="selectMatch.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation1">SELECT MATCH</a></li>
				<li class="active"><a
					href="updateplayer.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">EDIT PLAYER</a></li>
				<li class="active"><a
					href="viewList.jsp?tourId=<%=request.getParameter("tourId")%>"
					id="presentation">VIEW</a></li>

			</ul>
		</div>
		<!-- <center><img src="images/wcplogo.png" width="800" height="350"></center> -->
		<br> <br>
		<div class="row">
			<div class="col-md-2">
				<!-- NAVBAR -->
				<div class="panel-group lists"
					style="margin-left: 19%; margin-right: -13%;">
					<div class="panel panel-default">
						<div class="panel-heading"
							style="color: #333; background-color: #0C1860; border-color: #ddd;">
							<h4 class="panel-title">

								<button type="button"
									class="btn btn-default btn-md button-lists"
									style="margin-left: 16%;">
									<span class="glyphicon glyphicon-menu-hamburger"></span><b><font
										color="color: #ac2925;"> OPTION</font></b>
								</button>

								<!--  <a data-toggle="collapse" href="#collapse1">OPTIONS</a> -->
							</h4>
						</div>

						<ul class="list-group lists-group">

							<li class="list-group-item"><a href="#addofficial"
								data-toggle="collapse" style="color: #052b90;">Add Official</a></li>
							<li class="list-group-item"><a href="#addmatch"
								data-toggle="collapse" style="color: #052b90;">Add Match</a></li>
							<li class="list-group-item"><a href="#updatematch"
								data-toggle="collapse" style="color: #052b90;">Update Match</a></li>
							<li class="list-group-item"><a href="#updateofficial"
								data-toggle="collapse" style="color: #052b90;">Update
									Official</a></li>
						</ul>

					</div>
				</div>
				<!-- END -->
			</div>
			<div class="col-md-10">
				<div id="addofficial" class="collapse">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-9">
								<select id="matchselect" class="selectpicker" datasize=15>
									<option value=-1>SELECT MATCH</option>
									<%
										rs = null;

												rs = DBManager.fetchQuery(
														"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname2,gender,mtype,ucase(mtype) as type from wmatch pm where mid not in(select mid from tourmatchrefoff p where p.mid=pm.mid and pm.gender=p.gender) and tourId="
																+ request.getParameter("tourId"));
												while (rs.next()) {
									%>
									<option
										value="<%=rs.getInt("mid")%>&<%=rs.getString("gender")%>"><%=rs.getInt("mid")%>&nbsp;&nbsp;<%=rs.getString("tname1")%>&nbsp;VS&nbsp;<%=rs.getString("tname2")%>&nbsp;&nbsp;<%=rs.getString("type")%>
										&nbsp;&nbsp;(<%=rs.getString("gender")%>)
									</option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h5 style="color: #0E1957;">
									<b>REFREE</b>
								</h5>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-9">
										<select id="matchrefree1" class="selectpicker" data-size="10"
											style="display: none;" required>
											<option value="-1">FIRST REFREE</option>

											<%
												rs = null;
														rs = DBManager.fetchQuery(
																" select barcodeId,(select fName from member m where m.barcodeId = t.barcodeId) as fName,(select lName from member m where m.barcodeId = t.barcodeId) as lName from tourOfficial t where tourId="
																		+ request.getParameter("tourId") + " order by fName asc");
														while (rs.next()) {
											%>
											<option value="<%=rs.getInt("barcodeId")%>"><%=rs.getString("fName")%>&nbsp;<%=rs.getString("lName")%></option>
											<%
												}
											%>
										</select> &nbsp;&nbsp;&nbsp; <select id="matchrefree2"
											class="selectpicker" data-size="10" style="display: none;">
											<option value="-1">SECOND REFREE</option>

											<%
												rs.beforeFirst();
														while (rs.next()) {
											%>
											<option value="<%=rs.getInt("barcodeId")%>"><%=rs.getString("fName")%>&nbsp;<%=rs.getString("lName")%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-2"></div>
								</div>
							</div>

						</div>

						<!-- OFFICIAL -->
						<div class="row">
							<div class="col-md-12">
								<h5 style="color: #0E1957;">
									<b>TABLE OFFICIAL</b>
								</h5>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-9">
										<select id="matchoff1" class="selectpicker" data-size="10"
											style="display: none;">
											<option value="-1">FIRST OFFICIAL</option>

											<%
												rs = null;
														rs = DBManager.fetchQuery(
																" select barcodeId,(select fName from member m where m.barcodeId = t.barcodeId) as fName,(select lName from member m where m.barcodeId = t.barcodeId) as lName from tourOfficial t where tourId="
																		+ request.getParameter("tourId") + " order by fName asc");
														while (rs.next()) {
											%>
											<option value="<%=rs.getInt("barcodeId")%>"><%=rs.getString("fName")%>&nbsp;<%=rs.getString("lName")%></option>
											<%
												}
											%>
										</select> &nbsp;&nbsp;&nbsp; <select id="matchoff2"
											class="selectpicker" data-size="10" style="display: none;">
											<option value=-1>SECOND OFFICIAL</option>

											<%
												rs.beforeFirst();
														while (rs.next()) {
											%>
											<option value="<%=rs.getInt("barcodeId")%>"><%=rs.getString("fName")%>&nbsp;<%=rs.getString("lName")%></option>
											<%
												}
											%>
										</select>
									</div>
									<div class="col-md-2"></div>
								</div>

							</div>
						</div>

						<!-- TOURNAMENT REFREE -->
						<div class="row">
							<div class="col-md-12">
								<h5 style="color: #0E1957;">
									<b>CHIEF REFREE</b>
								</h5>
								<div class="row">
									<div class="col-md-1"></div>
									<div class="col-md-9">
										<select id="cfref" class="selectpicker" data-size="10"
											style="display: none;">
											<option value=-1>CHEIF REFREE</option>

											<%
												rs = null;
														rs = DBManager.fetchQuery(
																" select barcodeId,(select fName from member m where m.barcodeId = t.barcodeId) as fName,(select lName from member m where m.barcodeId = t.barcodeId) as lName from tourOfficial t where tourId="
																		+ request.getParameter("tourId") + " order by fName asc");
														while (rs.next()) {
											%>
											<option value="<%=rs.getInt("barcodeId")%>"><%=rs.getString("fName")%>&nbsp;<%=rs.getString("lName")%></option>
											<%
												}
											%>
										</select> &nbsp;&nbsp;&nbsp;
										<button class="btn btn-primary" onclick="addroc();">ADD</button>
									</div>
									<div class="col-md-2"></div>
								</div>
								<hr style="border-top: 1px solid #181717;">
							</div>
						</div>
					</div>
				</div>

				<!-- ADD MATCH -->

				<div id="addmatch" class="collapse">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-9">
								<select id="matchselect" class="selectpicker" datasize=15>
									<%
										rs = null;
												rs = DBManager.fetchQuery(
														"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname2,gender,ucase(mtype) as type from wmatch pm where tourId="
																+ request.getParameter("tourId"));
												while (rs.next()) {
									%>
									<option
										value="<%=rs.getInt("mid")%>&<%=rs.getString("gender")%>"><%=rs.getInt("mid")%>&nbsp;&nbsp;<%=rs.getString("tname1")%>&nbsp;VS&nbsp;<%=rs.getString("tname2")%>&nbsp;&nbsp;<%=rs.getString("type")%>
										&nbsp;&nbsp;(<%=rs.getString("gender")%>)
									</option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h4>REFREE</h4>
								<%
									rs = null;
								%>
							</div>

						</div>
					</div>
				</div>

				<!-- END -->
				<!-- UPDATE MATCH/OFFICIAL -->

				<div id="updatematchofficial" class="collapse">
					<div class="container-fluid">
						<div class="row">
							<div class="col-md-3"></div>
							<div class="col-md-9">
								<select id="matchselect" class="selectpicker" datasize=15>
									<%
										rs = null;
												rs = DBManager.fetchQuery(
														"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname2,gender,ucase(mtype) as type from wmatch pm where tourId="
																+ request.getParameter("tourId"));
												while (rs.next()) {
									%>
									<option
										value="<%=rs.getInt("mid")%>&<%=rs.getString("gender")%>"><%=rs.getInt("mid")%>&nbsp;&nbsp;<%=rs.getString("tname1")%>&nbsp;VS&nbsp;<%=rs.getString("tname2")%>&nbsp;&nbsp;<%=rs.getString("type")%>
										&nbsp;&nbsp;(<%=rs.getString("gender")%>)
									</option>
									<%
										}
									%>
								</select>
							</div>
						</div>

						<div class="row">
							<div class="col-md-12">
								<h4>REFREE</h4>
								<%
									rs = null;
								%>
							</div>

						</div>
					</div>
				</div>

				<!-- END UPDATE/OFFICIAL -->

				<center>
					<span class="match-head">MATCHES</span>
				</center>
				<!-- START CAROUSEL -->
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
												+ ") as tname2,gender,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from print_match pm where tourId="
												+ request.getParameter("tourId") + " order by srno asc;");
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
							%>
							<%
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
										style="background-color: rgb(255, 255, 255); width: 24%; height: 30px; margin-left: -40px;">
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
																rs1 = DBManager
																		.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																				+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId="
																				+ request.getParameter("tourId")
																				+ ") as count1 ,(select count(rno) from tourRestore th where mid="
																				+ count[i] + " and ttId=" + tid2[i] + " and rtype='6' and tourId="
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
																rs1 = DBManager
																		.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																				+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId="
																				+ request.getParameter("tourId")
																				+ ") as count1 ,(select count(rno) from tourRestore th where mid="
																				+ count[i] + " and ttId=" + tid2[i] + " and rtype='6' and tourId="
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
																rs1 = DBManager
																		.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																				+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId="
																				+ request.getParameter("tourId")
																				+ ") as count1 ,(select count(rno) from tourRestore th where mid="
																				+ count[j] + " and ttId=" + tid2[j] + " and rtype='6' and tourId="
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
																rs1 = DBManager
																		.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																				+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId="
																				+ request.getParameter("tourId")
																				+ ") as count1 ,(select count(rno) from tourRestore th where mid="
																				+ count[j] + " and ttId=" + tid2[j] + " and rtype='6' and tourId="
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
									<th class="col-md-1" style="background: #e21e22;">#</th>
									<th class="col-md-4" style="background: #e21e22;">TEAMS</th>
									<th class="col-md-3" style="background: #e21e22;">DATE &
										TIME (IST)</th>
									<th class="col-md-2" style="background: #e21e22;">MATCH</th>
									<th class="col-md-2" style="background: #e21e22;">POOL /
										GENDER</th>
								</tr>
							</thead>
							<tbody
								style="background: #f0f0ef; box-shadow: 5px 1px 5px #888888; cursor: pointer;">
								<%
									rs = null;
											rs = DBManager.fetchQuery(
													"select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
															+ request.getParameter("tourId")
															+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
															+ request.getParameter("tourId")
															+ ") as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,mtype,gender,pool,TIME_FORMAT(mtime,'%H:%i') as time from wmatch w where mid not in(select mid from print_match pw where pw.gender=w.gender and w.tourId=pw.tourId) and tourId="
															+ request.getParameter("tourId"));
											i = 0;
											while (rs.next()) {
								%>

								<tr class="table-row" data-toggle="collapse"
									data-target="#accordion<%=i%>" class="clickable">

									<td class="col-md-1" style="line-height: 339.4%;">&nbsp;&nbsp;&nbsp;<b><%=rs.getInt("mid")%></b></td>
									<td class="col-md-4"><span id="tname-fixture"><%=rs.getString("tname1")%></span><em
										style="color: #333; font-family: gotham-medium, sans-serif; font-size: 12px; padding: 0 20px; font-style: normal; vertical-align: middle;"><b>VS</b></em><%=rs.getString("tname2")%></td>
									<td class="col-md-3"><b><span
											style="color: #333; font-size: 13px;"><%=rs.getString("mdate")%></span></b>&nbsp;<b><span
											style="color: #999; font-size: 13px; line-height: 2px;">&nbsp;&nbsp;<%=rs.getString("time")%>
												(IST)
										</span></b></td>
									<td class="col-md-2"><span style="color: #333;"><b>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("mtype").toUpperCase()%></b></span>
									</td>

									<td class="col-md-2"><center>
											<span style="color: #ac2925;"><b>&#<%=rs.getInt("pool") + 64%></b></span>
											/ <b><%=rs.getString("gender")%></b>
										</center></td>
								</tr>


								<tr>
									<td class="col-xs-12">
										<div id="accordion<%=i%>" class="collapse"
											style="background: #0E1957; overflow-x: hidden;">
											<div class="row">
												<div class="col-md-1"></div>
												<div class="col-md-5" style="color: #fff;">
													<label for="gender" style="margin-bottom: -11px;"><font
														size="4px">Toss Won By</font></label><br> <input type="radio"
														id="toss-team1&<%=i%>&<%=rs.getInt("mid")%>"
														name="teams&<%=i%>&<%=rs.getInt("mid")%>"
														value=<%=rs.getInt("tid1")%>><%=rs.getString("tname1")%>
													<input type="radio"
														id="toss-team2&<%=i%>&<%=rs.getInt("mid")%>"
														name="teams&<%=i%>&<%=rs.getInt("mid")%>"
														value=<%=rs.getInt("tid2")%>><%=rs.getString("tname2")%>

												</div>
												<div class="col-md-2" style="color: #fff;">
													<label for="court"><font size="4px">Court</font></label><br>
													<input type="text" class="form-control"
														id="court&<%=i%>&<%=rs.getInt("mid")%>"
														name="court&<%=i%>&<%=rs.getInt("mid")%>"
														placeholder="COURT NO" style="width: 74%; height: 40%;">
												</div>
												<div class="col-md-4">
													<button type="button" class="btn btn-primary"
														onclick="getmid(<%=rs.getInt("mid")%>);getgen('<%=rs.getString("gender")%>');golivescore(<%=rs.getInt("mid")%>,<%=i%>);"
														style="margin-top: 20%;">GO</button>
												</div>

											</div>
											&nbsp;
										</div>

									</td>
									<!-- <td class="col-xs-5">&nbsp; </td><td class="col-xs-4">&nbsp;</td><td class="col-xs-2">&nbsp;</td> -->
								</tr>

								<!-- END -->

								<%
									i = i + 1;
											}
								%>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- <div class="col-md-1"></div> -->
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
				System.out.println("slectMatch.jsp " + e);
			}
		%>

	</div>
	<script>
function insertPM(court,toss,tourId,mid,gender)
{
	//alert("insertpm : "+"printmatch1.jsp?tourId="+tourId+"&toss="+toss+"&court="+court+"&mid="+mid+"&gender="+gender);
	window.open("printmatch1.jsp?tourId="+tourId+"&toss="+toss+"&court="+court+"&mid="+mid+"&gender="+gender,"file","height=1,width=1");
	//alert("insertpm : "+"printmatch2.jsp?tourId="+tourId+"&toss="+toss+"&court="+court+"&mid="+mid+"&gender="+gender);
}
function golivescore(mid,id)
{
	var toss=0;
	var court = document.getElementById("court&"+id+"&"+mid).value;
	if(court == "")
	{	
		document.getElementById("court&"+id+"&"+mid).focus();
		return false;
	}

	if(document.getElementById("toss-team1&"+id+"&"+mid).checked)
	{
		toss = document.getElementById("toss-team1&"+id+"&"+mid).value;
	}
	else if(document.getElementById("toss-team2&"+id+"&"+mid).checked)
	{
		toss = document.getElementById("toss-team2&"+id+"&"+mid).value;
	}
	else
	{
		swal("Select the team");
		return false;
	}
	insertPM(court,toss,getParameter("tourId"),window.mid,window.gender);
	/* var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 200 && xmlhttp.status == 4)
			{}
		};
	}
	
	xmlhttp.open("GET","printmatch1.jsp?tourId="+getParameter("tourId")+"&toss="+toss+"&court="+court+"&mid="+window.mid+"&gender="+window.gender,true);
	xmlhttp.send(null); */
	if(document.getElementById("court&"+id+"&"+mid).value)
	{
		document.getElementById("court&"+id+"&"+mid).value='';
		document.getElementsByName('court&'+id+'&'+mid)[0].placeholder='COURT NO';
	}
	
	document.getElementById("toss-team1&"+id+"&"+mid).checked = false;
	document.getElementById("toss-team2&"+id+"&"+mid).checked = false; 
	
	window.location.replace("livematch.jsp?tourId="+getParameter("tourId")+"&mid="+window.mid+"&gen="+window.gender);
	
/* 	$('#toss-modal').modal('toggle'); */
}
function getParameter(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

function getmid(mid)
{
	window.mid = mid;
}
function getgen(gender)
{
	window.gender = gender;
}

function addroc()
{
	var midgen = document.getElementById("matchselect").value;
	
	if(midgen == -1)
	{
		swal("Select the Match","");
		document.getElementById("matchselect").focus();
		return false;
	}
	
	var variable = midgen.split("&");
	var mid = variable[0];
	var gen = variable[1];
	
	var mrf1 = document.getElementById("matchrefree1").value;
	var mrf2 = document.getElementById("matchrefree2").value;
	
	if(mrf1 == -1){
		swal("Select the first refree","");
		document.getElementById("matchrefree1").focus();
		return false;
	}
	if(mrf2 == -1){
		swal("Select the second refree","");
		document.getElementById("matchrefree2").focus();
		return false;
	}
		
	if(mrf1 == mrf2){
		swal("Both refree cannot be same","");
		document.getElementById("matchrefree2").focus();
		return false;
	}
	var mof1 = document.getElementById("matchoff1").value; 
	var mof2 = document.getElementById("matchoff2").value; 
	
	if(mof1 == -1){
		swal("Select the first official","");
		document.getElementById("matchoff1").focus();
		return false;
	}
	if(mof2 == -1){
		swal("Select the second official","");
		document.getElementById("matchoff2").focus();
		return false;
	}
		
	if(mof1 == mof2){
		swal("Both official cannot be same","");
		document.getElementById("matchoff2").focus();
		return false;
	}
	
	if(mrf1 != mof1 && mrf1 != mof2 && mrf2 != mof1 && mrf2 != mof2 )
	{
		var cr = document.getElementById("cfref").value;
		if(cr == -1)
		{
			swal("Select Chief Refree","");
			document.getElementById("cfref").focus();
			return false;	
		}
		var tourId=getParameter("tourId");
		 var xmlhttp = false;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();	
		}
		if(xmlhttp){
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					location.replace("selectMatch.jsp?tourId="+getParameter("tourId"));
					swal("Data Added Successfully.","");
				}
			};
		}
	   
	 	xmlhttp.open("GET","addtourMatchRefree.jsp?mid="+mid+"&gen="+gen+"&tourId="+tourId+"&tmr1="+mrf1+"&tmr2="+mrf2+"&tmo1="+mof1+"&tmo2="+mof2+"&tourRefree="+cr,true);
		xmlhttp.send(null); 
		
	}
	else
	{
		swal("Both official and refree cannot be same","");
		document.getElementById("matchoff2").focus();
		return false;
	}
	/* matchselect matchrefree1 matchrefree2 matchoff1 matchoff2 cfref*/
}


</script>
</body>
</html>