<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Lagori Home</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/mobile_home.css">
<style type="text/css">
body
{
background-color:#001e35;
}
</style>
</head>
<body onload="showslides();">

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
					<li class="active"><a href="m_home.jsp">HOME</a></li>
					
					<li class="dropdown"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">TOURNAMENT <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">
							<li><a href="m_addTournament.jsp">Add Tournament</a></li>
							<li><a href="m_addMember.jsp">Add Members</a></li>
							<li><a href="m_addTeam.jsp">Add Teams</a></li>
							<li><a href="m_tournament.jsp">Select Tournament</a></li>
						</ul></li>
						<!-- <li><a href="#"><font color="white">UPDATE</font></a></li>
						<li><a href="#"><font color="white">SELECT MATCH</font></a></li>
						<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li> -->
						<li><a href="#">STATISTICS</a></li>
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
	<div class="container-fluid">
		<%
			try {
				ResultSet rs = null;
				
				DBManager.loadDriver();
				rs = DBManager.fetchQuery("select tourId,tourName from tournament");
				if(rs.next()){
		%>
		<div class="row">
			<div class="col-md-9 col-xs-12 col-sm-12">
				<div class="row">
					<div class="col-md-6 col-xs-12 col-sm-6">
						<select id="tourId" class="form-control" onchange="showslides();">
							<%
									rs.beforeFirst();
									while (rs.next()) {
							%>
							<option value="<%=rs.getInt("tourId")%>"><%=rs.getString("tourName")%></option>
							<%
								}
							%>
						</select>
					</div>
					<div class="col-md-6 col-sm-6"></div>
				</div>
				<br> <span id="overview"></span>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12">
						<span style="font-size: 24px; font-weight: 700; color: #fff;text-align:center;">LATEST
							RESULT</span>
					</div>
				</div>
				<br style="height: 4px;"> <span id="latest_result"></span>
			</div>
		</div>
		<br><br><br><br>
		<div class="row">
		<div class="col-md-12 col-xs-12 col-sm-12">
		<span id="m_schedule"></span>
		</div>
		</div>
		<%
				}
				else
				{
					%>
					<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3 style="color:#fff;text-align: center;">NO TOURNAMENT FOUND</h3>
					</div></div>
					<% 
				}
			} catch (Exception e) {
				System.out.println("Error in m_home : " + e);
			}
		%>
	</div>
</body>
<script>
	
function showslides()
		{
		var tourId = document.getElementById("tourId").value;
		$("#overview").load("m_home1.jsp?tourId=" + tourId+"");
		$("#latest_result").load("m_home2.jsp?tourId=" + tourId+"");
		$("#m_schedule").load("m_viewschedule.jsp?tourId=" + tourId+"");
		}
	
</script>
</html>