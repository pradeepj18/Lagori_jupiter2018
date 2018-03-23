<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Tournament</title>
<meta name="viewpoint" content="width=device-width,initial-scale=1">


<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/bootstrap.js"></script>
<script src="js/bootstrap.min.js"></script>

<!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css"> -->
	
<script src="js/jquery-1.9.1.min.js"></script>
<script src="js/jquery-1.12.4.js"></script>
	<script src="js/jquery-ui.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">

<link rel="stylesheet" href="css/datepicker.css">
<script src="js/bootstrap-datepicker.js"></script>

<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<script type="text/javascript">
	// When the document is ready
	$(document).ready(function() {

		$('#example1').datepicker({
			format : "yyyy/mm/dd"
		});

	});
</script>
<script type="text/javascript">
	// When the document is ready
	$(document).ready(function() {

		$('#example2').datepicker({
			format : "yyyy/mm/dd"
		});

	});
</script>
<script>


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


/* MOBILE */
@media (min-width:480px) and (orientation: portrait)
{
#topbar
{
font-size:30px;
	background-color: #00001a;
	padding:6px 0px;
	color:white;
	height: 28px;
}
#aa 
{
	text-transform: uppercase;
}
.align
{
text-align:right;
}

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
		font-size:20pt;
		color:#ffffff;
		margin-top:-4.9%;
		margin-left:20%;
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
		width:80%;
		float:left;
		margin-left:10%;
	}
}

/* MOBILE */
@media (min-width:768px) and (orientation: landscape)
{

#aa 
{
	text-transform: uppercase;
}
.align
{
text-align:right;
}
	#team-bar
	{
		background:#030825;
		width:120%;
		float:left;
		border-radius:5px;
		margin-top:1%;
		margin-left:1%;
	}
	#team-text
	{
		float:left;
		font-size:25pt;
		color:#ffffff;
		margin-top:-5.0%;
		margin-left:32%;
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
		width:80%;
	}
}


/* LAPTOP */
@media (min-width:992px)
{
body{
background-color:white;
}
.bgcolor
{
background-color:#f9f9d9;
}

#aa 
{
	text-transform: uppercase;
	margin-top:7%;
	height: 14%;	
}
.aaa
{
	text-transform: uppercase;
	margin-top:7%;	
	height:20px;
}
.align
{
text-align:right;
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
		font-size:20pt;
		color:#ffffff;
		margin-top:-3.7%;
		margin-left:30%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:75%;
	}
	.team-container
	{
		background-color:white;
		border-radius:7px;
		width:90%;
		float:left;
		margin-left:5%;
	}
	#tournamentlabel
	{
		float:left;
		margin-top:4%;
		font-size:15pt;
	}
	.tourlogo
	{
		float:left;
		margin-top:-1%;
		font-size:16pt;
		margin-right:-10%;
	}
	.tourlogo1
	{
		margin-left:16%;
		margin-top:-1%;
		font-size:16pt;
		
	}
}

</style>
</head>

