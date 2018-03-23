<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Teams</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<style>
body
{
	background:url("images/bg-footer.jpg");
	background-color: #333;
	background-position: center -100px;
	background-repeat: x-repeat;
	background-size: cover;
	width: 100%;
	height: 200px;
}
.navbar-default {
    background-color: #f8f8f8;
    border-color:#030825;
}

#logo
{
	float:left;
	margin-left:-5%;
	width:75%;
}
#topbar
{
	color:white;
}
#teamtag
{
	float:left;
	margin-left:0.5%;
	color:#fff;
}
#teamflag
{
	float:left;
	margin:1%;
	border-radius:5px;
}
</style>
<body onload="demo()">
<div class="container-fluid">
<div class="row">
<div class="col-sm-12 col-xs-12 col-md-12">
<br>
</div>
</div>
<div class="row">
		<nav class="navbar navbar-default" style="background-color:#2045a5;opacity:0.9;" >
			<div class="container-fluid" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myHeader" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				 <!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myHeader" >
				<ul class="nav navbar-nav">
					<li>
						<a  href="tournament.jsp" role="button"><font color="white">TOURNAMENT</font></a>
					</li>
					
					<li><a href="#"><font color="white">TEAMS</font></a></li>
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="selectMatch.jsp">SELECT MATCH <span class="sr-only">(current)</span></a></li>
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
	<div class="row">
		<div class="col-xs-1 col-md-1 col-sm-1"></div>
		<div class="col-xs-10 col-md-10 col-sm-10" id="teamtag">
		<h2><b>All Teams</b></h2>
		</div>
		<div class="col-xs-1 col-md-1 col-sm-1"></div>
	</div>
	<div class="row">
		<div class="col-xs-1 col-md-1 col-sm-1"></div>
		<div class="col-xs-10 col-md-10 col-sm-10">
		<%
			try
			{
				DBManager.loadDriver();		
				ResultSet rs = null;
				rs = DBManager.fetchQuery("select tname,SUBSTRING_INDEX(tFlag,'/',-2) as tFlag from team");
				while(rs.next())
				{
					
		%>
			<img src="<%=rs.getString("tFlag") %>" width="250" height="300" id="teamflag">
		<%
				}
			}
			catch(Exception e)
			{
				System.out.println("TEAMS.JSP");
			}
		%>
		<div class="col-xs-1 col-md-1 col-sm-1"></div>
		</div>
	</div>
</div>	

</body>
</html>