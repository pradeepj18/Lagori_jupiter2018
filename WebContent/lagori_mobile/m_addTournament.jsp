<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Add Tournament</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/mobile_home.css">
<link rel="stylesheet" href="../css/m_tourinsert.css">
<link rel="stylesheet" href="../css/m_insert.css">

<link rel="stylesheet" href="../css/datepicker.css">
<script src="../js/bootstrap-datepicker.js"></script>

<style type="text/css">
</style>
<script type="text/javascript">
	// When the document is ready
	$(document).ready(function() {

		$('#example1').datepicker({
			format : "yyyy/mm/dd"
		});
		$('#example2').datepicker({
			format : "yyyy/mm/dd"
		});

	});

	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();

			reader.onload = function(e) {
				$('#blah').attr('src', e.target.result).width(150).height(100);
			};

			reader.readAsDataURL(input.files[0]);

		}
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

					<li class="dropdown active"><a class="dropdown-toggle"
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

	<div class="container">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-xs-12 col-sm-12 col-md-6">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">ADD
						TOURNMENT DETAILS</div>
					<div class="panel-body tournext-panel-body">

						<form action="../m_addTournament" method="post"
							enctype="multipart/form-data">
							<div class="row">
								<label for="tournament_name"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Name</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control" name="tourname"
										placeholder="Tournament Name" autofocus required id="aa">
								</div>
							</div>

							<div class="row">
								<label for="tournament_title"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Title</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control" name="tourtitle"
										placeholder="Tournament Title" id="aa">
								</div>
							</div>
							<div class="row">
								<label for="tournament_venue"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Venue </label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control" name="tourvenue"
										placeholder="Tournament Venue" required id="aa">
								</div>

							</div>

							<div class="row">
								<label for="tournament_orgby"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Org. By</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control" name="tourorgby"
										placeholder="Tournament Org. By" required id="aa">
								</div>
							</div>

							<div class="row">
								<label for="tournament_sdate"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Start Date</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control aaa" name="toursdate"
										placeholder="Click here to pick date" required id="example1">
								</div>

							</div>
							<div class="row">
								<label for="tournament_edate"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament End Date</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="text" class="form-control aaa" name="touredate"
										placeholder="Click here to pick date" required id="example2">
								</div>
							</div>
							<div class="row">
								<label for="tournament_level"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label"
									id="tournamentlabel">Tournament Age Level</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<select class="form-control" id="aa" name="tourage">
										<option value="-1">Select Age</option>
										<option value="U-11">U-11</option>
										<option value="U-12">U-12</option>
										<option value="U-14">U-14</option>
										<option value="U-17">U-17</option>
										<option value="U-19">U-19</option>
										<option value="Senior">Senior</option>
										<option value="wc">World Cup</option>

									</select>
								</div>
							</div>

							<div class="row">
								<label for="tournament_logo"
									class="col-md-6 col-xs-12 col-sm-6 col-form-label tourlogo">Tournament
									Logo</label>
								<div class="col-md-6 col-xs-12 col-sm-6">
									<input type="file" class="form-control" name="tflag"
										onchange="readURL(this);">
								</div>
							</div>

							<div class="row">
								<div class="col-md-4"></div>
								<div class="col-md-4 col-xs-12 col-sm-12 tourlogo1">
									<img id="blah" src="#" alt="" />
								</div>
								<div class="col-md-4"></div>
							</div>
							<br>
							<div class="row">

								<div class="col-md-12 col-xs-12 center">
									<input type="submit" class="btn btn-info submit-btn"
										value="Add Tournament"> <br>&nbsp;
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<div class="col-md-3"></div>
		</div>
	</div>
</body>

</html>