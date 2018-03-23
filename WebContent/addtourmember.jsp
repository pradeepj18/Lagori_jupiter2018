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

/*TEAM LIST BOX*/
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
/*END*/


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
<body onload="startTime();">
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
						<a style="padding: 16px" class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
				<!-- 	<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li><a href="updateHMR.jsp?tourId=<%=request.getParameter("tourId") %>"><font color="white">UPDATE</font></a></li>
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
		<li class="active"><a href="addtour.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation1">ADD</a></li>
		<li class="active"><a  href="selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">SELECT MATCH</a></li>
		<li class="active"><a  href="updateplayer.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">EDIT PLAYER</a></li>
		<li class="active"><a href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">VIEW</a></li>
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
        <li class="list-group-item"><a href="addtourMember.jsp?tourId=<%=request.getParameter("tourId") %>&gen=<%=request.getParameter("gen")%>&cate=<%=request.getParameter("cate") %>" style="color:rgb(192, 0, 41);">Members</a></li>
        <li class="list-group-item"><a href="addtourMatch.jsp?tourId=<%=request.getParameter("tourId") %>&gen=<%=request.getParameter("gen")%>" style="color:#052b90;">Pool/Match</a></li>
      </ul>
    </div>
  </div>
</div>
  <!-- END -->
  
  </div>
  <div class="col-md-3">
	
		<h1>Members</h1>
	</div>	
	<div class="col-md-2" style="margin-left:-8%;margin-top:2%;font-size:18px;">
		<%if(request.getParameter("gen").equals("M")) {%>
		<input type="radio" name="gen" value="M" checked onclick="getMember('M');">Male&nbsp;
		<%}else{ %>
		<input type="radio" name="gen" value="M" onclick="getMember('M');">Male&nbsp;
		<%} if(request.getParameter("gen").equals("F")) {%>
			<input type="radio" name="gen" value="F" checked onclick="getMember('F');">Female
		<%}else{ %>
			<input type="radio" name="gen" value="F" onclick="getMember('F');">Female
		<%} %>
	</div>
	<div class="col-md-2" style="margin-left:-2%;margin-top:2%;font-size:18px;">
	<%
		rs = null;
		rs = DBManager.fetchQuery("select ttId,(select tName from team where tId = tt.tId) as tname from tourTeam tt where tourId="+request.getParameter("tourId")+" and ttGender ='"+request.getParameter("gen")+"' order by tname asc;");
	%>
		<select id="teamId" class="selectpicker" data-size="10" style="display: none;">
	<%while(rs.next()){ %>
   	   <option value="<%=rs.getInt("ttId")%>"><%=rs.getString("tname") %></option>
  	<%} %>
  </select>
	</div>
	<div class="col-md-3" style="margin-left:0%;margin-top:2%;font-size:18px;">
	  <select id="memcategory" class="selectpicker" onchange="getCategory();" data-size="5" style="display: none;">
	  <%if(request.getParameter("cate").equals("1")){ %>
	  	<option value="1" selected = selected>PLAYER</option>
	  <%}else{ %>
      <option value="1">PLAYER</option>
      <%}if(request.getParameter("cate").equals("2")){ %>
      	 <option value="2" selected=selected>COACH</option>
      <%}else{ %>
      <option value="2">COACH</option>
      <%} if(request.getParameter("cate").equals("3")){%>
      	<option value="3" selected=selected>MANAGER</option>
      <%}else{ %>
      <option value="3">MANAGER</option>
      <%} if(request.getParameter("cate").equals("4")){%>
       <option value="4" selected="selected">OFFICIAL</option>
      <%}else{ %>
         <option value="4">OFFICIAL</option>
       <%} %>
  </select>
	</div>
	
