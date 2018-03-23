<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Perform Matches</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="../dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../dist/sweetalert.css">
<link rel="stylesheet" type="text/css" href="../css/listswap.css" />

<link rel="stylesheet" href="../css/mobile_home.css">
<link rel="stylesheet" href="../css/m_tourinsert.css">
<style type="text/css">
body {
	background-color: #f5f5f5;
}

.list-group-item {
	padding: 10px 0px;
}

.list-group {
	padding-left: 0;
	margin-bottom: 5px;
}

.panel-heading .list-group.lists-group>li:hover {
	border: 2px solid #001e35;
	cursor: pointer;
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
					<li><a
						href="m_tournamentsnext.jsp?tourId=<%=request.getParameter("tourId")%>">OVERVIEW</a></li>
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">INSERT <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a
								href="m_addtourTeam.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M">Add
									Teams</a></li>
							<li><a
								href="m_addtourMember.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M&cate=1">Add
									Player</a></li>
							<li><a
								href="m_addtourMatch.jsp?tourId=<%=request.getParameter("tourId")%>&gen=M">Add
									Pool</a></li>
						</ul></li>
					<li class="active"><a
						href="m_selectMatch.jsp?tourId=<%=request.getParameter("tourId")%>">SELECT
							MATCH</a></li>

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
	<div class="container">
		<div class="row">
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="panel-group lists">
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>OPTIONS</h4>
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
				</div>
				<!-- END -->
			</div>

			<%
				try {
					DBManager.loadDriver();
					ResultSet rs = null;
			%>
			<div class="col-md-9 col-xs-12 col-sm-12">
				<div id="addofficial" class="collapse">
					<div class="panel-body tourteam-panel-body" style="height: 300px">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-4">
									<h5 style="color: #0E1957;">
										<b>SELECT MATCH</b>
									</h5>
								</div>
								<div class="col-md-4 col-xs-12 col-sm-12">
									<select id="matchselect" class="form-control" required>
										<option value="-1">SELECT MATCH</option>
										<%
											rs = null;

												rs = DBManager.fetchQuery(
														"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
																+ request.getParameter("tourId")
																+ ") as tname2,gender,ucase(mtype) as type from wmatch pm where mid not in(select mid from tourmatchrefoff p where p.mid=pm.mid and pm.gender=p.gender) and tourId="
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
								<div class="col-md-4"></div>
							</div>

							<div class="row">
								<div class="col-md-4 col-xs-12 col-sm-4">
									<h5 style="color: #0E1957;">
										<b>REFREE</b>
									</h5>
								</div>
								<div class="col-md-4 col-xs-12 col-sm-4">
									<select id="matchrefree1" class="form-control" data-size="10"
										required>
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
									</select>
								</div>
								<div class="col-md-4 col-xs-12 col-sm-4">
									<select id="matchrefree2" class="form-control" data-size="10">
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
							</div>



							<!-- OFFICIAL -->
							<div class="row">
								<div class="col-md-4 col-xs-12 col-sm-4">
									<h5 style="color: #0E1957;">
										<b>TABLE OFFICIAL</b>
									</h5>
								</div>
								<div class="col-md-4 col-xs-12 col-sm-4">
									<select id="matchoff1" class="form-control" data-size="10">
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
									</select>
								</div>
								<div class="col-md-4 col-xs-12 col-sm-4">
									<select id="matchoff2" class="form-control" data-size="10">
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

							</div>


							<!-- TOURNAMENT REFREE -->
							<div class="row">
								<div class="col-md-4 col-xs-12 col-sm-4">
									<h5 style="color: #0E1957;">
										<b>CHIEF REFREE</b>
									</h5>
								</div>
								<div class="col-md-8 col-xs-12 col-sm-8">
									<select id="cfref" class="form-control" data-size="10">
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
									</select>
								</div>

							</div>
							<br>
							<div class="row">

								<div class="col-md-12 col-xs-12 col-sm-12 center">
									<button class="btn btn-success submit-btn" onclick="addroc();">ADD</button>
								</div>
							</div>


						</div>
					</div>
				</div>
				<!-- ADD MATCH -->

				<div id="addmatch" class="collapse">
					<div class="panel-body tourteam-panel-body" style="height: 300px">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-9">
									<select id="matchselect" class="form-control">
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
				</div>
				<!-- END -->
				<!-- UPDATE MATCH/OFFICIAL -->

				<div id="updateofficial" class="collapse">
					<div class="panel-body tourteam-panel-body" style="height: 300px">
						<div class="container-fluid">
							<div class="row">
								<div class="col-md-3"></div>
								<div class="col-md-9">
									<select id="matchselect" class="form-control">
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
						</div>
					</div>
				</div>
				<!-- END UPDATE/OFFICIAL -->

				<!-- ------------------------------------------------------------------------------------------------------- -->
				<!-- START CAROUSEL -->

				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>SELECT MATCH HERE</h4>
					</div>
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
												+ ") as tname2,gender,mtype,ucase(DATE_FORMAT(mdate,'%d %b %y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time from wmatch pm where tourId="
												+ request.getParameter("tourId") + " and Flag='2' order by mid asc;");
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
										style="color: rgb(255, 255, 255); line-height: 123px; font-size: 25px;">NO
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
										<span class="center"
											style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
											MATCH <%=count[i]%></span>
									</div>
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
																		+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and rtype='6' and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourRestore;");
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
										<span class="center"
											style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
											MATCH <%=count[i]%></span>
									</div>
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
																		+ count[i] + " and ttId=" + tid1[i] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[i]
																		+ " and ttId=" + tid2[i] + " and rtype='6' and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourRestore;");
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
										<span class="center"
											style="color: rgb(221, 222, 219); font-weight: 700;">MEN'S
											MATCH <%=count[j]%></span>
									</div>
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
																		+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and rtype='6' and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourRestore;");
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
										<span class="center"
											style="color: rgb(221, 222, 219); font-weight: 700;">WOMEN'S
											MATCH <%=count[j]%></span>
									</div>
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
																		+ count[j] + " and ttId=" + tid1[j] + " and rtype='6' and tourId="
																		+ request.getParameter("tourId")
																		+ ") as count1 ,(select count(rno) from tourRestore th where mid=" + count[j]
																		+ " and ttId=" + tid2[j] + " and rtype='6' and tourId=" + request.getParameter("tourId")
																		+ ") as count2 from tourRestore;");
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


						<br> <br>
						<div class="row">

							<div class="col-md-12 col-xs-12 col-sm-12">
								<table class="table table-fixed table-hover table-responsive">
									<thead>
										<tr>
											<th class="col-md-1 col-xs-1 col-sm-1"
												style="background: #e21e22;">#</th>
											<th class="col-md-4 col-xs-8 col-sm-8"
												style="background: #e21e22;">TEAMS</th>
											<th class="col-md-3 hidden-xs hidden-sm"
												style="background: #e21e22;">DATE / TIME(IST)</th>
											<th style="background: #e21e22;"
												class="col-md-2 hidden-xs hidden-sm">MATCH</th>
											<th style="background: #e21e22;"
												class="col-md-2 col-xs-3 col-sm-3">POOL/GEN</th>
										</tr>
									</thead>
									<tbody
										style="background: #f0f0ef; box-shadow: 1px 1px 1px #888888; cursor: pointer;">
										<%
											rs = null;
												rs = DBManager.fetchQuery(
														"select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
																+ request.getParameter("tourId")
																+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
																+ request.getParameter("tourId")
																+ ") as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,mtype,gender,pool,TIME_FORMAT(mtime,'%H:%i') as time,Flag from wmatch w where Flag!='2' and tourId="
																+ request.getParameter("tourId"));
												i = 0;
												int i1 = 0;
												if (rs.next()) {

													rs.beforeFirst();
													while (rs.next()) {
														if (rs.getString("Flag").equals("1")) {
										%>
										<tr class="table-row" data-toggle="collapse"
											data-target="#accordion<%=i%>" class="clickable"
											style="background-color: red;">
											<td class="col-md-1 col-xs-1 col-sm-1 center"><b><%=rs.getInt("mid")%></b></td>
											<td class="col-md-4 col-xs-8 col-sm-8"><span><%=rs.getString("tname1")%>&nbsp;&nbsp;<b>VS</b>&nbsp;&nbsp;<%=rs.getString("tname2")%></span>
											</td>

											<td class="col-md-3 hidden-xs hidden-sm"><b><span
													style="color: #333; font-size: 13px;"><%=rs.getString("mdate")%></span></b>&nbsp;<b><span
													style="color: #999; font-size: 13px; line-height: 2px;">&nbsp;&nbsp;<%=rs.getString("time")%>
														(IST)
												</span></b></td>
											<td class="col-md-2 hidden-xs hidden-sm"><b><%=rs.getString("mtype").toUpperCase()%></b></td>
											<td class="col-md-2 col-xs-3 col-sm-3 center"><b>&#<%=rs.getInt("pool") + 64%></b>&nbsp;/&nbsp;<b><%=rs.getString("gender")%></b></td>
										</tr>


										<tr>
											<td class="col-xs-12 col-md-12 col-sm-12">
												<div id="accordion<%=i%>" class="collapse"
													style="background: rgb(240, 66, 70) none repeat scroll 0% 0%; color: #fff; overflow-x: hidden;">
													<div class="row">
														<div class="col-md-12 col-xs-12 col-sm-12 center">
															<button type="button" class="btn btn-success submit-btn"
																onclick="complete_match(<%=rs.getInt("mid")%>,'<%=rs.getString("gender")%>');">COMPLETE
																MATCH</button>
														</div>
													</div>
													<div class="row">
														<div class="col-md-12 col-xs-12 col-sm-12 center">
															<h4>Click above Button to complete current match.</h4>
														</div>
													</div>
												</div>

											</td>
										</tr>
										<%
											i++;
														} else {
										%>
										<tr class="table-row" data-toggle="collapse"
											data-target="#accordion<%=i%>" class="clickable">
											<td class="col-md-1 col-xs-1 col-sm-1 center"><b><%=rs.getInt("mid")%></b></td>
											<td class="col-md-4 col-xs-8 col-sm-8"><span><%=rs.getString("tname1")%>&nbsp;&nbsp;&nbsp;<b>VS</b>&nbsp;&nbsp;&nbsp;<%=rs.getString("tname2")%></span>
											</td>

											<td class="col-md-3 hidden-xs hidden-sm"><b><span
													style="color: #333; font-size: 13px;"><%=rs.getString("mdate")%></span></b>&nbsp;<b><span
													style="color: #999; font-size: 13px; line-height: 2px;">&nbsp;&nbsp;<%=rs.getString("time")%>
														(IST)
												</span></b></td>
											<td class="col-md-2 hidden-xs hidden-sm"><b><%=rs.getString("mtype").toUpperCase()%></b></td>
											<td class="col-md-2 col-xs-3 col-sm-3 center"><b>&#<%=rs.getInt("pool") + 64%></b>&nbsp;/&nbsp;<b><%=rs.getString("gender")%></b></td>
										</tr>


										<tr>
											<td class="col-xs-12 col-md-12 col-sm-12">
												<div id="accordion<%=i%>" class="collapse"
													style="background: rgb(240, 66, 70) none repeat scroll 0% 0%; color: #fff; overflow-x: hidden;">
													<form method="post">
														<div class="row">
															<div class="col-md-4 col-xs-2 col-sm-12 center">
																<h4>TOSS</h4>
															</div>
															<div class="col-md-4 col-xs-5 col-sm-6">
																<span> <input type="radio"
																	id="toss-team1&<%=i%>&<%=rs.getInt("mid")%>"
																	name="teams&<%=i%>&<%=rs.getInt("mid")%>"
																	value=<%=rs.getInt("tid1")%> required>&nbsp;&nbsp;<%=rs.getString("tname1")%>
																</span>
															</div>

															<div class="col-md-4 col-xs-5 col-sm-6">

																<input type="radio"
																	id="toss-team2&<%=i%>&<%=rs.getInt("mid")%>"
																	name="teams&<%=i%>&<%=rs.getInt("mid")%>"
																	value=<%=rs.getInt("tid2")%> required>&nbsp;&nbsp;<%=rs.getString("tname2")%>
															</div>
														</div>
														<div class="row">
															<div class="col-md-4 col-xs-4 center">
																<h4>COURT</h4>
															</div>
															<div class="col-md-3 col-xs-6" style="color: #fff;">

																<input type="number" class="form-control"
																	id="court&<%=i%>&<%=rs.getInt("mid")%>"
																	name="court&<%=i%>&<%=rs.getInt("mid")%>"
																	placeholder="COURT NO" required>
															</div>
															<div class="col-xs-2"></div>
														</div>
														<div class="row">
															<div class="col-md-10 col-xs-12 center">
																<button type="button" class="btn btn-success submit-btn"
																	onclick="getmid(<%=rs.getInt("mid")%>);getgen('<%=rs.getString("gender")%>');golivescore(<%=rs.getInt("mid")%>,<%=i%>);">START
																	MATCH</button>
															</div>
														</div>
													</form>
												</div>

											</td>
											<!-- <td class="col-xs-5">&nbsp; </td><td class="col-xs-4">&nbsp;</td><td class="col-xs-2">&nbsp;</td> -->
										</tr>

										<!-- END -->

										<%
											i = i + 1;

														}
													}
												}
										%>
									</tbody>
								</table>

							</div>
						</div>
					</div>
				</div>

				<!-- END CAROUSEL -->

			</div>
			<%
				} catch (Exception e) {
					e.getMessage();
				}
			%>
		</div>
	</div>
	<script>
function insertPM(court,toss,tourId,mid,gender)
{
	window.open("m_printmatchUpdateServ.jsp?tourId="+tourId+"&toss="+toss+"&court="+court+"&mid="+mid+"&gender="+gender,"file","height=1,width=1");
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
		swal("Select Toss");
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
	
	window.location.replace("m_livematch.jsp?tourId="+getParameter("tourId")+"&mid="+window.mid+"&gen="+window.gender);
	
/* 	$('#toss-modal').modal('toggle'); */
}
function complete_match(mid,gender)
{
	window.location.replace("m_livematch.jsp?tourId="+getParameter("tourId")+"&mid="+mid+"&gen="+gender);
	
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
					location.replace("m_selectMatch.jsp?tourId="+getParameter("tourId"));
					swal("Data Added Successfully.","");
				}
			};
		}
	   
	 	xmlhttp.open("GET","../m_addtourMatchRefree?mid="+mid+"&gen="+gen+"&tourId="+tourId+"&tmr1="+mrf1+"&tmr2="+mrf2+"&tmo1="+mof1+"&tmo2="+mof2+"&tourRefree="+cr,true);
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