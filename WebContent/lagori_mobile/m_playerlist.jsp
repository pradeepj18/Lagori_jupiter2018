<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Player Details</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/mobile_home.css">
<link rel="stylesheet" href="../css/customcss.css">
<style type="text/css">
body {
	background-color: #f5f5f5;
}
.side-carousel-name,.second-carousel-name
{
color:#fff;
font-size: 15pt;
text-transform:uppercase;
}

</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('ul.dropdown-menu [data-toggle=dropdown]').on('click', function(e) {
			e.preventDefault(); 
			e.stopPropagation(); 
			$(this).parent().siblings().removeClass('open');
			$(this).parent().toggleClass('open');
		});
	});

</script>
<script type="text/javascript">
	/* MENS */
	function prev() {

		$("#myCarousel1").carousel("prev");
		$("#myCarousel2").carousel("prev");
		$("#myCarousel3").carousel("prev");
		pause();
	}
	function next() {

		$("#myCarousel1").carousel("next");
		$("#myCarousel2").carousel("next");
		$("#myCarousel3").carousel("next");
		pause();
	}
	function pause() {
		$("#myCarousel1").carousel("pause");
		$("#myCarousel2").carousel("pause");
		$("#myCarousel3").carousel("pause");
	}
	/* WOMENS */
	function woprev() {

		$("#myCarousel4").carousel("prev");
		$("#myCarousel5").carousel("prev");
		$("#myCarousel6").carousel("prev");
		wopause();
	}
	function wonext() {

		$("#myCarousel4").carousel("next");
		$("#myCarousel5").carousel("next");
		$("#myCarousel6").carousel("next");
		wopause();
	}
	function wopause() {
		$("#myCarousel4").carousel("pause");
		$("#myCarousel5").carousel("pause");
		$("#myCarousel6").carousel("pause");
	}
</script>
</head>