</div>
	<div class="row">
	<div class="col-md-3">
	<div class="teamhead"><b>TEAM LIST</b></div>
	<div class="list-group col-md-12 teamdropdown">
	<%
		ResultSet rs1=null;
		rs1 = DBManager.fetchQuery("select ttId,tId,(select tName from team t where t.tId = tt.tId) as tName,(select count(barcodeId) from tourPlayer tp where tp.ttId = tt.ttId and tourId="+request.getParameter("tourId")+") as pcount,(select count(barcodeId) from tourCoach tc where tc.ttId = tt.ttId and tourId="+request.getParameter("tourId")+") as coachCount,(select count(barcodeId) from tourManager tm where tm.ttId = tt.ttId and tourId="+request.getParameter("tourId")+") as managerCount from tourTeam tt where ttGender ='"+request.getParameter("gen")+"' and tourId="+request.getParameter("tourId")+";");
		while(rs1.next())
		{
	%>
		<div class = "list-group-item">&nbsp;
		<p class="team-name" style="color:#c9302c;"><b><%=rs1.getString("tName") %></b></p>
		<ul class="stats">
			<li>
				<span style="color:#0E1957;">Player</span>
				<span class="value"><%=rs1.getInt("pcount") %></span>
			</li>
			<li>
				<span style="color:#0E1957;">Coach</span>
				<span class="value"><%=rs1.getInt("coachCount") %></span>
			</li>
			<li>
				<span style="color:#0E1957;">Manager</span>
				<span class="value"><%=rs1.getInt("managerCount") %></span>
			</li> 
		
		</ul>
		</div>
		<% } %>
		</div>
	</div>
	
	<div class="col-md-9">
		<div class="container">
	    <hr/>
	    
		<form method="post">
		<%
			   String table = "tourPlayer";
			   if((request.getParameter("cate") != null) && (Integer.parseInt(request.getParameter("cate"))) == 1)
			   {
				   table = "tourPlayer";
			   }
			   else if((request.getParameter("cate") != null) &&(Integer.parseInt(request.getParameter("cate"))) == 2)
			   {
				   table = "tourCoach";
			   }
			   else if((request.getParameter("cate") != null) &&(Integer.parseInt(request.getParameter("cate"))) == 3)
			   {
				   table = "tourManager";
			   }
			   else if((request.getParameter("cate") != null) &&(Integer.parseInt(request.getParameter("cate"))) == 4)
			   {
				   table = "tourOfficial";
			   }
			   rs = null;		
				rs = DBManager.fetchQuery("select barcodeId,UCASE(fName) as fName,UCASE(lName) as lName from member where barcodeId not in(select barcodeId from "+table +" where tourId="+request.getParameter("tourId")+") and gender='"+request.getParameter("gen")+"' order by barcodeId asc");
		%>   
	            <select id="source" data-text="Member list" data-search="Search for member">
	           <%while(rs.next()){ %>
	                <option value=<%=rs.getInt("barcodeId") %>><%=rs.getInt("barcodeId")%>&nbsp;&nbsp;<%=rs.getString("fname") %>&nbsp;<%=rs.getString("lName") %></option>
	           <%} %>
	            </select>
	            
	            <select id="destination" data-text="Selected list"  data-search="Search for member">
	            </select>
	            <input class="btn btn-primary" type="button" id="addmem" value="Add" style="float:right;margin-right:28%;">
	
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
</div>


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script src="js/jquery.listswap.js"></script>
<script>
$('#source, #destination').listswap({
	truncate:true, 
	height:360, 
	is_scroll:true, 
});
function addmember(){
	var node = document.getElementById("destination").options;
	var list = document.getElementById("destination").options.length;
	var memvalues = [];
	for(var i = 0;i < list;i++){
	   memvalues[i] = node[i].value;
	}
	memvalues[i] = document.getElementById("teamId").value;
	i = i+1;
	memvalues[i] = document.getElementById("memcategory").value;
	i = i+1;
	memvalues[i] = getParameter("tourId");
	i = i+1;
	memvalues[i] = getParameter("gen");
	i = i+1;
	$.ajax({
		type:"GET",
		data:{memvalues:memvalues},
		url:"addtourMember",
		success:function(){
			location.replace("addtourMember.jsp?tourId="+getParameter("tourId")+"&gen="+getParameter("gen")+"&cate="+getParameter("cate"));
		}
	});
}
function getMember(id)
{
	location.replace("addtourMember.jsp?gen="+id+"&tourId="+getParameter("tourId")+"&cate="+document.getElementById("memcategory").value);
}
function getCategory()
{
	location.replace("addtourMember.jsp?gen="+getParameter("gen")+"&tourId="+getParameter("tourId")+"&cate="+document.getElementById("memcategory").value);
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

$("#addmem").click(function(){
		var teamId = document.getElementById("teamId");
		teamName = teamId.options[teamId.selectedIndex].text;
		
		var pId = document.getElementById("memcategory");
		catename = pId.options[pId.selectedIndex].text;
		
		if(getParameter("gen") == "M"){
			gen = "MALE";
		}
		else if(getParameter("gen") == "F"){
			gen = "FEMALE";
		}
		if(document.getElementById("destination").options.length <= 0){
			swal("Select Member to add","");
			return false;
		}
		if((document.getElementById("memcategory").value) != 4){
    	swal({
    		  title: "Are you sure to add?",
    		  text: "You are adding "+document.getElementById("destination").options.length+" "+gen+" "+catename+" in "+teamName+"",
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
    			  addmember();
    		      swal({
    				  title: "Data Added Successfully",
    				  text: "",
    				  timer: 100,
    				  showConfirmButton: false
    				});
    		  } else {
    			    swal("Cancelled", "Data rejected :)", "error");
    		  }
    		});
		}
		else
		{
			swal({
	    		  title: "Are you sure to add?",
	    		  text: "You are adding "+document.getElementById("destination").options.length+" "+gen+" "+catename+"",
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
	    			  addmember();
	    		      swal({
	    				  title: "Data Added Successfully",
	    				  text: "",
	    				  timer: 100,
	    				  showConfirmButton: false
	    				});
	    		  } else {
	    			    swal("Cancelled", "Data rejected :)", "error");
	    		  }
	    		});
			
		}
});

</script>
<br>
</body>
</html>	