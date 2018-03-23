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

.list-group-item {
	padding: 0px 0px;
	width: 105%;
}

p {
	margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
	margin-top: -2%;
	margin-left: 7%;
}

.del {
	float: right;
	margin-right: 10%;
}
.mftotal {
	float: right;
	margin-right: 10%;
	margin-top: -8%;
	background-color: #ce042d;
	border-color: #ce042d;
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
			<div class="col-md-3"></div>
			<div class="col-md-6 col-xs-12 col-sm-12 center">
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
			<div class="col-md-3"></div>
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
							String count = "";
								DBManager.loadDriver();
								ResultSet rs1 = null, rs2 = null;
								rs1 = DBManager
										.fetchQuery("select distinct(select count(ttId) from tourTeam where ttGender ='M' and tourId="
												+ request.getParameter("tourId")
												+ ") as mcount,(select count(ttId) from tourTeam where ttGender ='F' and tourId="
												+ request.getParameter("tourId") + ") as fcount from tourTeam;");
								if (rs1.next()) {
									if (rs1.getInt("mcount") < 10)
										count = 0 + "" + rs1.getInt("mcount");
									else
										count = "" + rs1.getInt("mcount");
						%>
						<div class="list-group-item">
							&nbsp;
							<p>
								<b>MALE TEAM</b>
							</p>
							<button type='button' class='btn btn-info mftotal'
								data-toggle='collapse' data-target='#demo1'>
								<b><%=count%></b>
							</button>
							<br>
							<div id="demo1" class="collapse">
								<%
									rs2 = DBManager.fetchQuery(
													"select tt.ttId,t.tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="
															+ request.getParameter("tourId") + " and tt.ttGender='M';");
											while (rs2.next()) {
								%>
								&nbsp;&nbsp;<%=rs2.getString("tName")%>
								<div class="del">
									<button type="button" class="btn btn-default btn-sm"
										onclick="deleteConfirm(<%=rs2.getInt("ttId")%>,'M');">
										<span class="glyphicon glyphicon-minus"
											style="cursor: pointer;"></span>
									</button>
								</div>
								<hr>

								<%
									}
								%>
							</div>
						</div>
						<%
							if (rs1.getInt("fcount") < 10)
										count = 0 + "" + rs1.getInt("fcount");
									else
										count = "" + rs1.getInt("fcount");
						%>
						<div class="list-group-item">
							&nbsp;
							<p>
								<b>FEMALE TEAM</b>
							</p>
							<button type='button' class='btn btn-info mftotal'
								data-toggle='collapse' data-target='#demo2'>
								<b><%=count%></b>
							</button>
							<br>
							<div id="demo2" class="collapse">
								<%
									rs2 = null;
											rs2 = DBManager.fetchQuery(
													"select tt.ttId,t.tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="
															+ request.getParameter("tourId") + " and tt.ttGender='F';");
											while (rs2.next()) {
								%>
								&nbsp;&nbsp;<%=rs2.getString("tName")%>
								<div class="del">
									<button type="button" class="btn btn-default btn-sm"
										onclick="deleteConfirm(<%=rs2.getInt("ttId")%>,'F')">
										<span class="glyphicon glyphicon-minus"
											style="cursor: pointer;"></span>
									</button>
								</div>
								<hr>
								<%
									}
								%>
							</div>
						</div>
						<%
							}
						%>
					</div>

					<%
						} catch (Exception e) {
							e.getMessage();
						}
					%>
				</div>
			</div>
			<div class="col-xs-12 col-sm-12 col-md-9">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center"><h4>ADD TEAMS HERE</h4></div>
					<div class="panel-body tourteam-panel-body">
						<div class="container-fluid">
							
<%try{ %>
							<form method="post">
								<%
									ResultSet rs = null;
									rs = DBManager
											.fetchQuery("select tId,tName from team where tId not in(select tId from tourTeam where ttGender='"
													+ request.getParameter("gen") + "' and tourId=" + request.getParameter("tourId")
													+ ") order by tname asc;");
								%>
								<select id="source" data-text="Team list"
									data-search="Search for team">
									<%
										while (rs.next()) {
									%>
									<option value=<%=rs.getInt("tId")%>>&nbsp;&nbsp;<%=rs.getString("tName")%>
									</option>
									<%
										}
									%>
								</select> <select id="destination" data-text="Selected list"
									data-search="Search for team">
								</select> 
								<div class="row">
								<div class="col=md-12 col-xs-12 col-sm-12 center">
								<input class="btn btn-success submit-btn" type="button" id="addmem"
									value="Add Team">
								
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
	<script
		src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
	<script src="../js/jquery.listswap.js"></script>
	<script>
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
	teamvalues[i] = getParameter("gen");
	i = i+1;
	teamvalues[i] = getParameter("tourId");
	i = i+1;
	$.ajax({
		type:"GET",
		data:{teamvalues:teamvalues},
		url:"../m_addtourTeam",
		success:function(){
			location.replace("m_addtourTeam.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
		}
	});
}
function getGender(id)
{
	location.replace("m_addtourTeam.jsp?gen="+id+"&tourId="+getParameter("tourId"));
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

function deleteConfirm(id,gen)
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
			  deleteTeam(id,gen);
		      swal({
				  title: "Data Deleted Successfully",
				  text: "",
				  timer: 100,
				  showConfirmButton: false
				});
		  } else {
			    swal("Cancelled", "Data rejected :)", "error");
				return false;
		  }
		});
  
    
}


function deleteTeam(id,gen)
{
	var tourId=getParameter("tourId");
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
				location.replace("m_addtourTeam.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
			}
		};
	}
	xmlhttp.open("GET","../m_deleteTeam?tourId="+tourId+"&ttId="+id+"&gen="+gen,true);
	xmlhttp.send(null);
	
}




$("#addmem").click(function(){
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
		  text: "You are adding "+document.getElementById("destination").options.length+" teams of "+gen+"",
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


</script>
</body>
</html>