<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournament Home</title>
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
							<li><a href="m_addtourTeam.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M">Add Teams</a></li>
							<li><a href="m_addtourMember.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M&cate=1">Add Player</a></li>
							<li><a href="m_addtourMatch.jsp?tourId=<%=request.getParameter("tourId") %>&gen=M">Add Pool</a></li>
						</ul></li>
					<li><a href="m_selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>">SELECT MATCH</a></li>
					
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
	<br><br>
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
							rs = null;
								rs = DBManager.fetchQuery(
										"select distinct(tId),(select tName from team where tId = tt.tId) as tname,(select SUBSTRING_INDEX(tFlag,'/',-3) from team where tId = tt.tId ) as flag from tourTeam tt where tourId="
												+ request.getParameter("tourId") + " order by tname asc;");
								if(rs.next()){rs.beforeFirst();
								while (rs.next()) {
						%>
						<a
							href="m_playerlist.jsp?tourId=<%=request.getParameter("tourId")%>&tId=<%=rs.getInt("tId")%>">
							<span class="list-group-item tournext-list-group-item">
								&nbsp; <img src="../<%=rs.getString("flag")%>" width=50
								height=50 style="border-radius: 50%;"> &nbsp;&nbsp;&nbsp;

								<span style="white-space: nowrap;"><%=rs.getString("tname")%></span>

						</span>
						</a>
						<%
								}
							}
								else{
						%>
						<h4>Teams Not Found</h4>
						<%} %>
					</div>
				</div>

			</div>
			<div class="col-xs-12 col-sm-12 col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center"><h4>MATCH
						SUMMARY</h4></div>
					<div class="panel-body tournext-panel-body">
						<%
							int i = 0;
								rs = null;
								ResultSet rs1 = null;
								rs = DBManager.fetchQuery(
										"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as tname2,gender,mtype,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,(select pool from wmatch m where m.mid=pm.mid and m.tourId=pm.tourId and m.gender=pm.gender) as pool from print_match pm where tourId="
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
							<div class="carousel-inner">
								<%
									if (count.length == 0) {
								%>
								<div class="item active center">
									<span
										style="color: rgb(255, 255, 255); font-size: 25px;line-height:100px;">NO
										MATCH PLAYED</span>
								</div>
								<%
									}

										for (i = 0; i < count.length && i < 1; i++) {
								%>
								<div class="item active center">
									<%
										if (gender[i].equals("M")) {
									%>
									<div class="row center">
									<span class="center" style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
										MATCH <%=count[i]%></span></div>
									<%
										rs1 = null;
													rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[i]
															+ " and ttId=" + tid1[i] + " and tourId = " + request.getParameter("tourId")
															+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[i]
															+ " and ttId=" + tid2[i] + " and tourId = " + request.getParameter("tourId")
															+ " group by ttId) as score2  from wmatch w where mid=" + count[i] + " and gender ='"
															+ gender[i] + "';");
													if (rs1.next()) {
									%>
									<div class="row">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore1 center">
											<span class="disp-score1"> <%=rs1.getInt("score1")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore2 center">
											<span class="disp-score1"> <%=rs1.getInt("score2")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
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
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname1")%></span>
										</div>

										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname2")%></span>

										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<%
										}
									%>
									<!-- END SECOND ROW -->

									<!-- THIRD ROW -->
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-6 col-xs-10 col-sm-10">
											<div class="row" style="background-color: #fff;">
												<div class="col-md-12 col-xs-12 col-sm-12 disp-row-bg">
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</div>
											</div>
											<!-- FOR WICKET -->
											<div class="row"
												style="margin-top: 0.5%; background-color: #fff;">
												<div class="col-md-2"></div>
												<%
													rs1 = null;

																rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																		+ count[i] + " and turn=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[i]
																		+ " and turn=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourWicket;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i] + " and ttId="
																		+ tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourHit;");
																if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourMiss;");
																if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
														+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId=" + request.getParameter("tourId")
														+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[i] + " and ttId="
														+ tid2[i] + " and rtype='6' and tourId=" + request.getParameter("tourId") + ") as count2 from tourRestore;");
												if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>


												<%
													}
												%>
												<div class="col-md-2"></div>
											</div>
											<!-- END GOLDEN -->
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<br>
									<!-- END THIRD ROW -->

									<%
										} else {
									%>
									<!-- WOMENS -->

									<div class="row center">
									<span class="center" style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
										MATCH <%=count[i]%></span></div>
									<%
										rs1 = null;
													rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[i]
															+ " and ttId=" + tid1[i] + " and tourId = " + request.getParameter("tourId")
															+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[i]
															+ " and ttId=" + tid2[i] + " and tourId = " + request.getParameter("tourId")
															+ " group by ttId) as score2  from wmatch w where mid=" + count[i] + " and gender ='"
															+ gender[i] + "';");
													if (rs1.next()) {
									%>
									<div class="row">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore1 center">
											<span class="disp-score1"> <%=rs1.getInt("score1")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore2 center">
											<span class="disp-score1"> <%=rs1.getInt("score2")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
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
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname1")%></span>
										</div>

										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname2")%></span>

										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<%
										}
									%>
									<!-- END SECOND ROW -->

									<!-- THIRD ROW -->
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-6 col-xs-10 col-sm-10">
											<div class="row" style="background-color: #fff;">
												<div class="col-md-12 col-xs-12 col-sm-12 disp-row-bg">
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>

												</div>
											</div>
											<!-- FOR WICKET -->
											<div class="row"
												style="margin-top: 0.5%; background-color: #fff;">
												<div class="col-md-2"></div>
												<%
													rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																		+ count[i] + " and turn=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[i]
																		+ " and turn=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourWicket;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[i] + " and ttId="
																		+ tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourHit;");
																if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																		+ count[i] + " and ttId=" + tid1[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourMiss;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
														+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId=" + request.getParameter("tourId")
														+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[i] + " and ttId="
														+ tid2[i] + " and rtype='6' and tourId=" + request.getParameter("tourId") + ") as count2 from tourRestore;");
												if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>

												<%
													}
												%>
												<div class="col-md-2"></div>
											</div>
											<!-- END GOLDEN -->
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<br>
									<!-- END THIRD ROW -->
									<%
										}
									%>
								</div>

								<%
									}
										for (int j = i; j < count.length; j++) {
								%>
								<div class="item">
									<%
										if (gender[j].equals("M")) {
									%>
									<div class="row center">
									<span class="center" style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
										MATCH <%=count[j]%></span></div>
									<%
										rs1 = null;
													rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[j]
															+ " and ttId=" + tid1[j] + " and tourId = " + request.getParameter("tourId")
															+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[j]
															+ " and ttId=" + tid2[j] + " and tourId = " + request.getParameter("tourId")
															+ " group by ttId) as score2  from wmatch w where mid=" + count[j] + " and gender ='"
															+ gender[j] + "';");
													if (rs1.next()) {
									%>
									<div class="row">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore1 center">
											<span class="disp-score1"> <%=rs1.getInt("score1")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore2 center">
											<span class="disp-score1"> <%=rs1.getInt("score2")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
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
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname1")%></span>
										</div>

										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg">
											<span class="disp-tname"><%=rs1.getString("tname2")%></span>

										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<%
										}
									%>
									<!-- END SECOND ROW -->
									<!-- THIRD ROW -->
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-6 col-xs-10 col-sm-10">
											<div class="row" style="background-color: #fff;">
												<div class="col-md-12 col-xs-12 col-sm-12 center">
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</div>
											</div>
											<!-- FOR WICKET -->
											<div class="row"
												style="margin-top: 0.5%; background-color: #fff;">
												<div class="col-md-2"></div>
												<%
													rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																		+ count[j] + " and turn=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[j]
																		+ " and turn=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourWicket;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[j] + " and ttId="
																		+ tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourHit;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourMiss;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
														+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId=" + request.getParameter("tourId")
														+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[j] + " and ttId="
														+ tid2[j] + " and rtype='6' and tourId=" + request.getParameter("tourId") + ") as count2 from tourRestore;");
												if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>

												<%
													}
												%>
												<div class="col-md-2"></div>
											</div>
											<!-- END GOLDEN -->
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<br>
									<!-- END THIRD ROW -->


									<%
										} else {
									%>
									<div class="row center">
									<span class="center" style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
										MATCH <%=count[j]%></span></div>
									<%
										rs1 = null;
													rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tr where mid=" + count[j]
															+ " and ttId=" + tid1[j] + " and tourId = " + request.getParameter("tourId")
															+ ") as score1,(select sum(score) from tourRestore tr where mid=" + count[j]
															+ " and ttId=" + tid2[j] + " and tourId = " + request.getParameter("tourId")
															+ " group by ttId) as score2  from wmatch w where mid=" + count[j] + " and gender ='"
															+ gender[j] + "';");
													if (rs1.next()) {
									%>
									<div class="row">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore1 center">
											<span class="disp-score1"> <%=rs1.getInt("score1")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-5 col-sm-5 teamscore2 center">
											<span class="disp-score1"> <%=rs1.getInt("score2")%>
											</span>
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
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
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg center">
											<span class="disp-tname"><%=rs1.getString("tname1")%></span>
										</div>

										<div class="col-md-3 col-xs-5 col-sm-5 disp-row-bg center">
											<span class="disp-tname"><%=rs1.getString("tname2")%></span>

										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
									</div>
									<%
										}
									%>
									<!-- END SECOND ROW -->
									<!-- THIRD ROW -->
									<div class="row" style="margin-top: 10px;">
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
										<div class="col-md-6 col-xs-10 col-sm-10">
											<div class="row" style="background-color: #fff;">
												<div class="col-md-12 col-xs-12 col-sm-12 center">
													<span style="font-size: 22px; font-variant: titling-caps;">MATCH
														SUMMARY</span>
												</div>
											</div>
											<!-- FOR WICKET -->
											<div class="row"
												style="margin-top: 0.5%; background-color: #fff;">
												<div class="col-md-2"></div>
												<%
													rs1 = null;
																rs1 = DBManager.fetchQuery("select distinct(select count(wno) from tourWicket th where mid="
																		+ count[j] + " and turn=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(wno) from tourWicket th where mid=" + count[j]
																		+ " and turn=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourWicket;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">WICKET</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(hno) from tourHit th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(hno) from tourHit th where mid=" + count[j] + " and ttId="
																		+ tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourHit;");
																if (rs1.next()) {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
																rs1 = DBManager.fetchQuery("select distinct(select count(mno) from tourMiss th where mid="
																		+ count[j] + " and ttId=" + tid1[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count1 ,(select count(mno) from tourMiss th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourMiss;");
																if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">MISS</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
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
														+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId=" + request.getParameter("tourId")
														+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[j] + " and ttId="
														+ tid2[j] + " and rtype='6' and tourId=" + request.getParameter("tourId") + ") as count2 from tourRestore;");
												if (rs1.next()) {
												%>

												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count1")%></span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext center">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size"><%=rs1.getInt("count2")%></span>
												</div>

												<%
													} else {
												%>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>
												<div class="col-md-4 col-xs-6 col-sm-6 center">
													<span class="mtext">GOLDEN HIT</span>
												</div>
												<div class="col-md-2 col-xs-3 col-sm-3 center">
													<span class="mtext-size">0</span>
												</div>

												<%
													}
												%>
												<div class="col-md-2"></div>
											</div>
											<!-- END GOLDEN -->
										</div>
										<div class="col-md-3 col-xs-1 col-sm-1"></div>
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
							<a class="carousel-control left" href="#myCarousel"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left hidden-xs hidden-sm"></span>
							</a> <a class="carousel-control right" href="#myCarousel"
								data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right hidden-xs hidden-sm"></span>
							</a>
						</div>


						<br>
						<br>
						<div class="row">

							<div class="col-md-12 col-xs-12 col-sm-12">
								<table class="table table-fixed table-hover table-responsive">
									<thead>
										<tr>
										<th class="col-md-1 col-xs-1 col-sm-1" style="background: #e21e22;">#</th>
											<th class="col-md-4 col-xs-8 col-sm-8" style="background: #e21e22;">TEAMS</th>
											<th class="col-md-3 hidden-xs hidden-sm" style="background: #e21e22;">DATE /
												TIME(IST)</th>
											<th style="background: #e21e22;" class="col-md-2 hidden-xs hidden-sm">MATCH</th>
											<th style="background: #e21e22;" class="col-md-2 col-xs-3 col-sm-3">POOL/GEN</th>
										</tr>
									</thead>
									<tbody
										style="background: #f0f0ef; cursor: pointer;">
										<%
											i = 0;
												if (rs.next()) {
													rs.beforeFirst();
													while (rs.next()) {
										%>
										<tr class="table-row" onClick="javascript:goToSlide(<%=i%>);"
											data-href="2">
											<td class="col-md-1 col-xs-1 col-sm-1 center"><b><%=i+1%></b></td>
											<td class="col-md-4 col-xs-8 col-sm-8">
												<span><%=rs.getString("tname1")%>&nbsp;&nbsp;<b>VS</b>&nbsp;&nbsp;<%=rs.getString("tname2")%></span>
											</td>

											<td class="col-md-3 hidden-xs hidden-sm"><b><span
													style="color: #333; font-size: 13px;"><%=rs.getString("mdate")%></span></b>&nbsp;<b><span
													style="color: #999; font-size: 13px; line-height: 2px;">&nbsp;&nbsp;<%=rs.getString("time")%>
														(IST)
												</span></b></td>
											<td class="col-md-2 hidden-xs hidden-sm"><b><%=rs.getString("mtype").toUpperCase()%></b></td>
											<td class="col-md-2 col-xs-3 col-sm-3 center"><b>&#<%=rs.getInt("pool") + 64%></b>&nbsp;/&nbsp;<b><%=rs.getString("gender")%></b></td>
										
										</tr>
										<%
											i = i + 1;
													}
												} else {
										%>
										<h3>MATCH NOT FOUND</h3>
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
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-6 col-12 col-sm-12">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading">LEAGUE
							POINT TABLE [ MALE ]</div>
						<div class="panel-body tournext-panel-body" style="height: auto;">
							<%
								try {

										int ic = 1;

										rs = null;
										rs1 = null;
										int pcnt = 0;
										rs = DBManager.fetchQuery("select count(*) from tourPool where tourId="
												+ request.getParameter("tourId") + " and tpgender='M' group by pname;");
										if (rs.last())
											pcnt = rs.getRow();
										else {
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
										<th>Team <span style="color: #e21e22">[</span> POOL - <%=((char) (65 + k))%>
											<span style="color: #e21e22">]</span></th>
										<th>P</th>
										<th>W</th>
										<th class="hidden-xs">L</th>
										<th>Points</th>
									</tr>
								</thead>
								<tbody>
									<%
										rs = DBManager.fetchQuery(
															"select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="
																	+ request.getParameter("tourId") + " and tpgender='M' and pname=" + (k + 1)
																	+ " order by W desc");
													if (rs.next()) {
														rs.beforeFirst();
														while (rs.next()) {
									%>

									<tr>
										<td style="font-size: 16px;"><b><%=ic++%></b></td>
										<td><span
											style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
										<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
										<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
										<td  class="hidden-xs" style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
										<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W") * 2)%></b></td>
									</tr>
									<%
										}
													} else {
													}
													ic = 1;
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
			<!-- FEMALE -->
			<div class="col-md-6 col-12 col-sm-12">
				<div class="panel-group">
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading">LEAGUE
							POINT TABLE [ FEMALE ]</div>
						<div class="panel-body tournext-panel-body" style="height: auto;">

							<%
								try {

										int ic = 1;

										rs = null;
										rs1 = null;
										int pcnt = 0;
										rs = DBManager.fetchQuery("select count(*) from tourPool where tourId="
												+ request.getParameter("tourId") + " and tpgender='F' group by pname;");
										if (rs.last())
											pcnt = rs.getRow();
										else {
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
										<th>Team <span style="color: #e21e22">[</span> POOL - <%=((char) (65 + k))%>
											<span style="color: #e21e22">]</span></th>
										<th>P</th>
										<th>W</th>
										<th  class="hidden-xs">L</th>
										<th>Points</th>
									</tr>
								</thead>
								<tbody>
									<%
										rs = DBManager.fetchQuery(
															"select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="
																	+ request.getParameter("tourId")
																	+ " and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="
																	+ request.getParameter("tourId") + " and tpgender='F' and pname=" + (k + 1)
																	+ " order by W desc ");
													if (rs.next()) {
														rs.beforeFirst();
														while (rs.next()) {
									%>

									<tr>
										<td style="font-size: 16px;"><b><%=ic++%></b></td>
										<td><span
											style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
										<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
										<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
										<td  class="hidden-xs" style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
										<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W") * 2)%></b></td>
									</tr>
									<%
										}
													} else {

													}
													ic = 1;
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

				<!-- END FEMALE -->
			</div>
		</div>
	</div>
	<%
		} catch (Exception e) {
			System.out.println("Error in m_tournamentnext : " + e);
		}
	%>
</body>
<script type="text/javascript">
 $(document).ready(function($) { 	
 $("#myCarousel").carousel({
	 interval:false
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
</html>