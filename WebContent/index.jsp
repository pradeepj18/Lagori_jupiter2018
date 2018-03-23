<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<title>Lagori | Official Website</title>
<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css?family=Raleway:500,600,700,800,900,400,300"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,900,300italic,400italic"
	rel="stylesheet" type="text/css">
<!-- Bootstrap -->
<link href="css1/bootstrap.min.css" rel="stylesheet">

<!-- Owl Carousel Assets -->
<link href="css1/owl.carousel.css" rel="stylesheet">
<link href="css1/owl.theme.css" rel="stylesheet">


<!-- Pixeden Icon Font -->
<link rel="stylesheet" href="css1/Pe-icon-7-stroke.css">
<!-- PrettyPhoto -->
<link href="css1/prettyPhoto.css" rel="stylesheet">

<!-- Favicon -->
<link rel="shortcut icon" type="image/x-icon" href="favicon.ico" />

<!-- Style -->
<link href="css1/style.css" rel="stylesheet">

<link href="css1/animate.css" rel="stylesheet">
<!-- Responsive CSS -->
<link href="css1/responsive.css" rel="stylesheet">
<style type="text/css">
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
</style>
</head>

<body>
	<%
		try {
			ResultSet rs = null;
			boolean Mflag = false, Fflag = false;
			int tourId = 1;//Integer.parseInt(request.getParameter("tourId"));
			DBManager.loadDriver();
	%>
	<!-- PRELOADER -->
	<!--  <div class="spn_hol">
        <div class="spinner">
            <div class="bounce1"></div>
            <div class="bounce2"></div>
            <div class="bounce3"></div>
        </div>
    </div>  -->

	<!-- END PRELOADER -->

	<!-- =========================
     START ABOUT US SECTION
============================== -->
	<section class="header parallax home-parallax page" id="HOME">
		<h2></h2>
		<div class="section_overlay">
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<div class="navbar-header">
						<button type="button" class="navbar-toggle collapsed"
							data-toggle="collapse"
							data-target="#bs-example-navbar-collapse-1">
							<span class="sr-only">Toggle navigation</span> <span
								class="icon-bar"></span> <span class="icon-bar"></span> <span
								class="icon-bar"></span>
						</button>
						<a class="navbar-brand" href="#"> <img src="images1/logo.png"
							alt="Logo">
						</a>
					</div>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse"
						id="bs-example-navbar-collapse-1">
						<ul class="nav navbar-nav navbar-right">
							<!-- NAV -->
							<li><a href="#HOME">HOME</a></li>
							<li><a href="#ABOUT">LIVE UPDATE </a></li>
							<li><a href="#match_summary">SUMMARY </a></li>
							<li><a href="#FEATURES">POINT TABLE</a></li>
							<li><a href="#SCREENS">GALLARY</a></li>
							<li><a href="#CONTACT">CONTACT </a></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container- -->
			</nav>

			<div class="container home-container">
				<div class="row">
					<div class="col-md-12">
						<div class="logo text-center">
							<!-- LOGO -->
							<img src="images1/logo.png" alt="">
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8 col-sm-8">
						<div class="home_text">
							<!-- TITLE AND DESC -->
							<h1 style="color: #00a8ff">
								Dedicated to <a
									href="https://www.facebook.com/santosh.gurav.7127"
									style="color: white"> Late Santosh Gurav</a>
							</h1>
							<p>on his Birthday</p>

							<div class="download-btn">
								<!-- BUTTON -->
								<!-- <a class="btn home-btn wow fadeInLeft" href="#DOWNLOAD">Download</a> -->
								<a class="btn home-btn wow fadeInLeft" href="#ABOUT">Let's
									Play <i class="fa fa-angle-down"></i>
								</a>
							</div>
						</div>
					</div>
					<div class="col-md-3 col-md-offset-1 col-sm-4">
						<div class="home-iphone">
							<img src="images1/iPhone_Home.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- END HEADER SECTION -->




	<!-- =========================
     START ABOUT US SECTION
============================== -->

	<%-- <section class="about page" id="ABOUT">
		<div class="container">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<!-- ABOUT US SECTION TITLE-->
					<div class="section_title">
						<h2>Live Update</h2>
						<p>
							<%
								
								ResultSet tourName = DBManager.fetchQuery("select tourName from tournament where tourId=" + tourId);
									if(tourName.next()){
								%>
							<%=tourName.getString("tourName")%>
							<%} %>
						</p>
					</div>
				</div>

			</div>
		</div>
		<div class="inner_about_area">
			<div class="container">
				<div class="row">
					<div id="livescore"></div>
				</div>
			</div>
		</div>
	</section>  --%>
	<section id="match_summary" class="about page">
		<div class="container">
			<div class="row">
				<%
					ResultSet tourName = DBManager
								.fetchQuery("select tourName,tourVenue from tournament where tourId=" + tourId);
						if (tourName.next()) {
				%>

				<div class="section_title">
					<h2><%=tourName.getString("tourName")%><br>
						<br>
						<%=tourName.getString("tourVenue")%></h2>
				</div>

				<%
					}
				%>
			</div>
			<div class="row" style="margin-top:-5%;">

				<div class="section_title">
					<h2>MATCH SUMMARY</h2>
				</div>
			</div>
			<div class="row">
				<div class="col-md-6 col-xs-12 col-sm-12">
					<div class="panel-group">
						<div class="panel panel-primary">
							<div class="panel-heading"
								style="font-weight: 800; text-align: center; font-size: 12pt;">
								<h5 style="font-size: 16pt;">MATCH SUMMARY - MALE</h5>
							</div>

							<div class="panel-body"
								style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
								<%
									String tname1 = "", tname2 = "";
										int count[] = null;
										int tid1[] = null;
										int tid2[] = null;
										String gender[] = null;
										String mtype[]=null;
										rs = null;
										int i = 0;
										rs = null;
										ResultSet rs1 = null;
										rs = DBManager.fetchQuery(
												"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
														+ tourId
														+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
														+ tourId
														+ ") as tname2,gender,mtype,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from wmatch pm where Flag='2' and tourId="
														+ tourId + " and gender='M' order by mid desc");

										if (rs.last()) {
											count = new int[rs.getRow()];
											tid1 = new int[rs.getRow()];
											tid2 = new int[rs.getRow()];
											gender = new String[rs.getRow()];
											mtype=new String[rs.getRow()];
											rs.beforeFirst();
											while (rs.next()) {
												count[i] = rs.getInt("mid");
												gender[i] = rs.getString("gender");
												tid1[i] = rs.getInt("tid1");
												tid2[i] = rs.getInt("tid2");
												mtype[i]=rs.getString("mtype");
												i = i + 1;
											}
											rs.beforeFirst();
										}
										if (count == null || count.length == 0) {
								%>
								<div class="item active">
									<span
										style="background-color: rgb(255, 255, 255); font-size: 24px; margin-top: 1%;">NO
										MATCH PLAYED</span>

								</div>
								<%
									} else {
											for (i = 0; i < count.length; i++) {
								%>
<div class="row">
<div class="col-md-12 col-xs-12">
<span
									style="float:left; color: #428bca; font-weight: 700;">
									MATCH NO - <%=count[i]%></span>
									
									<span
									style="float:right; color: #428bca; font-weight: 700;">
									<%=mtype[i].toUpperCase()%> MATCH</span>
</div>
</div>
								

								<%
									rs1 = null;
												rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[i]
														+ " and ttId=" + tid1[i] + " and tourId = " + tourId
														+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[i]
														+ " and ttId=" + tid2[i] + " and tourId = " + tourId
														+ " group by ttId) as score2  from wmatch w where mid=" + count[i] + " and gender ='"
														+ gender[i] + "';");
												if (rs1.next()) {
								%>
								<div class="row">

									<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
										style="text-align: center;">
										<span
											style="margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
										style="text-align: center;">
										<span
											style="text-align: center; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>

								</div>


								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
												rs1 = DBManager.fetchQuery(
														"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																+ tid1[i] + " and tourId=" + tourId
																+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																+ tid2[i] + " and tourId=" + tourId + ") as tname2 from tourTeam tt;");
												if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-6 col-xs-6 col-sm-6"
										style="background-color: rgb(255, 255, 255); height: 30px; text-align: center;">

										<span
											style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap; text-align: center;"><%=rs1.getString("tname1")%></span>

									</div>

									<div class="col-md-6 col-xs-6 col-sm-6"
										style="background-color: rgb(255, 255, 255); height: 30px; text-align: center;">

										<span
											style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap; text-align: center;"><%=rs1.getString("tname2")%></span>
									</div>

								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->
								<!-- <hr style="border-top: 1px solid blue;"> -->
								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">

									<div class="col-md-12 col-xs-12 col-sm-12">

										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;

															rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																	+ count[i] + " and turn=" + tid1[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[i]
																	+ " and turn=" + tid2[i] + " and tourId=" + tourId + ") as count2 from tourWicket;");
															if (rs1.next()) {
											%>

											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">WICKET</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">WICKET</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<%
												}
											%>

										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																	+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i] + " and ttId="
																	+ tid2[i] + " and tourId=" + tourId + ") as count2 from tourHit;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>

										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																	+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[i]
																	+ " and ttId=" + tid2[i] + " and tourId=" + tourId + ") as count2 from tourMiss;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">MISS</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">MISS</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																	+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId=" + tourId
																	+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[i] + " and ttId="
																	+ tid2[i] + " and rtype='6' and tourId=" + tourId + ") as count2 from tourRestore;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 13px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>


											<%
												}
											%>

										</div>
										<!-- END GOLDEN -->
									</div>
								</div>
								<div class="row" style="margin-top: 10px;">
									<div class="col-sm-12 col-xs-12 col-md-12"
										style="text-align: center;">

										<%
											ResultSet rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='1'");
														ResultSet rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='2'");
														ResultSet rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='3'");
														ResultSet rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='4'");
														ResultSet rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='5'");
														ResultSet rsscore6 = DBManager
																.fetchQuery("select count(rno) as score from tourRestore where mid=" + count[i]
																		+ " and tourId=" + tourId + " and ttId=" + tid1[i] + " and rtype='6'");

														ResultSet rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count[i] + " and tourId=" + tourId + " and turn=" + tid1[i] + " and wtype='1'");
														ResultSet rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count[i] + " and tourId=" + tourId + " and turn=" + tid1[i] + " and wtype='2'");
														ResultSet rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count[i] + " and tourId=" + tourId + " and turn=" + tid1[i] + " and wtype='3'");
														ResultSet rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count[i] + " and tourId=" + tourId + " and turn=" + tid1[i] + " and wtype='4'");
														ResultSet rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count[i] + " and tourId=" + tourId + " and turn=" + tid1[i] + " and wtype='5'");

														int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

														for (int iii = 0; iii < 12; iii++) {
															if (rsscore1.next())
																count1 = count1 + rsscore1.getInt("score");
															if (rsscore2.next())
																count2 = count2 + rsscore2.getInt("score");
															if (rsscore3.next())
																count3 = count3 + rsscore3.getInt("score");
															if (rsscore4.next())
																count4 = count4 + rsscore4.getInt("score");
															if (rsscore5.next())
																count5 = count5 + rsscore5.getInt("score");

														}

														if (rswicket1.next()) {
															count1 = count1 - (rswicket1.getInt("count(wno)") * 5);
															if (count1 < 0) {
																count1 = 0;
															}
															rswicket1.beforeFirst();
														}
														if (rswicket2.next()) {
															count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
															if (count2 < 0) {
																count2 = 0;
															}
															rswicket2.beforeFirst();
														}
														if (rswicket3.next()) {
															count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
															if (count3 < 0) {
																count3 = 0;
															}
															rswicket3.beforeFirst();
														}
														if (rswicket4.next()) {
															count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
															if (count4 < 0) {
																count4 = 0;
															}
															rswicket4.beforeFirst();
														}
														if (rswicket5.next()) {
															count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
															if (count5 < 0) {
																count5 = 0;
															}
															rswicket5.beforeFirst();
														}
														int golden1 = 0;
														if (rsscore6.next()) {
															golden1 = rsscore6.getInt("score");
														}

														rsscore1 = null;
														rsscore2 = null;
														rsscore3 = null;
														rsscore4 = null;
														rsscore5 = null;
														rsscore6 = null;
														rswicket1 = null;
														rswicket2 = null;
														rswicket3 = null;
														rswicket4 = null;
														rswicket5 = null;
														rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='1'");
														rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='2'");
														rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='3'");
														rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='4'");
														rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + count[i]
																+ " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='5'");
														rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid="
																+ count[i] + " and tourId=" + tourId + " and ttId=" + tid2[i] + " and rtype='6'");

														rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count[i]
																+ " and tourId=" + tourId + " and turn=" + tid2[i] + " and wtype='1'");
														rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count[i]
																+ " and tourId=" + tourId + " and turn=" + tid2[i] + " and wtype='2'");
														rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count[i]
																+ " and tourId=" + tourId + " and turn=" + tid2[i] + " and wtype='3'");
														rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count[i]
																+ " and tourId=" + tourId + " and turn=" + tid2[i] + " and wtype='4'");
														rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count[i]
																+ " and tourId=" + tourId + " and turn=" + tid2[i] + " and wtype='5'");

														int countB1 = 0, countB2 = 0, countB3 = 0, countB4 = 0, countB5 = 0;
														for (int ii = 0; ii < 12; ii++) {
															if (rsscore1.next()) {
																countB1 = countB1 + rsscore1.getInt("score");
															}
															if (rsscore2.next()) {
																countB2 = countB2 + rsscore2.getInt("score");
															}
															if (rsscore3.next()) {
																countB3 = countB3 + rsscore3.getInt("score");
															}
															if (rsscore4.next()) {
																countB4 = countB4 + rsscore4.getInt("score");
															}
															if (rsscore5.next()) {
																countB5 = countB5 + rsscore5.getInt("score");
															}
														}
														rsscore1.beforeFirst();
														rsscore2.beforeFirst();
														rsscore3.beforeFirst();
														rsscore4.beforeFirst();
														rsscore5.beforeFirst();
														if (rswicket1.next()) {
															countB1 = countB1 - (rswicket1.getInt("count(wno)") * 5);
															if (countB1 < 0) {
																countB1 = 0;
															}
															rswicket1.beforeFirst();
														}
														if (rswicket2.next()) {
															countB2 = countB2 - (rswicket2.getInt("count(wno)") * 5);
															if (countB2 < 0) {
																countB2 = 0;
															}
															rswicket2.beforeFirst();
														}
														if (rswicket3.next()) {
															countB3 = countB3 - (rswicket3.getInt("count(wno)") * 5);
															if (countB3 < 0) {
																countB3 = 0;
															}
															rswicket3.beforeFirst();
														}
														if (rswicket4.next()) {
															countB4 = countB4 - (rswicket4.getInt("count(wno)") * 5);
															if (countB4 < 0) {
																countB4 = 0;
															}
															rswicket4.beforeFirst();
														}
														if (rswicket5.next()) {
															countB5 = countB5 - (rswicket5.getInt("count(wno)") * 5);
															if (count5 < 0) {
																countB5 = 0;
															}
															rswicket5.beforeFirst();
														}
														int setwonA = 0, setwonB = 0;
														if (count1 > countB1) {
															setwonA = setwonA + 1;
														} else if (count1 < countB1) {
															setwonB = setwonB + 1;
														}
														if (count2 > countB2) {
															setwonA = setwonA + 1;
														} else if (count2 < countB2) {
															setwonB = setwonB + 1;
														}
														if (count3 > countB3) {
															setwonA = setwonA + 1;
														} else if (count3 < countB3) {
															setwonB = setwonB + 1;
														}
														if (count4 > countB4) {
															setwonA = setwonA + 1;
														} else if (count4 < countB4) {
															setwonB = setwonB + 1;
														}
														if (count5 > countB5) {
															setwonA = setwonA + 1;
														} else if (count5 < countB5) {
															setwonB = setwonB + 1;
														}

														//GOLDEN HIT FOR TEAM 2
														int golden2 = 0;
														if (rsscore6.next()) {
															golden2 = rsscore6.getInt("score");
														}

														ResultSet rswon = DBManager.fetchQuery(
																"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																		+ tid1[i] + " and tourId=" + tourId
																		+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																		+ tid2[i] + " and tourId=" + tourId + ") as tname2 from tourTeam tt;");
														if (rswon.next()) {
															/* System.out.println("+++"+rswon.getString("tname1"));
															System.out.println("---"+rswon.getString("tname2")) */;
															tname1 = rswon.getString("tname1");
															tname2 = rswon.getString("tname2");
														}
														String won = null;
														if (setwonA > setwonB) {
															won = tname1;
														} else if (setwonA < setwonB) {
															won = tname2;
														} else {
															if (golden1 > golden2) {
																won = tname1;
															} else if (golden1 < golden2) {
																won = tname2;
															} else {
																won = "DRAW";
															}
														}
										%>

										<h3 style="color:#428bca">
											MATCH WON BY -
											<%=won%></h3>
									</div>
								</div>
								<br>
								<hr style="border-top: 2px solid #428bca;">
								<!-- END THIRD ROW -->


								<%
									}
										}
								%>
							</div>
						</div>
					</div>
				</div>

				<!-------------------------FEMALE MATCH SUMMARY START-------------------  -->
				<div class="col-md-6 col-xs-12 col-sm-12">
					<div class="panel-group">
						<div class="panel panel-primary">
							<div class="panel-heading"
								style="font-weight: 800; text-align: center; font-size: 12pt;">
								<h5 style="font-size: 16pt;">MATCH SUMMARY - FEMALE</h5>
							</div>
							<div class="panel-body"
								style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
								<%
									int count1[] = null;
										int tid11[] = null;
										int tid21[] = null;
										String gender1[] = null;
										String mtype1[]=null;
										rs = null;
										i = 0;
										rs1 = null;

										rs = DBManager.fetchQuery(
												"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
														+ tourId
														+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
														+ tourId
														+ ") as tname2,gender,mtype,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from wmatch pm where  Flag='2' and tourId="
														+ tourId + " and gender='F' order by mid desc;");

										if (rs.last()) {
											count1 = new int[rs.getRow()];
											tid11 = new int[rs.getRow()];
											tid21 = new int[rs.getRow()];
											gender1 = new String[rs.getRow()];
											mtype1=new String[rs.getRow()];
											rs.beforeFirst();
											while (rs.next()) {
												count1[i] = rs.getInt("mid");
												gender1[i] = rs.getString("gender");
												tid11[i] = rs.getInt("tid1");
												tid21[i] = rs.getInt("tid2");
												mtype1[i]=rs.getString("mtype");
												i = i + 1;
											}
											rs.beforeFirst();
										}
										if (count1 == null || count1.length == 0) {
								%>
								<div class="item active">
									<span
										style="background-color: rgb(255, 255, 255); font-size: 24px; margin-top: 1%;">NO
										MATCH PLAYED</span>

								</div>
								<%
									} else {

											for (i = 0; i < count1.length; i++) {
								%>

								<div class="row">
<div class="col-md-12 col-xs-12">
<span
									style="float:left; color: #428bca; font-weight: 700;">
									MATCH NO - <%=count[i]%></span>
									
									<span
									style="float:right; color: #428bca; font-weight: 700;">
									<%=mtype1[i].toUpperCase()%> MATCH</span>
</div>
</div>
								<%
									rs1 = null;
												rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid="
														+ count1[i] + " and ttId=" + tid11[i] + " and tourId = " + tourId
														+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count1[i]
														+ " and ttId=" + tid21[i] + " and tourId = " + tourId
														+ " group by ttId) as score2  from wmatch w where mid=" + count1[i] + " and gender ='"
														+ gender1[i] + "';");
												if (rs1.next()) {
								%>
								<div class="row">

									<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
										style="text-align: center;">
										<span
											style="margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score1")%>
										</span>
									</div>
									<div class="col-md-6 col-xs-6 col-sm-6 col-lg-6"
										style="text-align: center;">
										<span
											style="text-align: center; margin-top: 2%; font-size: 78px; font-weight: 700;">
											<%=rs1.getInt("score2")%>
										</span>
									</div>

								</div>


								<%
									}
								%>
								<!-- SECOND ROW -->
								<%
									rs1 = null;
												rs1 = DBManager.fetchQuery(
														"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																+ tid11[i] + " and tourId=" + tourId
																+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																+ tid21[i] + " and tourId=" + tourId + ") as tname2 from tourTeam tt;");
												if (rs1.next()) {
								%>
								<div class="row" style="margin-top: 1%;">
									<div class="col-md-6 col-xs-6 col-sm-6"
										style="background-color: rgb(255, 255, 255); height: 30px; text-align: center;">

										<span
											style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap; text-align: center;"><%=rs1.getString("tname1")%></span>

									</div>

									<div class="col-md-6 col-xs-6 col-sm-6"
										style="background-color: rgb(255, 255, 255); height: 30px; text-align: center;">

										<span
											style="font-size: 18px; font-family: initial; font-weight: 700; line-height: 29px; white-space: nowrap; text-align: center;"><%=rs1.getString("tname2")%></span>
									</div>

								</div>
								<%
									}
								%>
								<!-- END SECOND ROW -->
								<!-- <hr style="border-top: 1px solid blue;"> -->
								<!-- THIRD ROW -->
								<div class="row" style="margin-top: 10px;">

									<div class="col-md-12 col-xs-12 col-sm-12">

										<!-- FOR WICKET -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;

															rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																	+ count1[i] + " and turn=" + tid11[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count1[i]
																	+ " and turn=" + tid21[i] + " and tourId=" + tourId + ") as count2 from tourWicket;");
															if (rs1.next()) {
											%>

											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">WICKET</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">WICKET</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<%
												}
											%>

										</div>
										<!-- END WICKET -->

										<!-- FOR HIT -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																	+ count1[i] + " and ttId=" + tid11[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count1[i]
																	+ " and ttId=" + tid21[i] + " and tourId=" + tourId + ") as count2 from tourHit;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>

										</div>
										<!-- END HIT -->

										<!-- FOR MISS -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center;">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																	+ count1[i] + " and ttId=" + tid11[i] + " and tourId=" + tourId
																	+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count1[i]
																	+ " and ttId=" + tid21[i] + " and tourId=" + tourId + ") as count2 from tourMiss;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">MISS</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">MISS</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>

											<%
												}
											%>
										</div>
										<!-- END MISS -->

										<!-- FOR GOLDEN -->
										<div class="row"
											style="margin-top: 0.5%; background-color: #fff; text-align: center">

											<%
												rs1 = null;
															rs1 = DBManager.fetchQuery("select distinct(select count(rno) from tourRestore th where mid="
																	+ count1[i] + " and ttId=" + tid11[i] + " and rtype='6' and tourId=" + tourId
																	+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count1[i]
																	+ " and ttId=" + tid21[i] + " and rtype='6' and tourId=" + tourId
																	+ ") as count2 from tourRestore;");
															if (rs1.next()) {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count1")%></span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 15px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;"><%=rs1.getInt("count2")%></span>
											</div>

											<%
												} else {
											%>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-weight: 700; font-size: 13px;">GOLDEN
													HIT</span>
											</div>
											<div class="col-md-4 col-xs-4 col-sm-4">
												<span style="font-size: 24px;">0</span>
											</div>


											<%
												}
											%>

										</div>
										<!-- END GOLDEN -->
									</div>
								</div>
								<div class="row" style="margin-top: 10px;">
									<div class="col-sm-12 col-xs-12 col-md-12"
										style="text-align: center;">

										<%
											ResultSet rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='1'");
														ResultSet rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='2'");
														ResultSet rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='3'");
														ResultSet rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='4'");
														ResultSet rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='5'");
														ResultSet rsscore6 = DBManager
																.fetchQuery("select count(rno) as score from tourRestore where mid=" + count1[i]
																		+ " and tourId=" + tourId + " and ttId=" + tid11[i] + " and rtype='6'");

														ResultSet rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count1[i] + " and tourId=" + tourId + " and turn=" + tid11[i] + " and wtype='1'");
														ResultSet rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count1[i] + " and tourId=" + tourId + " and turn=" + tid11[i] + " and wtype='2'");
														ResultSet rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count1[i] + " and tourId=" + tourId + " and turn=" + tid11[i] + " and wtype='3'");
														ResultSet rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count1[i] + " and tourId=" + tourId + " and turn=" + tid11[i] + " and wtype='4'");
														ResultSet rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
																+ count1[i] + " and tourId=" + tourId + " and turn=" + tid11[i] + " and wtype='5'");

														int count11 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

														for (int iii = 0; iii < 12; iii++) {
															if (rsscore1.next())
																count11 = count11 + rsscore1.getInt("score");
															if (rsscore2.next())
																count2 = count2 + rsscore2.getInt("score");
															if (rsscore3.next())
																count3 = count3 + rsscore3.getInt("score");
															if (rsscore4.next())
																count4 = count4 + rsscore4.getInt("score");
															if (rsscore5.next())
																count5 = count5 + rsscore5.getInt("score");

														}

														if (rswicket1.next()) {
															count11 = count11 - (rswicket1.getInt("count(wno)") * 5);
															if (count11 < 0) {
																count11 = 0;
															}
															rswicket1.beforeFirst();
														}
														if (rswicket2.next()) {
															count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
															if (count2 < 0) {
																count2 = 0;
															}
															rswicket2.beforeFirst();
														}
														if (rswicket3.next()) {
															count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
															if (count3 < 0) {
																count3 = 0;
															}
															rswicket3.beforeFirst();
														}
														if (rswicket4.next()) {
															count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
															if (count4 < 0) {
																count4 = 0;
															}
															rswicket4.beforeFirst();
														}
														if (rswicket5.next()) {
															count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
															if (count5 < 0) {
																count5 = 0;
															}
															rswicket5.beforeFirst();
														}
														int golden1 = 0;
														if (rsscore6.next()) {
															golden1 = rsscore6.getInt("score");
														}

														rsscore1 = null;
														rsscore2 = null;
														rsscore3 = null;
														rsscore4 = null;
														rsscore5 = null;
														rsscore6 = null;
														rswicket1 = null;
														rswicket2 = null;
														rswicket3 = null;
														rswicket4 = null;
														rswicket5 = null;
														rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='1'");
														rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='2'");
														rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='3'");
														rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='4'");
														rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + count1[i]
																+ " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='5'");
														rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid="
																+ count1[i] + " and tourId=" + tourId + " and ttId=" + tid21[i] + " and rtype='6'");

														rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count1[i]
																+ " and tourId=" + tourId + " and turn=" + tid21[i] + " and wtype='1'");
														rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count1[i]
																+ " and tourId=" + tourId + " and turn=" + tid21[i] + " and wtype='2'");
														rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count1[i]
																+ " and tourId=" + tourId + " and turn=" + tid21[i] + " and wtype='3'");
														rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count1[i]
																+ " and tourId=" + tourId + " and turn=" + tid21[i] + " and wtype='4'");
														rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + count1[i]
																+ " and tourId=" + tourId + " and turn=" + tid21[i] + " and wtype='5'");

														int countB1 = 0, countB2 = 0, countB3 = 0, countB4 = 0, countB5 = 0;
														for (int ii = 0; ii < 12; ii++) {
															if (rsscore1.next()) {
																countB1 = countB1 + rsscore1.getInt("score");
															}
															if (rsscore2.next()) {
																countB2 = countB2 + rsscore2.getInt("score");
															}
															if (rsscore3.next()) {
																countB3 = countB3 + rsscore3.getInt("score");
															}
															if (rsscore4.next()) {
																countB4 = countB4 + rsscore4.getInt("score");
															}
															if (rsscore5.next()) {
																countB5 = countB5 + rsscore5.getInt("score");
															}
														}
														rsscore1.beforeFirst();
														rsscore2.beforeFirst();
														rsscore3.beforeFirst();
														rsscore4.beforeFirst();
														rsscore5.beforeFirst();
														if (rswicket1.next()) {
															countB1 = countB1 - (rswicket1.getInt("count(wno)") * 5);
															if (countB1 < 0) {
																countB1 = 0;
															}
															rswicket1.beforeFirst();
														}
														if (rswicket2.next()) {
															countB2 = countB2 - (rswicket2.getInt("count(wno)") * 5);
															if (countB2 < 0) {
																countB2 = 0;
															}
															rswicket2.beforeFirst();
														}
														if (rswicket3.next()) {
															countB3 = countB3 - (rswicket3.getInt("count(wno)") * 5);
															if (countB3 < 0) {
																countB3 = 0;
															}
															rswicket3.beforeFirst();
														}
														if (rswicket4.next()) {
															countB4 = countB4 - (rswicket4.getInt("count(wno)") * 5);
															if (countB4 < 0) {
																countB4 = 0;
															}
															rswicket4.beforeFirst();
														}
														if (rswicket5.next()) {
															countB5 = countB5 - (rswicket5.getInt("count(wno)") * 5);
															if (count5 < 0) {
																countB5 = 0;
															}
															rswicket5.beforeFirst();
														}
														int setwonA = 0, setwonB = 0;
														if (count11 > countB1) {
															setwonA = setwonA + 1;
														} else if (count11 < countB1) {
															setwonB = setwonB + 1;
														}
														if (count2 > countB2) {
															setwonA = setwonA + 1;
														} else if (count2 < countB2) {
															setwonB = setwonB + 1;
														}
														if (count3 > countB3) {
															setwonA = setwonA + 1;
														} else if (count3 < countB3) {
															setwonB = setwonB + 1;
														}
														if (count4 > countB4) {
															setwonA = setwonA + 1;
														} else if (count4 < countB4) {
															setwonB = setwonB + 1;
														}
														if (count5 > countB5) {
															setwonA = setwonA + 1;
														} else if (count5 < countB5) {
															setwonB = setwonB + 1;
														}

														//GOLDEN HIT FOR TEAM 2
														int golden2 = 0;
														if (rsscore6.next()) {
															golden2 = rsscore6.getInt("score");
														}

														ResultSet rswon = DBManager.fetchQuery(
																"select distinct(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																		+ tid11[i] + " and tourId=" + tourId
																		+ ") as tname1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="
																		+ tid21[i] + " and tourId=" + tourId + ") as tname2 from tourTeam tt;");
														if (rswon.next()) {
															/* System.out.println("+++"+rswon.getString("tname1"));
															System.out.println("---"+rswon.getString("tname2")) */;
															tname1 = rswon.getString("tname1");
															tname2 = rswon.getString("tname2");
														}
														String won = null;
														if (setwonA > setwonB) {
															won = tname1;
														} else if (setwonA < setwonB) {
															won = tname2;
														} else {
															if (golden1 > golden2) {
																won = tname1;
															} else if (golden1 < golden2) {
																won = tname2;
															} else {
																won = "DRAW";
															}
														}
										%>

										<h3 style="color:#428bca">
											MATCH WON BY -
											<%=won%></h3>
									</div>
								</div>
								<br>
								<hr style="border-top: 2px solid #428bca;">
								<!-- END THIRD ROW -->
								<%
									}
										}
								%>
							</div>
						</div>
					</div>
				</div>
				<!-- ----------------------FEMALE MATCH SUMMARY END----------------------- -->
			</div>
		</div>
	</section>
	<!-- End About Us -->








	<!-- =========================
     START FEATURES
