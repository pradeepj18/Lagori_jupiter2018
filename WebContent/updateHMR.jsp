<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournament</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<style>
body
{
	background:url("images/bg-footer.jpg");
 	
	background-position: center -50px;
	background-repeat: no-repeat;
	background-size:100% 18%;
	position:relative;
	width: 100%;
	height: 50%;
	max-width:100%;
	overflow-x:hidden;
	clear:both; 
	overflow-y:scroll;
}
img#mahaLagori
 {
    -webkit-filter: brightness(100%); /* Chrome, Safari, Opera */
    filter: brightness(100%);
    background-color: #cccccc;
    z-index:-2;
}
.navbar-default {
    background-color: #f8f8f8;
    border-color:#030825;
}

#logo
{
	float:left;
	margin-left:-4.2%;
	width:76%;
}
.com-red
{
	color:#e21e22 !important;
	font-weight:700;
	font-size:15px;
	line-height:20px;
	word-spacing:1.3px;
}
#topbar
{
	color:white;
}
#container-tour-image
{
	background-image:url("images/grnd.jpg");
	background-color: #333;
	background-position: center -10px;
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	float:left;
	margin-left:-3%;
	height:380%;
	margin-top:-20px;
	clear:both;
}
.tour-image-text
{
	color:white;
	float:right;
	margin-top:1%;
	margin-right:30%;
}
.design
{
	background-image:url("images/mahaLagori.png");
	background-color: #333;
	background-position: center 0px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	width: auto;
	height:280%;
}
#tour-tabs
{
	float:left;
	margin-left:4%;
	margin-top:-2.8%;
}
#presentation
{
	background-color:#030825;
	color:white;
	display: block;
    font-size: 12px;
    padding: 10px 30px;
    text-transform: uppercase;
    font-family: 'Open Sans', sans-serif;

}
#presentation1
{
	background-color:#fff;
	color: #030825;
	font-weight: bold;
	display: block;
    font-size: 12px;
    padding: 10px 30px;
    text-transform: uppercase;
    font-family: 'Open Sans', sans-serif;
}
.venue
{
	float:left;
	margin-left:75%;
	margin-top:-15%;
}
.tour-date
{
	float:left;
	margin-left:75%;
	margin-top:-9%;
}
a
{
	font-weight:700;
	color:#333;
	text-decoration:none;
}
a:hover
{
	font-weight:700;
	color:#000;
	text-decoration:none;
}
.add{
	color:red;
}
.teamhead
{
	font-family: 'Open Sans', sans-serif;
	background:  #0E1957;
	color: #ffffff;
    border-left: 1px solid #e4e4e2;
    border-right: 1px solid #e4e4e2;
    border-top: 1px solid #e4e4e2;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    display: block;
    font-size: 16px;
    font-weight: bold;
    padding: 8px 0;
    text-align: center;
    margin-left:13%;
    margin-top: 10%;
}

.teamdropdown
{
	height: 385px;
	width: 87%;
	margin-left: 13%;
	overflow: hidden;
	overflow-y: scroll;
	border-radius: 5px;
	box-shadow: 1px 1px 6px #888888;
}
.teamdropdown::-webkit-scrollbar {
    width: 4px;
}
 
.teamdropdown::-webkit-scrollbar-track {
    -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3); 
    border-radius: 10px;
}
 
.teamdropdown::-webkit-scrollbar-thumb {
    border-radius: 10px;
    -webkit-box-shadow: inset 0 0 6px #333; 
}
.list-group-item
{
	padding:0px 0px;
}
.player-name {
    font-size: 14px;
}
p
{	
	text-align: center;
    margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
    margin-top: -5%;
}
.teamdropdown .stats {
    margin: 5px auto 10px;
    overflow: auto;
    width: 100%;
}
ul
{
	list-style: none;
	padding: 0px 0px 0px 0px;
}
.teamdropdown .stats li {
    border-right: 1px solid #7a7a7a;
    float: left;
    overflow: hidden;
    text-align: center;
    width: 33.33%;
}
li {
    margin-bottom: 0px;
    list-style: none;
    margin: 0px 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}
.teamdropdown .stats li .value {
    font-size: 16px;
    line-height: 16px;
}
.teamdropdown .stats li .value {
    display: block;
    vertical-align: top;
    width: 100%;
}

