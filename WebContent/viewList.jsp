<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Menu</title>
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
</head>
<style>
body {
	background: url("images/bg-footer.jpg");
	background-position: center -50px;
	background-repeat: no-repeat;
	background-size: 100% 18%;
	position: relative;
	width: 100%;
	height: 50%;
	max-width: 100%;
	overflow-x: hidden;
	clear: both;
	overflow-y:scroll;		
}

img#mahaLagori {
	-webkit-filter: brightness(100%); /* Chrome, Safari, Opera */
	filter: brightness(100%);
	background-color: #cccccc;
	z-index: -2;
}

.navbar-default {
	background-color: #f8f8f8;
	border-color: #030825;
}

#logo {
	float: left;
	margin-left: -4.2%;
	width: 76%;
}

.com-red {
	color: #e21e22 !important;
	font-weight: 700;
	font-size: 15px;
	line-height: 20px;
	word-spacing: 1.3px;
}

#topbar {
	color: white;
}

#container-tour-image {
	background-image: url("images/grnd.jpg");
	background-color: #333;
	background-position: center -10px;
	background-repeat: no-repeat;
	background-size: cover;
	width: 100%;
	float: left;
	margin-left: -3%;
	height: 380%;
	clear: both;
	margin-top:-20px;
}

.tour-image-text {
	color: white;
	float: right;
	margin-top: 1%;
	margin-right: 30%;
}

.design {
	background-image: url("images/mahaLagori.png");
	background-color: #333;
	background-position: center 0px;
	background-repeat: no-repeat;
	background-size: 100% 100%;
	width: auto;
	height: 280%;
}

#tour-tabs {
	float: left;
	margin-left: 4%;
	margin-top: -2.8%;
}

#presentation {
	background-color: #030825;
	color: white;
	display: block;
	font-size: 12px;
	padding: 10px 30px;
	text-transform: uppercase;
	font-family: 'Open Sans', sans-serif;
}

#presentation1 {
	background-color: #fff;
	color: #030825;
	font-weight: bold;
	display: block;
	font-size: 12px;
	padding: 10px 30px;
	text-transform: uppercase;
	font-family: 'Open Sans', sans-serif;
}

.venue {
	float: left;
	margin-left: 75%;
	margin-top: -15%;
}

.tour-date {
	float: left;
	margin-left: 75%;
	margin-top: -9%;
}

.teamhead {
	font-family: 'Open Sans', sans-serif;
	background: #0E1957;
	/* background-color:#e21e22; */
	color: #ffffff;
	border-left: 1px solid #e4e4e2;
	border-right: 1px solid #e4e4e2;
	border-top: 1px solid #e4e4e2;
		border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	display: block;
	font-size: 20px;
	padding: 5px;
	text-align: center;
	margin-left: 10%;
	margin-right:10%;
}

.teamdropdown {
	height: relative;
	width: 80%;
	margin-left: 10%;	
	border-radius: 15px;
	box-shadow:  2px 10px 10px #888888;
	text-align:center;

}

.teamhead1 {
	font-family: 'Open Sans', sans-serif;
	background: #0E1957;
	/* background-color:#e21e22; */
	color: #ffffff;
	border-left: 1px solid #e4e4e2;
	border-right: 1px solid #e4e4e2;
	border-top: 1px solid #e4e4e2;
	border-top-left-radius: 5px;
	border-top-right-radius: 5px;
	border-bottom-left-radius: 5px;
	border-bottom-right-radius: 5px;
	display: block;
	font-size: 20px;
	text-align: center;
	margin-left:-2%;
	margin-right: 2%;
	padding:5px;
}

