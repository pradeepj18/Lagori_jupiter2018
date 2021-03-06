<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Matches</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">

<!-- SELECT MEMBER -->
<link rel="stylesheet" type="text/css" href="css/listswap.css" />
<!-- <link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css"> -->

<!-- ICON -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="css/home.css">
<script src="js/myjs.js"></script>
<style>
.container {
	margin:150px auto 0 auto;
	max-width:960px;	
	margin-top:-1%;
}
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
	margin-top:-2.9%;
}
#presentation
{
	background-color:#050D3B;
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
	width:105%;
}
p
{	
	margin: 0px 0px 0px 0px;
    padding: 0px 0px 0px 0px;
    margin-top: -5%;
    margin-left: 6%;
}

.del
{
	float:right;
	margin-right:10%;
}
/* FOOTER */
.footer {
right: 0;
bottom: 0;
left: 0;
padding: 1rem;
text-align: center;
position: sticky;
-moz-position:sticky;
float: initial;
margin-top: 144%;
width: 107%;
}

/* FOOTER END */

/*COLLAPSE LIST*/
.lists{
	width: 63%;
	margin-top: 10%;
	margin-left: 20%;
	margin-bottom: 0%;
}
.lists-group{

	width: 95%;
	font-size: 17px;
	line-height: 2;
	padding: 0px 14px;
}

/*END*/

</style>
</head>
<body onload="startTime();showmatchschedule();">
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
				<div class="collapse navbar-collapse" id="myHeader" >
				<ul class="nav navbar-nav">
				<li style="margin-left:-120px"><a href="home.jsp"><font color="white">HOME</font></a></li>
					<li class="nav-item dropdown active">
						<a style="padding: 16px;"class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
				<!-- 	<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li><a href="updateHMR.jsp?tourId=<%=request.getParameter("tourId") %>"><font color="white">UPDATE</font></a></li>
					<li><a href="selectMatch.jsp"><font color="white">MATCH SCHEDULE</font></a></li>
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
		<li class="active"><a href="addtour.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation1">ADD</a></li>
		<li class="active"><a  href="selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">SELECT MATCH</a></li>
		<li class="active"><a  href="updateplayer.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">EDIT PLAYER</a></li>
		<li class="active"><a  href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">VIEW</a></li>
	</ul>
	</div>

<!-- ---------------------------------------- -->
<div class="row">
  <div class="col-md-2">
  
  <!-- NAVBAR -->
	 <div class="panel-group lists">
  <div class="panel panel-default">
    <div class="panel-heading">
      <h4 class="panel-title">
      
       <button type="button" class="btn btn-default btn-sm button-lists" data-toggle="collapse" href="#collapse1">
          <span class="glyphicon glyphicon-menu-hamburger"></span><b><font color="color: #ac2925;">  OPTION</font></b>
        </button>
      
       <!--  <a data-toggle="collapse" href="#collapse1">OPTIONS</a> -->
      </h4>
    </div>
    <div id="collapse1" class="panel-collapse collapse ">
      <ul class="list-group lists-group">
       <li class="list-group-item"><a href="addtourTeam.jsp?tourId=<%=request.getParameter("tourId") %>&gen=<%=request.getParameter("gen")%>" style="color:#052b90;">Teams</a></li>
        <li class="list-group-item"><a href="addtourMember.jsp?tourId=<%=request.getParameter("tourId") %>&gen=<%=request.getParameter("gen")%>&cate=1" style="color:#052b90;">Members</a></li>
        <li class="list-group-item"><a href="addtourMatch.jsp?tourId=<%=request.getParameter("tourId") %>&gen=<%=request.getParameter("gen")%>" style="color:rgb(192, 0, 41);">Pool/Match</a></li>
      </ul>
    </div>
  </div>
</div>
  <!-- END -->
  
  </div>
  <div class="col-md-3">
	
		<h1>Match</h1>
	</div>	
	<div class="col-md-2" style="margin-left:-8%;margin-top:2%;font-size:18px;">
		<%if(request.getParameter("gen").equals("M")) {%>
		<input type="radio" name="gen" value="M" checked onclick="getGender('M');">Male&nbsp;
		<%}else{ %>
		<input type="radio" name="gen" value="M" onclick="getGender('M');">Male&nbsp;
		<%} if(request.getParameter("gen").equals("F")) {%>
			<input type="radio" name="gen" value="F" checked onclick="getGender('F');">Female
		<%}else{ %>
			<input type="radio" name="gen" value="F" onclick="getGender('F');">Female
		<%} %>
	</div>
	<div class="col-md-2" style="margin-left:-2%;margin-top:2%;font-size:18px;">
		<div class="col-md-3" style="margin-left:0%;margin-top:2%;font-size:18px;">
	  <select id="poolName" class="selectpicker" data-size="5" style="display: none;">
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
	</div>
	<div class="col-md-3" style="margin-left:0%;margin-top:2%;font-size:18px;">
	</div>
	