============================== -->
	<section id="FEATURES" class="features page"
		style="background-color: #FFFFFF">
		<div class="container-fluidic">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<!-- FEATURES SECTION TITLE -->
					<div class="section_title wow fadeIn" data-wow-duration="1s">
						<h2>Fixture & Point Table</h2>

						<div class="row" style="margin-top: 3%;">
							<%
								try {
										ResultSet Mrs = DBManager.fetchQuery(
												"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId=pm.tourId) as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%d %b %y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype,pool from wmatch pm where gender='M' and tourId="
														+ tourId + ";");
										if (Mrs.next())
											Mflag = true;
										ResultSet Frs = DBManager.fetchQuery(
												"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId=pm.tourId) as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%d %b %y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype,pool from wmatch pm where gender='F' and tourId="
														+ tourId + ";");
										if (Frs.next())
											Fflag = true;

										Mrs.beforeFirst();
										Frs.beforeFirst();

										if (Mflag && !Fflag) {
							%>
							<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">FIXTURE - MALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>MATCH NO</th>
															<th>TEAM A</th>
															<th>TEAM B</th>
															<th class="hidden-xs">POOL</th>
															<th class="hidden-xs">DATE</th>
														</tr>
													</thead>
													<tbody>
														<%
															while (Mrs.next()) {
														%>
														<tr>
															<td><%=Mrs.getInt("mid")%></td>
															<td><%=Mrs.getString("tname1")%></td>
															<td><%=Mrs.getString("tname2")%></td>
															<td class="hidden-xs"><%=((char) (Mrs.getInt("pool") + 64))%></td>
															<td class="hidden-xs"><%=Mrs.getString("day")%></td>
														</tr>

														<%
															}
														%>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								} else if (!Mflag && Fflag) {
							%>
							<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">FIXTURE - FEMALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>MATCH NO</th>
															<th>TEAM A</th>
															<th>TEAM B</th>
															<th class="hidden-xs">POOL</th>
															<th class="hidden-xs">DATE</th>
														</tr>
													</thead>
													<tbody>
														<%
															while (Frs.next()) {
														%>
														<tr>
															<td><%=Frs.getInt("mid")%></td>
															<td><%=Frs.getString("tname1")%></td>
															<td><%=Frs.getString("tname2")%></td>
															<td class="hidden-xs"><%=((char) (Frs.getInt("pool") + 64))%></td>
															<td class="hidden-xs"><%=Frs.getString("day")%></td>
														</tr>

														<%
															}
														%>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								} else if (Mflag && Fflag) {
							%>
							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">FIXTURE - MALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>MATCH NO</th>
															<th>TEAM A</th>
															<th>TEAM B</th>
															<th class="hidden-xs">POOL</th>
															<th class="hidden-xs">DATE</th>
														</tr>
													</thead>
													<tbody>
														<%
															while (Mrs.next()) {
														%>
														<tr>
															<td><%=Mrs.getInt("mid")%></td>
															<td><%=Mrs.getString("tname1")%></td>
															<td><%=Mrs.getString("tname2")%></td>
															<td class="hidden-xs"><%=((char) (Mrs.getInt("pool") + 64))%></td>
															<td class="hidden-xs"><%=Mrs.getString("day")%></td>
														</tr>

														<%
															}
														%>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

							<!-- ------------------FEMALE-------------------- -->

							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">FIXTURE - FEMALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<div class="table-responsive">
												<table class="table">
													<thead>
														<tr>
															<th>MATCH NO</th>
															<th>TEAM A</th>
															<th>TEAM B</th>
															<th class="hidden-xs">POOL</th>
															<th class="hidden-xs">DATE</th>
														</tr>
													</thead>
													<tbody>
														<%
															while (Frs.next()) {
														%>
														<tr>
															<td><%=Frs.getInt("mid")%></td>
															<td><%=Frs.getString("tname1")%></td>
															<td><%=Frs.getString("tname2")%></td>
															<td class="hidden-xs"><%=((char) (Frs.getInt("pool") + 64))%></td>
															<td class="hidden-xs"><%=Frs.getString("day")%></td>
														</tr>

														<%
															}
														%>

													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- -------------------------------------- -->
							<%
								} else {
							%>
							<div class="col-md-12 col-sm-12 col-xs-12 col-lg-12">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">FIXTURE - MALE/FEMALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<div class="table-responsive">
												<h3 style="text-align: center;">
													<br>FIXTURE NOT FOUND
												</h3>
											</div>
										</div>
									</div>
								</div>
							</div>
							<%
								}
							%>
							<%
								} catch (Exception e) {
										System.out.println("Error in index.jsp fixture : " + e);
									}
							%>
						</div>
					</div>
					<!-- END FEATURES SECTION TITLE -->
				</div>
			</div>
		</div>


	</section>
	<section id="pool" class="features page"
		style="background-color: #FFFFFF">
		<div class="container">
		<div class="row">
		<div class="col-md-6 col-xs-12">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [ MALE ]</h5>
					</div>

					<div class="panel-body"
						style="height: 430px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								DBManager.loadDriver();
								int ic = 1;
							
								rs = null; rs1 = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + tourId + " and tpgender='M' group by pname;");
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
						<h4 style="text-align: center;">
							POOL -
							<%=((char) (65 + k))%></h4>
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team Name</th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
							
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+tourId+" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+tourId+" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+tourId+" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+tourId+" and tpgender='M' and pname="+(k+1)+" order by W desc;");
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
											System.out.println("++++");
											%>


								
								<% 	
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
					</div>
				</div>
			</div>
		</div>
		<!-- ------------------------------FEMALE POINT TABLE--------------------- -->
		<div class="col-md-6 col-xs-12">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [ FEMALE ]</h5>
					</div>

					<div class="panel-body"
						style="height: 431px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								DBManager.loadDriver();
								 int ic = 1;
							
								rs = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + tourId + " and tpgender='F' group by pname;");
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
						<h4 style="text-align: center;">
							POOL -
							<%=((char) (65 + k))%></h4>
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team Name</th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
								
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+tourId+" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+tourId+" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+tourId+" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+tourId+" and tpgender='F' and pname="+(k+1)+" order by W desc;");
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
										%>


										<% 	
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
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	</section>
	<!-- END FEATURES SECTION -->


	<section id="pool" class="features page"
		style="background-color: #FFFFFF">
		<div class="container-fluidic">
			<div class="row">
				<div class="col-md-10 col-md-offset-1">
					<!-- FEATURES SECTION TITLE -->
					<div class="section_title wow fadeIn" data-wow-duration="1s">
						<h2>POOLS</h2>

						<div class="row" style="margin-top: 3%;">

							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">POOL - MALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<%
												int poolCount = 0;
													int teamCount = 0;
													rs = null;
													rs1 = null;
													rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId=" + tourId
															+ " and tpgender='M' group by pname;");
													if (!rs.next())
														out.println("<br><br><center><h3>POOL NOT FOUND</h3></center>");
													rs.beforeFirst();
													boolean f = true;
													int max = 0;
													while (rs.next()) {

														if (rs.getInt("count(*)") > max)
															max = rs.getInt("count(*)");
														teamCount += rs.getInt("count(*)");
														poolCount++;
													}

													ResultSet[] rss = new ResultSet[poolCount];
											%>

											<div class="table-responsive">
												<table class="table">
													<thead>
														<%
															int ii = 0;
																for (ii = 0; ii < poolCount; ii++) {
																	out.print("  <th width=10% > POOL &#" + (ii + 65) + "</th>");

																	rss[ii] = DBManager.fetchQuery(
																			"select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="
																					+ tourId + " and tpgender='M')) as tName from tourPool tp where  tourId=" + tourId
																					+ " and tpgender='M' and pname=" + (ii + 1) + ";");
																}
														%>
													</thead>
													<tbody>

														<%
															out.println("<tr>");
																int k = 1;
																for (i = 0; i < max; i++) {
																	for (int j = 0; j < poolCount; j++) {
																		if (rss[j].next()) {
																			out.print("<td  >" + rss[j].getString("tName") + "</td>");
																		} else
																			out.println("<td></td>");
																	}
																	out.println("</tr>");
																}
														%>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-md-6 col-sm-12 col-xs-12 col-lg-6">
								<div class="panel-group">
									<div class="panel panel-primary">
										<div class="panel-heading"
											style="font-weight: 800; text-align: center; font-size: 12pt;">
											<h5 style="font-size: 16pt;">POOL - FEMALE</h5>
										</div>
										<div class="panel-body"
											style="height: 400px; overflow-y: scroll; overflow-x: hidden;">
											<%
												poolCount = 0;
													teamCount = 0;
													rs = null;
													rs1 = null;
													rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId=" + tourId
															+ " and tpgender='F' group by pname;");
													if (!rs.next())
														out.println("<br><br><center><h3>POOL NOT FOUND</h3></center>");
													rs.beforeFirst();
													f = true;
													max = 0;
													while (rs.next()) {

														if (rs.getInt("count(*)") > max)
															max = rs.getInt("count(*)");
														teamCount += rs.getInt("count(*)");
														poolCount++;
													}

													ResultSet[] rss1 = new ResultSet[poolCount];
											%>

											<div class="table-responsive">
												<table class="table">
													<thead>
														<%
															for (ii = 0; ii < poolCount; ii++) {
																	out.print("  <th width=10% > POOL &#" + (ii + 65) + "</th>");

																	rss1[ii] = DBManager.fetchQuery(
																			"select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="
																					+ tourId + " and tpgender='F')) as tName from tourPool tp where  tourId=" + tourId
																					+ " and tpgender='F' and pname=" + (ii + 1) + ";");
																}
														%>
													</thead>
													<tbody>

														<%
															out.println("<tr>");
																k = 1;
																for (i = 0; i < max; i++) {
																	for (int j = 0; j < poolCount; j++) {
																		if (rss1[j].next()) {
																			out.print("<td  >" + rss1[j].getString("tName") + "</td>");
																		} else
																			out.println("<td></td>");
																	}
																	out.println("</tr>");
																}
														%>
													</tbody>
												</table>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
					<!-- END FEATURES SECTION TITLE -->
				</div>
			</div>
		</div>
	</section>




	<!-- =========================
     START CONTCT FORM AREA