<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">LAGORI INDIA</a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<li><a href="m_home.jsp">HOME</a></li>
					<li class="active"><a
						href="m_tournamentsnext.jsp?tourId=<%=request.getParameter("tourId")%>">OVERVIEW</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">INSERT <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="m_addtourMember.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M&cate=1">Add Player</a></li>
							<li><a href="m_addtourTeam.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M">Add Teams</a></li>
							<li><a href="m_addtourMatch.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M">Add Pool</a></li>
						</ul></li>
					<li><a href="m_selectMatch.jsp?tourId=<%=request.getParameter("tourId")%>">SELECT MATCH</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">UPDATE <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a
								href="m_updateindex.jsp?tourId=<%=request.getParameter("tourId")%>">Tournament Details</a></li>
							<li><a
								href="m_updatehmrwindex.jsp?tourId=<%=request.getParameter("tourId")%>">Match Details</a></li>
						</ul></li>


					<li><a href="#">VIEW</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">PRINT <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li class="dropdown dropdown-submenu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Schedule</a>
								<ul class="dropdown-menu">
									<li><a
										href="m_printSchedule.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M"
										target="_blank">Male Schedule</a></li>
									<li><a
										href="m_printSchedule.jsp?tourId=<%=request.getParameter("tourId")%>&gen=F"
										target="_blank">Female Schedule</a></li>
								</ul></li>
							<li class="dropdown dropdown-submenu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Pool</a>
								<ul class="dropdown-menu">
									<li><a
										href="m_printPool.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M"
										target="_blank">Male Pool</a></li>
									<li><a
										href="m_printPool.jsp?tourId=<%=request.getParameter("tourId")%>&gen=F"
										target="_blank">Female Pool</a></li>
								</ul></li>
							<li class="dropdown dropdown-submenu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Teams</a>
								<ul class="dropdown-menu">
									<li><a
										href="m_printTeam.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M"
										target="_blank">Male Team</a></li>
									<li><a
										href="m_printTeam.jsp?tourId=<%=request.getParameter("tourId")%>&gen=F"
										target="_blank">Female Team</a></li>
								</ul></li>
							<li class="dropdown dropdown-submenu"><a href="#"
								class="dropdown-toggle" data-toggle="dropdown">Player List</a>
								<ul class="dropdown-menu">
									<li><a
										href="m_printPlayer.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M"
										target="_blank">Male Players</a></li>
									<li><a
										href="m_printPlayer.jsp?tourId=<%=request.getParameter("tourId")%>&gen=F"
										target="_blank">Female Players</a></li>
								</ul></li>
							<li><a
								href="m_print_backupscoresheet.jsp?tourId=<%=request.getParameter("tourId")%>"
								target="_blank">ScoreSheet</a></li>
						</ul></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span>
							Logout</a></li>

				</ul>
			</div>
		</div>
	</nav>
	<br>
	<br>
	<br>
	<br>
	<%
		try {
			DBManager.loadDriver();
			ResultSet rs = null;
	%>
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center"><h4>TEAM LIST</h4></div>
					<div class="panel-body tournext-panel-body">

						<%
							String logo = "";
								rs = null;

								try {
									rs = DBManager.fetchQuery(
											"select distinct(tId),(select tName from team where tId = tt.tId) as tname,(select SUBSTRING_INDEX(tFlag,'/',-3) from team where tId = tt.tId ) as flag from tourTeam tt where tourId="
													+ request.getParameter("tourId") + " order by tname asc;");
									while (rs.next()) {
										if (rs.getString("flag") == null)
											logo = "images/default_tour_logo.png";
										else
											logo = rs.getString("flag");
						%>
						<a
							href="m_playerlist.jsp?tourId=<%=request.getParameter("tourId")%>&tId=<%=rs.getInt("tId")%>">
							<span class="list-group-item tournext-list-group-item">
								&nbsp; <img src="../<%=logo%>" width=50 height=50
								style="border-radius: 50%;"> &nbsp;&nbsp;&nbsp; <span
								style="white-space: nowrap;"><%=rs.getString("tname")%></span>

						</span>
						</a>
						<%
							}
								} catch (Exception e) {
									System.out.println("Error : " + e);
								}
						%>
					</div>
				</div>

			</div>

			<div class="col-xs-12 col-sm-12 col-md-9">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center"><h4>PLAYER
							LIST - MALE</h4></div>
						<div class="panel-body tournext-panel-body" style="height:320px;">

							<%
								rs = null;
									int mtid = 0;
									int ftid = 0;
									int i = 0;
									rs = DBManager
											.fetchQuery("select ttId,ttGender from tourTeam tp,team t where t.tId = tp.tId and tp.tId="
													+ request.getParameter("tId") + " and tourId=" + request.getParameter("tourId")
													+ " order by ttGender asc;");
									if (rs.next()) {
										rs.beforeFirst();
										while(rs.next()){
										if (rs.getString("ttGender").equals("M")) {
											mtid = rs.getInt("ttId");
										} else {
											ftid = rs.getInt("ttId");
										}
									}
									}
							%>

							
							<%
								System.out.println(mtid);
									String photo = "";
									rs = null;
									rs = DBManager.fetchQuery(
											"select barcodeId,(select SUBSTRING_INDEX(photo,'/',-3) from member where barcodeId = tp.barcodeId ) as photo,(select fName from member where barcodeId=tp.barcodeId) as fName from tourPlayer tp where ttId="
													+ mtid + " and tourId=" + request.getParameter("tourId") + ";");
									int count = 0;
									rs.last();
									count = rs.getRow();
									System.out.println(count);
									rs.beforeFirst();
									if (count > 0) {
										
							%>

							<div id="myCarousel1"
								class="col-md-4 col-xs-12 col-sm-12 carousel slide"
								data-ride="carousel1"
								style="margin-left: -1.3%; width: 30%; height: 200px;">
								<div class="carousel-inner center">
									<%
										if (count >= 2) {
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null)
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item active player-images-side">
										<img src="../<%=photo%>" alt="First Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
														if (rs.getString("photo") == null)
															photo = "images/default_tour_logo.png";
														else
															photo = rs.getString("photo");
									%>
									<div class="item player-images-side">


										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										}
									%>
								</div>

							</div>

							<!-- SECOND CAROUSEL -->
							<%
								rs.beforeFirst();
							%>

							<div id="myCarousel2"
								class="col-md-4 col-xs-12 col-sm-12 carousel slide "
								data-ride="carousel2"
								style="width: 41.3%; height: 300px; margin-top: -1%;">
								<div class="carousel-inner center">
									<%
										if (count >= 2) {
													if (rs.next()) {
														if (rs.getString("photo") == null)
															photo = "images/default_tour_logo.png";
														else
															photo = rs.getString("photo");
									%>

									<div class="item player-images">
										<img src="../<%=photo%>" alt="First Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
												}
									%>
									<%
										if (rs.next()) {
													if (rs.getString("photo") == null)
														photo = "images/default_tour_logo.png";
													else
														photo = rs.getString("photo");
									%>
									<div class="item active player-images">
										<img src="../<%=photo%>" alt="Second Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>


									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
													if (rs.getString("photo") == null)
														photo = "images/default_tour_logo.png";
													else
														photo = rs.getString("photo");
									%>
									<div class="item player-images">

										<img src="../<%=photo%>" alt="Third Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>


								</div>
								<!-- Carousel controls -->
								<a class="carousel-control left" href="#myCarousel2"
									data-slide="prev" onclick="prev();"
									style="float: left; margin-left: 0%; margin-top: 20%;"> <span
									class="glyphicon glyphicon-chevron-left"
									style="margin-top: 100%;"></span>
								</a> <a class="carousel-control right" href="#myCarousel2"
									data-slide="next" onclick="next();"
									style="float: right; margin-right: 0%; margin-top: 20%;"> <span
									class="glyphicon glyphicon-chevron-right"
									style="margin-top: 100%;"></span>
								</a>
							</div>


							<!-- THIRD CAROUSEL -->
							<div id="myCarousel3" class="col-md-4 carousel slide"
								data-ride="carousel3"
								style="float: right; margin-right: -2%; width: 32%; height: 200px;">
								<%
									rs.beforeFirst();

											if (rs.next()) {
												if (rs.getString("photo") == null)
													photo = "images/default_tour_logo.png";
												else
													photo = rs.getString("photo");
								%>

								<div class="carousel-inner center">
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="First Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null)
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null)
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item active player-images-side">

										<img src="../<%=photo%>" alt="Third Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
											if (rs.getString("photo") == null)
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>

								</div>
							</div>
							<%
								} else {
							%>NO PLAYER<%
								}
						
							%>
						</div>
					</div>
				</div>
				<!-- WOMENS -->
				<!-- ----------------------------------------------------------------------- -->
			 <div class="row">
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center"><h4>PLAYER
							LIST - FEMALE</h4></div>
						<div class="panel-body tournext-panel-body" style="height:320px;">
							<%
							try
							{
								count = 0;
									photo = "";
									rs = null;
									rs = DBManager.fetchQuery(
											"select barcodeId,(select SUBSTRING_INDEX(photo,'/',-3) from member where barcodeId = tp.barcodeId ) as photo,(select fName from member where barcodeId=tp.barcodeId) as fName from tourPlayer tp where ttId="
													+ ftid + " and tourId=" + request.getParameter("tourId") + ";");
									if(rs.last())
									count = rs.getRow();
									rs.beforeFirst();
									if (count > 0) {
										
							%>

							<div id="myCarousel4"
								class="col-md-4 col-xs-12 col-sm-12 carousel slide"
								data-ride="carousel4"
								style="margin-left: -1.3%; width: 30%; height: 200px;">
								<div class="carousel-inner center">
									<%
										if (count >= 2) {
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
								
									%>
									<div class="item active player-images-side">
										<img src="../<%=photo%>" alt="First Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images-side">


										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										}
									%>
								</div>

							</div>

							<!-- SECOND CAROUSEL -->
							<%
								rs.beforeFirst();
							%>

							<div id="myCarousel5"
								class="col-md-4 col-xs-12 col-sm-12 carousel slide "
								data-ride="carousel5"
								style="width: 41.3%; height: 300px; margin-top: -1%;">
								<div class="carousel-inner center">
									<%
										if (count >= 2) {
													if (rs.next()) {
														if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
															photo = "images/default_tour_logo.png";
														else
															photo = rs.getString("photo");
									%>

									<div class="item player-images">
										<img src="../<%=photo%>" alt="First Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
												}
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item active player-images">
										<img src="../<%=photo%>" alt="Second Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>


									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images">

										<img src="../<%=photo%>" alt="Third Slide"
											style="width: 280px; height: 241px; margin-top: -2%;">
										<span style="text-align: center;" class="second-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>


								</div>
								<!-- Carousel controls -->
								<a class="carousel-control left" href="#myCarousel5" data-slide="prev" onclick="woprev();" style="float:left;margin-left:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-left" style="margin-top:100%;"></span>
		        </a>
		        <a class="carousel-control right" href="#myCarousel5" data-slide="next" onclick="wonext();" style="float:right;margin-right:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-right" style="margin-top:100%;"></span>
		        </a>
							</div>


							<!-- THIRD CAROUSEL -->
							<div id="myCarousel6" class="col-md-4 carousel slide"
								data-ride="carousel6"
								style="float: right; margin-right: -2%; width: 32%; height: 200px;">
								<%
									rs.beforeFirst();

											if (rs.next()) {
												if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
													photo = "images/default_tour_logo.png";
												else
													photo = rs.getString("photo");
								%>

								<div class="carousel-inner center">
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="First Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										if (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item active player-images-side">

										<img src="../<%=photo%>" alt="Third Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>
									<%
										while (rs.next()) {
											if (rs.getString("photo") == null || rs.getString("photo").equalsIgnoreCase(""))
												photo = "images/default_tour_logo.png";
											else
												photo = rs.getString("photo");
									%>
									<div class="item player-images-side">

										<img src="../<%=photo%>" alt="Second Slide"
											style="height: 160px; width: 200px;"> <span
											style="text-align: center;" class="side-carousel-name"><%=rs.getString("fName")%></span>
									</div>
									<%
										}
									%>

								</div>
							</div>
							<%
								}
									else {
							%>NO PLAYER<%
								}
							} catch (Exception e) {
								System.out.println("Error fff : "+e);
							}
							%>
						</div>
					</div>
				</div>  
			</div>
		</div>
	</div>

	<%
		} catch (Exception e) {
			e.getMessage();
		}
	%>
</body>
</html>