</div>
	<div class="row">
	<div class="col-md-3">
	<div class="teamhead"><b>POOL TEAM</b></div>
	<div class="list-group col-md-12 teamdropdown">
	<%
		ResultSet rs1=null;
	
		rs1 = DBManager.fetchQuery("select pname,count(pname) as count from tourPool where tourId="+request.getParameter("tourId")+" and tpGender='"+request.getParameter("gen")+"' group by pname;");
		ResultSet rs2=null;
		
		
		while(rs1.next())
		{
	%>
		<div class = "list-group-item">&nbsp;
			<p><b>POOL &#<%=64 + rs1.getInt("pname")%></b></p>
			<button type='button' class='btn btn-info' data-toggle='collapse' data-target='#demo<%=rs1.getInt("pname") %>' style="float:right;margin-right:10%;margin-top:-8%;background-color:#ce042d;border-color:#ce042d;">
			   <b><%= rs1.getInt("count")%></b>
			</button>
			<br>
			
			<div id="demo<%=rs1.getInt("pname") %>" class="collapse">
			<%
		
			rs2=DBManager.fetchQuery("select distinct(ttId),(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tp.ttId and tt.tourId="+request.getParameter("tourId")+") as tName from tourPool tp where tpgender ='"+request.getParameter("gen")+"' and pname ="+rs1.getInt("pname")+" and tourId="+request.getParameter("tourId")+";");
				while(rs2.next())
				{
					%>
					&nbsp;&nbsp;<%= rs2.getString("tName")%>
					<div class="del">
      						  <button type="button"  class="btn btn-default btn-sm" onclick="deleteConfirm(<%=rs2.getInt("ttId") %>);">
     						     <span class="glyphicon glyphicon-minus" style="cursor:pointer;"></span> 
     						   </button>
   					   </div>
						<hr>
					<% 
				}
			%>
			</div>
		</div>
		<% } %>
	<button id="generateLots" class="btn btn-primary footer" onclick="generateLots();">GENERATE LOTS</button>

		</div>
	</div>
	
	
	<div class="col-md-9">
		<div class="container">
	    <hr/>
	    
		<form method="post">
	<%
		rs = null;
		rs = DBManager.fetchQuery("select tt.ttId,(select tName from team t where t.tId = tt.tId and tt.tourId="+request.getParameter("tourId")+") as tName from tourTeam tt where tourId="+request.getParameter("tourId")+" and tt.ttGender ='"+request.getParameter("gen")+"' and tt.ttId not in(select ttId from tourPool where tourId="+request.getParameter("tourId")+");");
	%>
	            <select id="source" data-text="Team list" data-search="Search for team">
	           <%while(rs.next()){ %>
	                <option value=<%=rs.getInt("ttId") %>>
	                &nbsp;&nbsp;<%=rs.getString("tName") %>
	                </option>
	           <%} %>
	            </select>
	            
	            <select id="destination" data-text="Selected list"  data-search="Search for team Name">
	            </select>
	            <input class="btn btn-primary" type="button" id="addmem" value="Add Team" style="float:right;margin-right:28%;">
	
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
<%}
}
	catch(Exception e){System.out.println("Exception in droplist.jsp"+e);}
	%>	
	</form>
	</div>
	
	</div>
</div>
	<!-- MATCH SCHEDULE -->
	   <div class="row">
	   	 <div class="col-md-4"></div>
	   	 <div class="col-md-4"></div>
	   	 <div class="col-md-4"></div>
	   </div>
	   <hr style="border-top: 1px solid #9c8c8c;"></hr>
	   <div id="matchschedule"></div>
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jquery.listswap.js"></script>
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
	teamvalues[i] = document.getElementById("poolName").value;
	i = i+1;
	teamvalues[i] = getParameter("gen");
	i = i+1;
	teamvalues[i] = getParameter("tourId");
	i = i+1;
	$.ajax({
		type:"GET",
		data:{teamvalues:teamvalues},
		url:"addtourMatch",
		success:function(){
			location.replace("addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
		}
	});
}
function getGender(id)
{
	location.replace("addtourMatch.jsp?gen="+id+"&tourId="+getParameter("tourId"));
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
				  timer: 100,
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
				location.replace("addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"));
			}
		};
	}
	xmlhttp.open("GET","deletePool?tourId="+tourId+"&ttId="+id+"&gen="+gen,true);
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
				  timer: 100,
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
			  addTeam();
		      swal({
				  title: "Data Added Successfully",
				  text: "",
				  timer: 100,
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
				showmatchschedule();
				/*location.replace("addtourMatch.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen")); */
			}
		};
	}
	xmlhttp.open("get","wclots?tourId="+getParameter("tourId")+"&gen="+getParameter("gen"),true);
	xmlhttp.send(null);
}

function showmatchschedule()
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
	
}
</script>
<br><br>
</body>
</html>	