============================== -->
	<section class="contact page" id="CONTACT">
		<div class="section_overlay">
			<!-- <div class="container">
				<div class="col-md-10 col-md-offset-1 wow bounceIn">
					Start Contact Section Title
					<div class="section_title">
						<h2>Get in touch</h2>
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip.</p>
					</div>
				</div>
			</div> -->

			<div class="contact_form wow bounceIn">
				<div class="container">

					<!-- START ERROR AND SUCCESS MESSAGE -->
					<div class="form_error text-center">
						<div class="name_error hide error">Please Enter your name</div>
						<div class="email_error hide error">Please Enter your Email</div>
						<div class="email_val_error hide error">Please Enter a Valid
							Email Address</div>
						<div class="message_error hide error">Please Enter Your
							Message</div>
					</div>
					<div class="Sucess"></div>
					<!-- END ERROR AND SUCCESS MESSAGE -->

					<!-- FORM -->
					<form role="form">
						<div class="row">
							<div class="col-md-4">
								<input type="text" class="form-control" id="name"
									placeholder="Name"> <input type="email"
									class="form-control" id="email" placeholder="Email"> <input
									type="text" class="form-control" id="subject"
									placeholder="Subject">
							</div>


							<div class="col-md-8">
								<textarea class="form-control" id="message" rows="25" cols="10"
									placeholder="  Message Texts..."></textarea>
								<button type="button"
									class="btn btn-default submit-btn form_submit">SEND
									MESSAGE</button>
							</div>
						</div>
					</form>
					<!-- END FORM -->
				</div>
			</div>

			<div class="container">
				<div class="row">
					<div class="col-md-12 wow bounceInLeft">
						<div class="social_icons">
							<ul>
								<li><a href="https://www.facebook.com/lagoriworld"><i
										class="fa fa-facebook"></i></a></li>
								<li><a href="https://twitter.com/Maha_Lagori"><i
										class="fa fa-twitter"></i></a></li>
								<li><a href="https://www.instagram.com/lagoriworld_ig"><i
										class="fa fa-instagram"></i></a></li>
								<li><a href="https://www.youtube.com/user/Indialagori"><i
										class="fa fa-youtube-play"></i></a></li>
								<li><a href="https://www.lagoriworld.com"><i
										class="fa fa-globe"></i></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END CONTACT -->



	<!-- =========================
     FOOTER 
