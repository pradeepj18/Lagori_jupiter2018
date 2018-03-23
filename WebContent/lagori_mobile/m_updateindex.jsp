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
			<div class="col-md-2"></div>
			<div class="col-md-4 col-xs-12 col-sm-12 center">
				<h4>
					SELECT GENDER &nbsp;&nbsp; <input type="radio" name="gen" value="M"
			 onclick="showteam();" id="m">Male&nbsp; <input
						type="radio" name="gen" value="F" onclick="showteam();" id="f">Female&nbsp;

				</h4>
			</div>

			<div class="col-md-4 col-xs-12 col-sm-12 center">

				<select id="memcategory" class="form-control" data-size="5"
					onchange="showplayer();">
					<option value="1">Player</option>
					<option value="2">Coach</option>
					<option value="3">Manager</option>
					<option value="4">Official</option>
					<option value="5">Team</option>
				</select>
			</div>

			<div class="col-md-2"></div>
		</div>
<br>
		<div class="row">
			<div class="col-md-4 col-xs-12 col-sm-12">
				<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>SELECT TEAM HERE</h4>
					</div>
					<div class="panel-body tournext-panel-body">
					<div id="showteam"></div>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-xs-12 col-sm-12">
			<div class="panel panel-default">
					<div class="panel-heading tournext-panel-heading center">
						<h4>UPDATE HERE</h4>
					</div>
					<div class="panel-body tournext-panel-body">
					<div id="showplayer"></div>
					</div>
				</div>
			</div>
			
		</div>
	</div>
	<script>
function showteam()
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
				document.getElementById("showteam").innerHTML=xmlhttp.responseText;
				  
			}
		};
	}
	xmlhttp.open("GET","m_update_showteamAx.jsp?tourId="+tourId+"&ttGender="+gen,true);
	
	xmlhttp.send(null);

 }
 function get_ttId(ttId)
 {
	 window.ttid=ttId;
 }
function showplayer()
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
				document.getElementById("showplayer").innerHTML=xmlhttp.responseText;
				if(cat==4 || cat==5)
				{
					document.getElementById("showteam").innerHTML="";
					
				}
				else
					showteam();
			}
		};
	}
	xmlhttp.open("GET","m_updateallAx.jsp?tourId="+tourId+"&ttId="+window.ttid+"&memcategory="+cat+"&ttGender="+gen,true);
	xmlhttp.send(null);

}

function updateplayer(id,category,gen)
{
	var fName='',lName='',mName='';;
	if(category != 5)
	{
		fName = document.getElementById("fName"+id).value;
		mName = document.getElementById("mName"+id).value;
		lName = document.getElementById("lName"+id).value;

	}
	var tName='';
	
	if(category == 5){tName = document.getElementById("tName"+id).value;}
	var jerseyNo='';
	if(category == 1){jerseyNo = document.getElementById("jerseyNo"+id).value;}
	
	var tourId = getParameter("tourId");
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
				showplayer();
				if(category==4 || category==5)
				{
					document.getElementById("showteam").innerHTML="";
					
				}
				else
					showteam();
			}
		};
	};
	//alert("m_updatedeleteplayerAx.jsp?tourId="+tourId+"&ttId="+window.ttid+"&barcodeId="+id+"&fName="+fName+"&mName="+mName+"&lName="+lName+"&jerseyNo="+jerseyNo+"&tName="+tName+"&category="+category+"&flag=1");
	xmlhttp.open("GET","m_updatedeleteplayerAx.jsp?tourId="+tourId+"&ttId="+window.ttid+"&barcodeId="+id+"&fName="+fName+"&mName="+mName+"&lName="+lName+"&jerseyNo="+jerseyNo+"&tName="+tName+"&category="+category+"&flag=1",true);
	xmlhttp.send(null);
	
}

function updateConfirm(id,category,gen)
{
    var x;
    if (confirm("Are You Sure To Update!") == true) 
    {
    	updateplayer(id,category,gen);
    }
}
function deleteConfirm(id,category,gen)
{
    var x;
    if (confirm("Are You Sure To Delete!") == true) 
    {
    	deleteplayer(id,category,gen);
    }
}

function deleteplayer(id,category,gen)
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
				showplayer();
				if(category==4 || category==5)
				{
					document.getElementById("showteam").innerHTML="";
					
				}
				else
					showteam();
			}
		};
	}
	xmlhttp.open("GET","m_updatedeleteplayerAx.jsp?tourId="+tourId+"&barcodeId="+id+"&category="+category+"&flag=2",true);
	xmlhttp.send(null);
	//showplayer();
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