</style>
</head>
<body onload="startTime();showmatch();">
<%
try
{
	DBManager.loadDriver();
	ResultSet rs=null;
if(request.getParameter("tourId")!=null)
{
//out.println("++++"+request.getParameter("tourId"));
%>
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
				<div class="collapse navbar-collapse" id="myHeader">
				<ul class="nav navbar-nav">
				<li style="margin-left:-80px"><a href="home.jsp"><font color="white">HOME</font></a></li>
					<li>
					
						<a href="tournament.jsp"><font color="white">TOURNAMENT</font></a>
					</li>
					
			<!-- 		<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="updateHMR.jsp?tourId=<%=request.getParameter("tourId") %>" role="button" aria-haspopup="true" aria-expanded="false" style="padding:16.1px;">UPDATE<span class="sr-only">(current)</span></a>
					</li>
					<li><a href="selectMatch.jsp"><font color="white">SELECT MATCH</font></a></li>
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
	<div class="container-fluid">
	<div class="row" id="container-tour-image">
		<div class="col-md-12 col-sm-12 col-lg-12">
		<div class="design">
			<div class="tour-image-text">
			<img src="images/2(1).png" width="1110" height="320" style="float:right;margin-top:-1.2%;margin-right:-41.6%;">
			<img src="images/mahaLagori.png" width="200" height="200" style="float:right;margin-right:-99%;">
			<img src="images/calli(1).png" width="140" height="140" style="float:right;margin-right:-55%;margin-top:1%;">
			<dl class="dl-horizontal venue">
				<dt>VENUE:</dt>
				<dd>Shiv Chatrapati Sports Complex,Balewadi,Pune</dd>
			</dl>
				<dl class="dl-horizontal tour-date">
				<dt>DATE:</dt><dd>27th Sept to 29th Sept 2016</dd>
			 </dl>		 
			
			</div>
		</div>
		</div>
	</div>
	</div>
	<div class="row">
	<ul class="nav nav-tabs" id="tour-tabs">
		<li class="active"><a href="tournamentnext.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">OVERVIEW</a></li>
		<li class="active"><a href="addtour.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">ADD</a></li>
		<li class="active"><a  href="selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">SELECT MATCH</a></li>
		<li class="active"><a  href="updateplayer.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">EDIT PLAYER</a></li>
			<li class="active"><a  href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">VIEW</a></li>
	</ul>
	</div>
	
<!-- 	UPDATE ---------------- -->
	
	<div class="row"><br></div>	
	<div class="row">
	   <div class="col-md-1"></div>
			<div class="col-md-2" id="gender">
				<div class="form-group row">
					<label for="gender"><font size="4px">Gender</font></label><br>
				      	<label class="radio-inline">
	    			    	<input type="radio" name="gen" id="male" checked onclick="showmatch()"><font size="4px">Male</font>
	    				</label>
	    				<label class="radio-inline">
	   						<input type="radio" name="gen" id="female" onclick="showmatch()"><font size="4px">Female</font>
	   					</label>	
				</div>
			</div>
			<div class="col-md-3">
			 <select id="memcategory" class="selectpicker" data-size="5" onchange="showHMR();" style="display: none;">
		      <option value="1">HIT</option>
		      <option value="2">MISS</option>
		      <option value="3">RESTORE</option>
		      <option value="4">WICKET</option>
		     </select>
			</div>
			<div class="col-md-6">
			</div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
			<div class="col-md-5" id="match">
			</div>
			<div class="col-md-6"><div id="showHMR">
			
			</div></div>
	</div>
	
	<%}
}
catch(Exception e){System.out.println("Exception in updateHMR.jsp"+e);}
	%>
<script>
function showmatch()
{
	
	var tourId = getParameter("tourId");
	var gen = '';
	if(document.getElementById("male").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("female").checked)
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
				document.getElementById("match").innerHTML=xmlhttp.responseText;
			    showHMR();
			}
		};
	}
	xmlhttp.open("GET","showmatch.jsp?tourId="+tourId+"&ttGender="+gen,true);
	xmlhttp.send(null);
	
 }
function showHMR()
{
	var gen = '';
	if(document.getElementById("male").checked)
	{
		gen = 'M';
	}
	else if(document.getElementById("female").checked)
	{
		gen = 'F';
	}
	var cat = document.getElementById("memcategory").value;
	var tourId =getParameter("tourId");
	var mid=document.getElementById("select-team").value;
	
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
	xmlhttp.open("GET","updateHitMiss.jsp?tourId="+tourId+"&mid="+mid+"&memcategory="+cat+"&ttGender="+gen,true);
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
	xmlhttp.open("GET","updatedeleteHMR?tourId="+tourId+"&mid="+mid+"&id="+id+"&barcodeId="+barcodeId+"&htype="+htype+"&ttId="+ttId+"&barcodeId1="+barcodeId1+"&barcodeId2="+barcodeId2+"&score="+score+"&category="+category+"&flag=1&tid="+tid,true);
	xmlhttp.send(null);
	
}


function deleteConfirm(id,mid,category,mark)
{
    var x;
    if (confirm("Are You Sure To Delete!") == true) 
    {
    	deleteplayer(id,mid,category,mark);
    	
    }
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
	xmlhttp.open("GET","updatedeleteHMR?tourId="+tourId+"&mid="+mid+"&id="+id+"&category="+category+"&flag=2&ttId="+ttId,true);
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
<br>
</div>
</body>
</html>