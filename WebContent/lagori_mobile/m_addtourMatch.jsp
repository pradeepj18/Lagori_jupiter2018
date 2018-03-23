<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add Tournament Matches</title>
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
	<br>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2"></div>
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
			<div class="col-md-4 col-xs-12 col-sm-12 center">
				<select id="poolName" class="form-control" data-size="5">
					<option value="1">Pool A</option>
					<option value="2">Pool B</option>
					<option value="3">Pool C</option>
					<option value="4">Pool D</option>
					<option value="5">Pool E</option>
					<option value="6">Pool F</option>
					<option value="7">Pool G</option>
					<option value="8">Pool H</option>

				</select>
			</div>
			<%
				} catch (Exception e) {
					System.out.println("Error in gender,team,official in first row : " + e.getMessage());
				}
			%>
			<div class="col-md-2"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-3">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>POOL TEAM</h4>
					</div>
					<div class="panel-body tournext-panel-body">
						<%
							try {
						%>

						<%
							ResultSet rs1 = null;

								rs1 = DBManager.fetchQuery("select pname,count(pname) as count from tourPool where tourId="
										+ request.getParameter("tourId") + " and tpGender='" + request.getParameter("gen")
										+ "' group by pname;");
								ResultSet rs2 = null;
								if (rs1.next()) {
									rs1.beforeFirst();
									while (rs1.next()) {
						%>
						<div class="list-group-item">
							&nbsp;
							<p>
								<b>POOL &#<%=64 + rs1.getInt("pname")%></b>
							</p>
							<button type='button' class='btn btn-info' data-toggle='collapse'
								data-target='#demo<%=rs1.getInt("pname")%>'
								style="float: right; margin-right: 10%; margin-top: -8%; background-color: #ce042d; border-color: #ce042d;">
								<b><%=rs1.getInt("count")%></b>
							</button>
							<br>

							<div id="demo<%=rs1.getInt("pname")%>" class="collapse">
								<%
									rs2 = DBManager.fetchQuery(
														"select distinct(ttId),(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tp.ttId and tt.tourId="
																+ request.getParameter("tourId")
																+ ") as tName from tourPool tp where tpgender ='" + request.getParameter("gen")
																+ "' and pname =" + rs1.getInt("pname") + " and tourId="
																+ request.getParameter("tourId") + ";");
												if (rs2.next()) {
													rs2.beforeFirst();
													while (rs2.next()) {
								%>
								&nbsp;&nbsp;<%=rs2.getString("tName")%>
								<div class="del">
									<button type="button" class="btn btn-default btn-sm"
										onclick="deleteConfirm(<%=rs2.getInt("ttId")%>);">
										<span class="glyphicon glyphicon-minus"
											style="cursor: pointer;"></span>
									</button>
								</div>
								<hr>
								<%
									}
												}
								%>
							</div>
						</div>
						<%
							}
									ResultSet lots=DBManager.fetchQuery("select tourId,gender from wmatch where tourId="+request.getParameter("tourId")+" and gender='"+request.getParameter("gen")+"';");
									if(lots.next())
									{
									%>
						<button id="generateLots" disabled
							class="btn btn-success footer submit-btn">GENERATE LOTS</button>

						<%
									}
									else
									{
										%>
										<button id="generateLots"
							class="btn btn-success footer submit-btn">GENERATE LOTS</button>
										<% 
									}
							}
							} catch (Exception e) {
								e.getMessage();
							}
						%>
					</div>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>ADD POOL HERE</h4>
					</div>
					<div class="panel-body tourteam-panel-body">
						<div class="container-fluid">

							<%
								try {
							%>
							<form method="post">
								<%
									ResultSet rs = null;
										rs = DBManager.fetchQuery("select tt.ttId,(select tName from team t where t.tId = tt.tId and tt.tourId="
												+ request.getParameter("tourId") + ") as tName from tourTeam tt where tourId="
												+ request.getParameter("tourId") + " and tt.ttGender ='" + request.getParameter("gen")
												+ "' and tt.ttId not in(select ttId from tourPool where tourId="
												+ request.getParameter("tourId") + ");");
										if (rs.next()) {
								%>
								<select id="source" data-text="Team List"
									data-search="Search for Team">

									<%
										rs.beforeFirst();
												while (rs.next()) {
									%>
									<option value=<%=rs.getInt("ttId")%>>&nbsp;&nbsp;<%=rs.getString("tName")%>
									</option>
									<%
										}
									%>
								</select>
								<%
									} else {
								%>
								<select id="source" data-text="Team List"
									data-search="Search for Team">

								</select>

								<%
									}
								%>
								<select id="destination" data-text="Selected list"
									data-search="Search for Team">
								</select>
								<div class="row">
									<div class="col=md-12 col-xs-12 col-sm-12 center">
										<input class="btn btn-success submit-btn" type="button"
											id="addmem" value="Add Team">
									</div>
								</div>
							</form>
							<%
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
	<br><br>
<!-- --------------------------------------------------------------------------------------------------- -->
	<div class="container-fluid">
		<div class="row">
			<%
				int tourId = Integer.parseInt(request.getParameter("tourId"));
				boolean Mflag = false, Fflag = false;
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
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>FIXTURE - MALE</h4>
						</div>
						<div class="panel-body tourteam-panel-body" style="height:auto;">
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
											<td class="center"><%=Mrs.getInt("mid")%></td>
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
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>FIXTURE - FEMALE</h4>
						</div>
						<div class="panel-body tourteam-panel-body" style="height:auto;">
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
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>FIXTURE - MALE</h4>
						</div>
						<div class="panel-body tourteam-panel-body" style="height:auto;">
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
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>FIXTURE - FEMALE</h4>
						</div>
						<div class="panel-body tourteam-panel-body" style="height:auto;">
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
					<div class="panel panel-default">
						<div class="panel-heading tournext-panel-heading center">
							<h4>FIXTURE - MALE/FEMALE</h4>
						</div>
						<div class="panel-body tourteam-panel-body" style="height:auto;">
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



	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/jquery.listswap.js"></script>
	<script type="text/javascript">
	$('#source, #destination').listswap({
		truncate:true, 
		height:360, 
		is_scroll:true, 
	});
	function addTeam(){
		var node = document.getElementById("destination").options;
		var list = document.getElementById("destination").options.length;
		var teamvalues = [];
		for(var i = 0;i < list;i++){
		   teamvalues[i] = node[i].value;
		   
		}
		teamvalues[i] = document.getElementById("poolName").value;
		i = i+1;
		teamvalues[i] = getParameter("gen");
		i = i+1;
		teamvalues[i] = getParameter("tourId");
		i = i+1;
		$.ajax({
			type:"GET",
			data:{teamvalues:teamvalues},
			url:"../m_addtourMatch",
			success:function(){
				location.replace("m_addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
			}
		});
	}
	function getGender(id)
	{
		location.replace("m_addtourMatch.jsp?gen="+id+"&tourId="+getParameter("tourId"));
	}

	function getParameter(variable)
	{
		var query = window.location.search.substring(1);
		var vars = query.split("&");
		for(var i = 0;i < vars.length;i++)
		{
			var pair = vars[i].split("=");
			if(pair[0] == variable){return pair[1];}
		}
		return (false);
	}

	function deleteConfirm(id)
	{
	    swal({
			  title: "Are you sure to delete?",
			  text: "",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Proceed",
			  cancelButtonText: "No, cancel pls!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) 
			  {
				  deletePool(id);
			      swal({
					  title: "Data Deleted Successfully",
					  text: "",
					  timer: 500,
					  showConfirmButton: false
					});
			  } else {
				    swal("Cancelled", "Data rejected :)", "error");
					return false;
			  }
			});
	 }


	function deletePool(id)
	{
		var tourId=getParameter("tourId");
		var gen=getParameter("gen");
		var xmlhttp = false;
		
		if(window.XMLHttpRequest)
		{ 	
			xmlhttp=new XMLHttpRequest();
		}
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function()
			{
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					location.replace("m_addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
				}
			};
		}
		xmlhttp.open("GET","../m_deletePool?tourId="+tourId+"&ttId="+id+"&gen="+gen,true);
		xmlhttp.send(null);
		
	}


	$("#addmem").click(function(){
		var pool = document.getElementById("poolName");
		poolname = pool.options[pool.selectedIndex].text;
		if(getParameter("gen") == "M"){
			gen = "MALE";
		}
		else if(getParameter("gen") == "F"){
			gen = "FEMALE";
		}
		if(document.getElementById("destination").options.length <= 0){
			swal("Select Teams to add","");
			return false;
		}
		swal({
			  title: "Are you sure to add?",
			  text: "You are adding "+document.getElementById("destination").options.length+" teams of "+gen+" in "+poolname+"",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Proceed",
			  cancelButtonText: "No, cancel pls!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) 
			  {
				  addTeam();
			      swal({
					  title: "Data Added Successfully",
					  text: "",
					  timer: 500,
					  showConfirmButton: false
					});
			  } else {
				    swal("Cancelled", "Data rejected :)", "error");
					return false;
			  }
			});
	});

	$("#generateLots").click(function(){

		if(getParameter("gen") == "M"){
			gen = "MALE";
		}
		else if(getParameter("gen") == "F"){
			gen = "FEMALE";
		}
		
		swal({
			  title: "Are you sure to add?",
			  text: "Genrating Lots for "+gen+" teams",
			  type: "warning",
			  showCancelButton: true,
			  confirmButtonColor: "#DD6B55",
			  confirmButtonText: "Proceed",
			  cancelButtonText: "No, cancel pls!",
			  closeOnConfirm: false,
			  closeOnCancel: false
			},
			function(isConfirm){
			  if (isConfirm) 
			  {
				  generateLots();
			      swal({
					  title: "Data Added Successfully",
					  text: "",
					  timer: 500,
					  showConfirmButton: false
					});
			  } else {
				    swal("Cancelled", "Data rejected :)", "error");
					return false;
			  }
			});
	});


	function generateLots(){
		
		var xmlhttp = false;
		
		if(window.XMLHttpRequest)
		{ 	
			xmlhttp=new XMLHttpRequest();
		}
		
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function()
			{
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					
					//showmatchschedule();
					//location.replace("m_addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen")); */
				}
			};
		}
		xmlhttp.open("get","../m_wclots?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"),true);
		xmlhttp.send(null);
	}

	/* function showmatchschedule()
	{
		var xmlhttp = false;
		var tourId = getParameter("tourId");
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();	
		}
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function()
			{
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					document.getElementById("matchschedule").innerHTML = xmlhttp.responseText;
				}
			};
		}
		xmlhttp.open("GET","matchschedule.jsp?tourId="+tourId,true);
		xmlhttp.send(null);
		
	} */
	</script>
</body>
</html>