============================== -->

	<section class="copyright">
		<h2></h2>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<div class="copy_right_text">
						<!-- COPYRIGHT TEXT -->
						<p>
							Copyright &copy; 2017 <a href="http://www.lagoriworld.com/">Lagori</a>
							<span>By </span><a href="http://playsoftech.in/">Playsoftech
								Solutions</a>
						</p>
					</div>
				</div>
				<div class="col-md-5">
					<div class="copy_right_text">
						<p style="text-transform: lowercase;">
							<a href="http://playsoftech.in/">www.playsoftech.in</a> <span>Support@playsoftech.in</span>
							<span>8888500055 | 9822634552<i class="fa fa-whatsapp"
								style="font-size: 24px; color: green"></i></span>
						</p>
					</div>
				</div>

				<div class="col-md-2">
					<div class="scroll_top">
						<a href="#HOME"><i class="fa fa-angle-up"></i></a>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- END FOOTER -->


	<!-- =========================
     SCRIPTS 
============================== -->


	<script src="js1/jquery.min.js"></script>
	<script src="js1/bootstrap.min.js"></script>
	<script src="js1/owl.carousel.js"></script>
	<script src="js1/jquery.fitvids.js"></script>
	<script src="js1/smoothscroll.js"></script>
	<script src="js1/jquery.parallax-1.1.3.js"></script>
	<script src="js1/jquery.prettyPhoto.js"></script>
	<script src="js1/jquery.ajaxchimp.min.js"></script>
	<script src="js1/jquery.ajaxchimp.langs.js"></script>
	<script src="js1/wow.min.js"></script>
	<script src="js1/waypoints.min.js"></script>
	<script src="js1/jquery.counterup.min.js"></script>
	<script src="js1/script.js"></script>



	<%-- <script>
	
	var showlivescore = setInterval(
			function ()
			{
				$('#livescore').load('scoreajax.jsp?tourId=<%=tourId%>').fadeIn("slow");			
			},10000);
	
	</script> --%>
	<%
		} catch (Exception e1) {
			System.out.println("Error in index.jsp : " + e1);
		}
	%>
</body>

</html>