<body onload="startTime()">

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
			<nav class="navbar navbar-inverse" style="background-color:#2045a5;">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#myHeader"
						aria-expanded="false">
						<span class="sr-only"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span> <span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>

				<div class="collapse navbar-collapse" id="myHeader">
					
					<ul class="nav navbar-nav">
					<li style="margin-left:-120px"><a href="home.jsp"><font color="white">HOME</font></a></li>
						
						<!-- <a href="tournament.jsp" role="button"><font color="white">TOURNAMENT</font></a> -->
						<li class="nav-item dropdown active"><a
							class="nav-link dropdown-toggle" 
							href="" style="padding: 16px;">TOURNAMENT<span class="sr-only">(current)</span></a></li>
						
					

				<!-- 		<li><a href="addTeam.jsp"><font color="white">ADD TEAMS</font></a></li> -->
						<li><a href="#"><font color="white">UPDATE</font></a></li>
						<li><a href="#"><font color="white">SELECT MATCH</font></a></li>	
						<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
						<li><a href="#"><font color="white">STATISTICS</font></a></li>
					</ul>
				</div>
			</div>
			</nav>
		</div>

		<div class="row ">
			<div class="col-xs-4 col-sm-2 col-md-2"></div>
			<div class="col-xs-4 col-sm-8 col-md-8">
				<div class="team-container">
					<div class="row" id="team-bar">
						<div class="col-xs-12 col-md-12"><br><br></div>
					</div>
					<div id="team-text">
						<center>Add Tournament Details</center>
					</div>
					<form action="addTournament" method="post" enctype="multipart/form-data">
						<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8" >
								<label for="tournament_name"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Name</label>
								<div class="col-md-6 col-xs-6 " >
									<input type="text" class="form-control" name="tourname"
										size="5" placeholder="Tournament Name" autofocus required
										id="aa">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ><br></div>
						</div>
				
				
				<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_title"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Title</label>
								<div class="col-md-6 col-xs-6">
									<input type="text" class="form-control" name="tourtitle"
										size="5" placeholder="Tournament Title" 
										id="aa">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
		<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_venue"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Venue</label>
								<div class="col-md-6 col-xs-6">
									<input type="text" class="form-control" name="tourvenue"
										size="5" placeholder="Tournament Venue" required
										id="aa">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
					
							<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_orgby"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Org. By</label>
								<div class="col-md-6 col-xs-6">
									<input type="text" class="form-control" name="tourorgby"
										size="5" placeholder="Tournament Org. By"  required
										id="aa">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>

		<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_sdate"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Start Date</label>
								<div class="col-md-6 col-xs-6">
									<input type="text" class="form-control aaa" style="height: 14%" name="toursdate"
										size="5" placeholder="Click here to pick date" required
										id="example1">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
		<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_edate"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									End Date</label>
								<div class="col-md-6 col-xs-6">
									<input type="text" class="form-control aaa" style="height: 14%" name="touredate"
										size="5" placeholder="Click here to pick date" required
										id="example2">
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_level"
									class="col-md-6 col-xs-6 col-form-label" id="tournamentlabel">Tournament
									Age Level</label>
								<div class="col-md-6 col-xs-6">
									<select class="selectpicker" id="aa" name="tourage">
										<option>Select Age</option>
										<option>U-11</option>
										<option>U-12</option>
										<option>U-14</option>
										<option>U-17</option>
										<option>U-19</option>
										<option>Senior</option>
										<option>World Cup</option>
										
									</select>
								</div>
								<br>&nbsp;
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
							
							<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
								<label for="tournament_logo"
									class="col-md-6 col-xs-6 col-form-label tourlogo">Tournament
									Logo</label>
								<div class="col-md-6 col-xs-6">
					<div class="col-md-8 col-xs-12 tourlogo1">
						<input type="file" class="form-control" name="tflag" onchange="readURL(this);" size="10" >
					</div>
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
						
						
						<div class="row bgcolor">
							<div class="col-md-2 col-xs-2" ></div>
							<div class="col-md-8 col-xs-8">
							
								<div class="col-md-6 col-xs-6">
					<div class="col-md-8 col-xs-12 tourlogo1">
						 <img id="blah" src="#" alt="" />
					</div>
								</div>
							</div>
							<div class="col-md-2 col-xs-2" ></div>
						</div>
						
						
						 
<br>
		
		<div class="form-group ">
				<div class="col-md-3"></div>
				<div class="col-md-6 col-xs-12">
					<label for="team_name" class="col-md-4 col-xs-8 col-form-label" id="teamlabel"></label>
					<div class="col-md-8 col-xs-12 ">
						 <input type="submit" class="btn btn-info" value="Add Tournament">
					<br>&nbsp;
					</div>
					
				</div>
				<div class="col-md-3"></div>
				</div> 
					</form>
				</div>
			</div>
			<div class="col-xs-4 col-sm-2 col-md-2"></div>
		</div>
		
	</div>


</body>
</html>