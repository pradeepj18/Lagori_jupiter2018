<%@ page language="java" import="java.sql.*"
	import="lg_DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Teams</title>
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


<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript">
function demo()
{
	var now = new Date();
	document.getElementById("year").value = now.toLocaleDateString();
}

function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(150)
                .height(100);
        };
        reader.readAsDataURL(input.files[0]);
    }
}
</script>
<style>
body
{
	
	background-color: white;
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


/* MOBILE */
@media (max-width:767px) and (orientation: portrait)
{
	#team-bar
	{
		background:#030825;
		width:98%;
		float:left;
		border-radius:5px;
		margin-top:1%;
		margin-left:1%;
	}
	#team-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:-14.5%;
		margin-left:29%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:80%;
	}
	.team-container
	{
		background:#F2EDED;
		border-radius:7px;
		width:120%;
		float:left;
		margin-left:-10%;
	}
}

/* MOBILE */
@media (max-width:767px) and (orientation: landscape)
{
	#team-bar
	{
		background:#030825;
		width:98%;
		float:left;
		border-radius:5px;
		margin-top:1%;
		margin-left:1%;
	}
	#team-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:-9%;
		margin-left:35%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:50%;
	}
	.team-container
	{
		background:#F2EDED;
		border-radius:7px;
		width:95%;
	}
}
/* TABLET */
@media (min-width:768px) and (max-width: 991px)
{
	#team-bar
	{
		background:#030825;
		width:99.7%;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#team-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:4.7%;
		margin-left:40%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:50%;
	}
	.team-container
	{
		background:#F2EDED;
		border-radius:7px;
		width:95%;
	}
}

/* LAPTOP */
@media (min-width:992px)
{
#topbar {
	color: white;
	background-color: #0E1957;
	min-height: 30px;
}
.bgcolor
{
background-color:#f9f9d9;
}
	#team-bar
	{
		background:#030825;
		
		width:99.7%;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#team-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:-3.7%;
		margin-left:40%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:75%;
	}
	.team-container
	{
		background:#fff;
		border-radius:7px;
		width:90%;
		float:left;
		margin-left:5%;
	}
	#teamlabel
	{
		float:left;
		margin-top:2%;
	}
}

</style>
<body onload="demo()">
<%
try{
	DBManager.loadDriver();
	ResultSet rs= DBManager.fetchQuery("select DATE_FORMAT(now(),'%d %M %x') as date");
	rs.next();
%>
<div class="container-fluid">

<div class="row">
		<nav class="navbar navbar-inverse" style="background-color:#2045a5;opacity:0.9;" >
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
					<li style="margin-left:-120px"><a href="home.jsp"><font color="white">HOME</font></a></li>
					
					<li ><a  href="tournament.jsp" role="button"><font color="white">SELECT TOURNAMENT</font></a></li>
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="" role="button" aria-haspopup="true" aria-expanded="false" style="padding: 16px;">ADD TEAMS<span class="sr-only">(current)</span></a>
					</li>
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li><a href="#"><font color="white">SELECT MATCH</font></a></li>
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
	<div class="row" >
		<div class="col-xs-2 col-sm-2 col-md-2"></div>
		<div class="col-xs-8 col-sm-8 col-md-8">
			<div class="team-container">
				<div class="row" id="team-bar">
					<div class="col-xs-12 col-md-12"><br><br></div>
				</div>
				<div id="team-text">
					<b>Add Teams</b>
				</div>
				<form action="addTeam" method="post" enctype="multipart/form-data">
				
				<div class="form-group row">
					<label for="team_name" class="col-md-2 col-form-label"></label>
					<div class="col-md-10">
						<input type="hidden" class="form-control">
					</div>
				</div>
				
				<div class="form-group">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel">Team Name</label>
					<div class="col-md-8 col-xs-12">
						<input type="text" class="form-control" name="tname" size="5" placeholder="Team Name" autofocus required id="aa">
					</div>
				</div>
				<div class="col-md-3"></div>
				</div>
				<br><br>
				<div class="form-group ">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel">Reg. Date</label>
					<div class="col-md-8 col-xs-12">
						<input type="text" class="form-control" name="tyear" size="5" placeholder="DATE" autofocus required id="year">
					</div>
				</div>
				<div class="col-md-3"></div>
				</div> 
				<br>
				<%for(int i = 0;i < 4;i++){ %>
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<%} %>
				<div class="form-group ">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel">Team Flag</label>
					<div class="col-md-8 col-xs-12">
						<input type="file" class="form-control" name="tflag" onchange="readURL(this);" size="5" placeholder="DATE" autofocus required id="year">
					</div>
				</div>
				<div class="col-md-3"></div>
				</div> 
				<br>
				<%for(int i = 0;i < 4;i++){ %>
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<%} %>
				<div class="form-group ">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel">Your Flag</label>
					<div class="col-md-8 col-xs-12">
						 <img id="blah" src="#" alt="Your Team Flag" />
					</div>
				</div>
				<div class="col-md-3"></div>
				</div> 
				<br>
				<% for(int i = 0;i < 4;i++){ %>
				<div class="row">
					<div class="col-md-12"></div>
				</div>
				<%} %>
				
				<div class="form-group ">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel"></label>
					<div class="col-md-8 col-xs-12">
						 <input type="submit" class="btn btn-primary" value="Add Team">
					</div>
				</div>
				<div class="col-md-3"></div>
				</div> 
				<br><br>
				<!-- Select Team Flag :-
			 	<input type='file' name="tflag" onchange="readURL(this);" />
			    <img id="blah" src="#" alt="Your Team Flag" />
			 	<br><br>
			 -->
				
				</form>
				</div>
		</div>
		<div class="col-xs-2 col-sm-2 col-md-2"></div>
	</div>
	
</div>
<%}
catch(Exception e){}%>
</body>
<style>
#aa 
{
	text-transform: uppercase;
}
</style>
</html>