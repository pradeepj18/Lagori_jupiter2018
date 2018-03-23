<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Tournament Teams</title>
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
					<li class="dropdown active"><a class="dropdown-toggle"
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
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-4 col-xs-12 col-sm-12 center">
				<h4>
					SELECT GENDER &nbsp;&nbsp;
					<%
						if (request.getParameter("gen").equals("M")) {
					%>
					<input type="radio" name="gen" value="M" checked
						onclick="getGender('M');">Male&nbsp;
					<%
						} else {
					%>
					<input type="radio" name="gen" value="M" onclick="getGender('M');">Male&nbsp;
					<%
						}
						if (request.getParameter("gen").equals("F")) {
					%>
					<input type="radio" name="gen" value="F" checked
						onclick="getGender('F');">Female
					<%
						} else {
					%>
					<input type="radio" name="gen" value="F" onclick="getGender('F');">Female
					<%
						}
					%>
				</h4>
			</div>
			<%
				try {
			%>
			<div class="col-md-3 col-xs-12 col-sm-12 center">
				<%
					ResultSet rs = null;
						rs = DBManager.fetchQuery(
								"select ttId,(select tName from team where tId = tt.tId) as tname from tourTeam tt where tourId="
										+ request.getParameter("tourId") + " and ttGender ='" + request.getParameter("gen")
										+ "' order by tname asc;");
						if (rs.next()) {
				%>
				<select id="teamId" class="form-control" data-size="10">
					<%
						rs.beforeFirst();
								while (rs.next()) {
					%>
					<option value="<%=rs.getInt("ttId")%>"><%=rs.getString("tname")%></option>
					<%
						}
							}
					%>
				</select>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12 center">
				<select id="memcategory" class="form-control"
					onchange="getCategory();" data-size="5">
					<%
						if (request.getParameter("cate").equals("1")) {
					%>
					<option value="1" selected=selected>PLAYER</option>
					<%
						} else {
					%>
					<option value="1">PLAYER</option>
					<%
						}
							if (request.getParameter("cate").equals("2")) {
					%>
					<option value="2" selected=selected>COACH</option>
					<%
						} else {
					%>
					<option value="2">COACH</option>
					<%
						}
							if (request.getParameter("cate").equals("3")) {
					%>
					<option value="3" selected=selected>MANAGER</option>
					<%
						} else {
					%>
					<option value="3">MANAGER</option>
					<%
						}
							if (request.getParameter("cate").equals("4")) {
					%>
					<option value="4" selected="selected">OFFICIAL</option>
					<%
						} else {
					%>
					<option value="4">OFFICIAL</option>
					<%
						}
					%>
				</select>
			</div>

			<%
				} catch (Exception e) {
					System.out.println("Error in gender,team,official in first row : " + e.getMessage());
				}
			%>
			<div class="col-md-1"></div>
		</div>

		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center"><h4>TEAM COUNT</h4></div>
					<div class="panel-body tournext-panel-body">
						<%
							try {
						%>

						<%
							ResultSet rs1 = null;
								rs1 = DBManager.fetchQuery(
										"select ttId,tId,(select tName from team t where t.tId = tt.tId) as tName,(select count(barcodeId) from tourPlayer tp where tp.ttId = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as pcount,(select count(barcodeId) from tourCoach tc where tc.ttId = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as coachCount,(select count(barcodeId) from tourManager tm where tm.ttId = tt.ttId and tourId="
												+ request.getParameter("tourId")
												+ ") as managerCount from tourTeam tt where ttGender ='" + request.getParameter("gen")
												+ "' and tourId=" + request.getParameter("tourId") + ";");
								if (rs1.next()) {
									rs1.beforeFirst();
									while (rs1.next()) {
						%>
						<div class="list-group-item">
							&nbsp;
							<p class="team-name" style="color: #c9302c;">
								<b><%=rs1.getString("tName")%></b>
							</p>
							<ul class="stats">
								<li><span style="color: #0E1957;">Player</span> <span
									class="value"><%=rs1.getInt("pcount")%></span></li>
								<li><span style="color: #0E1957;">Coach</span> <span
									class="value"><%=rs1.getInt("coachCount")%></span></li>
								<li><span style="color: #0E1957;">Manager</span> <span
									class="value"><%=rs1.getInt("managerCount")%></span></li>

							</ul>
						</div>
						<%
							}
								}
						%>
						<%
							} catch (Exception e) {
								e.getMessage();
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center"><h4>ADD PLAYERS
						HERE</h4></div>
					<div class="panel-body tourteam-panel-body">
						<div class="container-fluid">


							<form method="post">
								<%
									String table = "tourPlayer";
									if ((request.getParameter("cate") != null) && (Integer.parseInt(request.getParameter("cate"))) == 1) {
										table = "tourPlayer";
									} else if ((request.getParameter("cate") != null)
											&& (Integer.parseInt(request.getParameter("cate"))) == 2) {
										table = "tourCoach";
									} else if ((request.getParameter("cate") != null)
											&& (Integer.parseInt(request.getParameter("cate"))) == 3) {
										table = "tourManager";
									} else if ((request.getParameter("cate") != null)
											&& (Integer.parseInt(request.getParameter("cate"))) == 4) {
										table = "tourOfficial";
									}
									ResultSet rs = null;
									rs = DBManager.fetchQuery(
											"select barcodeId,UCASE(fName) as fName,UCASE(lName) as lName from member where barcodeId not in(select barcodeId from "
													+ table + " where tourId=" + request.getParameter("tourId") + ") and gender='"
													+ request.getParameter("gen") + "' order by barcodeId asc");
								%>
								<select id="source" data-text="Player list"
									data-search="Search for member">

									<%
										if (rs.next()) {
											rs.beforeFirst();
									%>
									<%
										while (rs.next()) {
									%>
									<option value=<%=rs.getInt("barcodeId")%>><%=rs.getInt("barcodeId")%>&nbsp;&nbsp;<%=rs.getString("fname")%>&nbsp;<%=rs.getString("lName")%></option>
									<%
										}
										}
									%>
								</select> <select id="destination" data-text="Selected list"
									data-search="Search for member">
								</select>
								<div class="row">
									<div class="col=md-12 col-xs-12 col-sm-12 center">
										<input class="btn btn-success submit-btn" type="button"
											id="addmem" value="Add Player">
									</div>
								</div>
							</form>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/jquery.listswap.js"></script>
	<script type="text/javascript">
		$('#source, #destination').listswap({
			truncate : true,
			height : 360,
			is_scroll : true,
		});
		function addmember() {
			var node = document.getElementById("destination").options;
			var list = document.getElementById("destination").options.length;
			var memvalues = [];
			for (var i = 0; i < list; i++) {
				memvalues[i] = node[i].value;
			}
			memvalues[i] = document.getElementById("teamId").value;
			i = i + 1;
			memvalues[i] = document.getElementById("memcategory").value;
			i = i + 1;
			memvalues[i] = getParameter("tourId");
			i = i + 1;
			memvalues[i] = getParameter("gen");
			i = i + 1;
			$.ajax({
				type : "GET",
				data : {
					memvalues : memvalues
				},
				url : "../m_addtourMember",
				success : function() {
					location.replace("m_addtourMember.jsp?tourId="
							+ getParameter("tourId") + "&gen="
							+ getParameter("gen") + "&cate="
							+ getParameter("cate"));
				}
			});
		}
		function getGender(id) {
			location.replace("m_addtourMember.jsp?gen=" + id + "&tourId="
					+ getParameter("tourId") + "&cate="
					+ document.getElementById("memcategory").value);
		}
		function getCategory() {
			location.replace("m_addtourMember.jsp?gen=" + getParameter("gen")
					+ "&tourId=" + getParameter("tourId") + "&cate="
					+ document.getElementById("memcategory").value);
		}
		function getParameter(variable) {
			var query = window.location.search.substring(1);
			var vars = query.split("&");
			for (var i = 0; i < vars.length; i++) {
				var pair = vars[i].split("=");
				if (pair[0] == variable) {
					return pair[1];
				}
			}
			return (false);
		}

		$("#addmem")
				.click(
						function() {
							var teamId = document.getElementById("teamId");
							teamName = teamId.options[teamId.selectedIndex].text;

							var pId = document.getElementById("memcategory");
							catename = pId.options[pId.selectedIndex].text;

							if (getParameter("gen") == "M") {
								gen = "MALE";
							} else if (getParameter("gen") == "F") {
								gen = "FEMALE";
							}
							if (document.getElementById("destination").options.length <= 0) {
								swal("Select Member to add", "");
								return false;
							}
							if ((document.getElementById("memcategory").value) != 4) {
								swal(
										{
											title : "Are you sure to add?",
											text : "You are adding "
													+ document
															.getElementById("destination").options.length
													+ " " + gen + " "
													+ catename + " in "
													+ teamName + "",
											type : "warning",
											showCancelButton : true,
											confirmButtonColor : "#DD6B55",
											confirmButtonText : "Proceed",
											cancelButtonText : "No, cancel pls!",
											closeOnConfirm : false,
											closeOnCancel : false
										},
										function(isConfirm) {
											if (isConfirm) {
												addmember();
												swal({
													title : "Data Added Successfully",
													text : "",
													timer : 100,
													showConfirmButton : false
												});
											} else {
												swal("Cancelled",
														"Data rejected :)",
														"error");
											}
										});
							} else {
								swal(
										{
											title : "Are you sure to add?",
											text : "You are adding "
													+ document
															.getElementById("destination").options.length
													+ " " + gen + " "
													+ catename + "",
											type : "warning",
											showCancelButton : true,
											confirmButtonColor : "#DD6B55",
											confirmButtonText : "Proceed",
											cancelButtonText : "No, cancel pls!",
											closeOnConfirm : false,
											closeOnCancel : false
										},
										function(isConfirm) {
											if (isConfirm) {
												addmember();
												swal({
													title : "Data Added Successfully",
													text : "",
													timer : 100,
													showConfirmButton : false
												});
											} else {
												swal("Cancelled",
														"Data rejected :)",
														"error");
											}
										});

							}
						});
	</script>
</body>
</html>