<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Update Details</title>
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
<script type="text/javascript">
	$(document).ready(function() {
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
					<li ><a
						href="m_selectMatch.jsp?tourId=<%=request.getParameter("tourId")%>">SELECT
							MATCH</a></li>

					<li class="dropdown active"><a class="dropdown-toggle"
						data-toggle="dropdown" href="#">UPDATE <span class="caret"></span>
					</a>
						<ul class="dropdown-menu">

							<li><a
								href="m_updateindex.jsp?tourId=<%=request.getParameter("tourId")%>">Tournament Details</a></li>
							<li ><a
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
			<div class="col-md-2"></div>
			<div class="col-md-4 col-xs-12 col-sm-12 center">
				<h4>
					SELECT GENDER &nbsp;&nbsp; <input type="radio" name="gen" value="M"
			 onclick="showmatch();" id="m">Male&nbsp; <input
						type="radio" name="gen" value="F" onclick="showmatch();" id="f">Female&nbsp;

				</h4>
			</div>

			<div class="col-md-4 col-xs-12 col-sm-12 center">

				<select id="memcategory" class="form-control" data-size="5"
					onchange="showHMR();">
					
					 <option value="1">HIT</option>
		      <option value="2">MISS</option>
		      <option value="3">RESTORE</option>
		      <option value="4">WICKET</option>
				</select>
			</div>

			<div class="col-md-2"></div>
		</div>
<br>
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>SELECT MATCH HERE</h4>
					</div>
					<div class="panel-body tournext-panel-body">
					<div id="smatch"></div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12">
			<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>UPDATE MATCH DETAILS HERE</h4>
					</div>
					<div class="panel-body tournext-panel-body">
					<div id="showHMR"></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script>
	var matchid;
function showmatch()
{
	var tourId = getParameter("tourId");
	var gen = '';
	if(document.getElementById("m").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("f").checked)
	{
		gen = 'F';
	}
	
	var xmlhttp = false;
	
 	if(window.XMLHttpRequest)
	{
		xmlhttp= new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
			{
				document.getElementById("smatch").innerHTML=xmlhttp.responseText;
				  
			}
		};
	}
	xmlhttp.open("GET","m_update_showmatchAx.jsp?tourId="+tourId+"&gen="+gen,true);
	
	xmlhttp.send(null);

 }

function showHMR()
{

	var cat = document.getElementById("memcategory").value;
	var tourId =getParameter("tourId");
	var gen = '';
	if(document.getElementById("m").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("f").checked)
	{
		gen = 'F';
	}
	var xmlhttp = false;
	if(window.XMLHttpRequest)
	{
		xmlhttp = new XMLHttpRequest();
	}
	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status ==200)
			{
				document.getElementById("showHMR").innerHTML=xmlhttp.responseText;
				
			}
		};
	}
	xmlhttp.open("GET","m_updatehmrwAx.jsp?tourId="+tourId+"&mid="+window.mmid+"&memcategory="+cat+"&ttGender="+gen,true);
	xmlhttp.send(null);

}

function updateConfirm(id,mid,category,mark,tid)
{
    var x;
    
    if (confirm("Are You Sure To Update!") == true) 
    {
    	updateplayer(id,mid,category,mark,tid);
    }
}

function deleteConfirm(id,mid,category,mark)
{
    var x;
    if (confirm("Are You Sure To Delete!") == true) 
    {
    	deleteplayer(id,mid,category,mark);
    	
    }
}
function get_mmid(mmid)
{
	 matchid=mmid;
	 window.mmid=mmid;
}
function updateplayer(id,mid,category,mark,tid)
{	
	var tourId = getParameter("tourId");
	if(category == 1 || category == 2 || category == 3)
	{
		var barcodeId=document.getElementById("jerseyNo"+mark).value;
	}
	var htype=document.getElementById("htype"+mark).value;
	var ttId=document.getElementById("tname"+mark).value;
	
	if(category == 3)
	{	
		var score=document.getElementById("score"+mark).value;
	}
	if(category == 4)
	{
		var barcodeId1 = document.getElementById("jerseyNo1"+mark).value;
		var barcodeId2 = document.getElementById("jerseyNo2"+mark).value;
	}
	var xmlhttp=false;
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
				showHMR();
			}
		};
	};
	xmlhttp.open("GET","m_updatedeletehmrServ.jsp?tourId="+tourId+"&mid="+mid+"&id="+id+"&barcodeId="+barcodeId+"&htype="+htype+"&ttId="+ttId+"&barcodeId1="+barcodeId1+"&barcodeId2="+barcodeId2+"&score="+score+"&category="+category+"&flag=1&tid="+tid,true);
	xmlhttp.send(null);
	
}



function deleteplayer(id,mid,category,mark)
{
	var tourId = getParameter("tourId");
	/* var barcodeId=document.getElementById("jerseyNo"+mark).value; */
	var htype=document.getElementById("htype"+mark).value;
	var ttId=document.getElementById("tname"+mark).value;
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
				showHMR();
			}
		};
	}
	xmlhttp.open("GET","m_updatedeletehmrServ.jsp?tourId="+tourId+"&mid="+mid+"&id="+id+"&category="+category+"&flag=2&ttId="+ttId,true);
	xmlhttp.send(null);
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
</script>
</body>
</html>