.teamdropdown1 {
border-left: 1px solid #e4e4e2;
	border-right: 1px solid #e4e4e2;
display: block;
	height: relative;
	width: 100%;
	margin-left:-2%;
	margin-right:20%;
	border-radius: 15px;
	box-shadow:  2px 10px 10px #888888;
	

}
.btn-disp
{

font-size:15pt;
 width:100%;
 
}
@media print
{
#print
{
visibility:hidden;
}
}
</style>
<body onload="startTime();">
<%
try
{
	ResultSet rs=null;
DBManager.loadDriver();
if(request.getParameter("tourId")!=null)
{
//out.println("++++"+request.getParameter("tourId"));
%>
<div class="container-fluid" style="background-color:#030825;"  id="print">
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
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myHeader" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				<div class="collapse navbar-collapse" id="myHeader" >
				<ul class="nav navbar-nav">
				<li style="margin-left:-120px"><a href="home.jsp"><font color="white">HOME</font></a></li>
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false" style="padding:16px;">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
			<!-- 		<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li><a href="#"><font color="white">SELECT MATCH</font></a></li>
					<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
					<li><a href="#"><font color="white">STATISTICS</font></a></li>
				</ul>
				</div>
			</div>
		</nav>
	</div>
	<div class="container-fluid">
	<div class="row" id="container-tour-image">
		<div class="col-md-12 col-sm-12 col-lg-12">
		<div class="design">
			<div class="tour-image-text">
			<img src="images/2(1).png" width="1111" height="320" style="float:right;margin-top:-1.2%;margin-right:-41.6%;overflow-x:hidden;">
			<img src="images/mahaLagori.png" width="200" height="200" style="float:right;margin-right:-99%;">
			<img src="images/calli(1).png" width="140" height="140" style="float:right;margin-right:-55%;margin-top:1%;">
			<dl class="dl-horizontal venue">
				<dt>VENUE:</dt>
				<dd>Shiv Chatrapati Sports Complex,Akluj,Solapur</dd>
			</dl>
				<dl class="dl-horizontal tour-date">
				<dt>DATE:</dt><dd>20th Oct to 21th Oct 2016</dd>
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
		<li class="active"><a  href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation1">VIEW</a></li> 
		
	</ul>
	</div>
</div>
<div class="container-fluid">
		<div class="row" style="background-color: white;">
		<br>
			<div class="col-md-3" id="print">
				<div class="teamhead">SELECT OPTION</div>
				<div class="teamdropdown">
				<button type="button" class="btn btn-info btn-disp" onclick="poolprint(<%=request.getParameter("tourId")%>);">Pool Print</button>
				<button type="button" class="btn btn-info btn-disp" onclick="teamlist(<%=request.getParameter("tourId")%>);">Team List</button>
				
				<button type="button" class="btn btn-info btn-disp" data-toggle="collapse" data-target="#demo">Player List &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="glyphicon glyphicon-plus" style="font-size:15px;"></span>
				</button>
				
 				 <div id="demo"  class="collapse">
 				<button type="button" class="btn btn-danger btn-disp" data-toggle="collapse" data-target="#demo1">MALE Team &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<span class="glyphicon glyphicon-plus" style="font-size:15px;"></span>
				</button>
				<div id="demo1"  class="collapse">
				<%
				rs=null;
				rs=DBManager.fetchQuery("select ttId,tName,ttGender from team t,tourTeam tt where t.tId=tt.tId and tourId="+Integer.parseInt(request.getParameter("tourId"))+" and ttGender='M';");
				while(rs.next())
				{
				%>
				<button type="button" class="btn btn-info btn-disp" onclick="printplayer(<%=request.getParameter("tourId")%>,<%=rs.getInt("ttId")%>,'<%=rs.getString("tName")%>','<%=rs.getString("ttGender")%>');"><%=rs.getString("tName") %></button><br>
				<% 
				}
				%>
				</div>
 				<button type="button" class="btn btn-danger btn-disp" data-toggle="collapse" data-target="#demo2">FEMALE Team &nbsp;&nbsp;&nbsp;
				<span class="glyphicon glyphicon-plus" style="font-size:15px;"></span>
				</button>
 				<div id="demo2"  class="collapse">
 				<%
				rs=null;
				rs=DBManager.fetchQuery("select ttId,tName,ttGender from team t,tourTeam tt where t.tId=tt.tId and tourId="+Integer.parseInt(request.getParameter("tourId"))+" and ttGender='F';");
				while(rs.next())
				{
				%>
				<button type="button" class="btn btn-info btn-disp" onclick="printplayer(<%=request.getParameter("tourId")%>,<%=rs.getInt("ttId")%>,'<%=rs.getString("tName")%>','<%=rs.getString("ttGender")%>');"><%=rs.getString("tName") %></button><br>
				<% 
				}
				%>
 				</div>	 
				</div>	
				
				
				</div>
			</div>	
			<div class="col-md-9">
				<div class="teamhead1" id="print">LOOK AT HERE</div>
				<div class="list-group  teamdropdown1">
				<span id="pp"></span>
				</div>
			</div>	
		
		
		</div>


		
		
			<%
		}
else
{
	%>
			<script type='text/javascript'>
	swal({
		  title: "Select Tournament",
		  text: "Click On Yes To Redirect...",
		  type: "warning",
		  showCancelButton: true,
		  confirmButtonColor: "#DD6B55",
		  confirmButtonText: "Yes, Go!",
		  closeOnConfirm: false
		},
		function(){
		  swal("Redirecting!", "Let's Go....", "success");
			window.location.replace("tournament.jsp");
		});
</script>
	<%
			}
}
	catch(Exception e){System.out.println("Exception in viewList.jsp"+e);}
	%>

	</div>
	<script type="text/javascript">
	$('#demo').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
		}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
		});
	$('#demo1').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
		}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
		});	
	$('#demo2').on('shown.bs.collapse', function(){
		$(this).parent().find(".glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus");
		}).on('hidden.bs.collapse', function(){
		$(this).parent().find(".glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus");
		});
	
	function poolprint(tourId)
	{
		
		var xmlhttp = false;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();
		}
		
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					document.getElementById("pp").innerHTML = xmlhttp.responseText;
				}
			};
		}
		
		xmlhttp.open("GET","viewPool.jsp?tourId="+tourId,true);
		xmlhttp.send(null);
	}
	function teamlist(tourId)
	{
		
		var xmlhttp = false;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();
		}
		
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					document.getElementById("pp").innerHTML = xmlhttp.responseText;
				}
			};
		}
		
		xmlhttp.open("GET","viewteamlist.jsp?tourId="+tourId,true);
		xmlhttp.send(null);
	}
	function printplayer(tourId,ttid,tname,ttGender)
	{
		
		var xmlhttp = false;
		if(window.XMLHttpRequest)
		{
			xmlhttp = new XMLHttpRequest();
		}
		
		if(xmlhttp)
		{
			xmlhttp.onreadystatechange = function(){
				if(xmlhttp.readyState == 4 && xmlhttp.status == 200)
				{
					document.getElementById("pp").innerHTML = xmlhttp.responseText;
				}
			};
		}
		
		xmlhttp.open("GET","viewPlayerSquad.jsp?tourId="+tourId+"&ttId="+ttid+"&ttGender="+ttGender+"&tName="+tname,true);
		xmlhttp.send(null);
	}
	</script>
</body>
</html>