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
<script type="text/javascript">
	
	/* MENS */
	function prev(){
		
		$("#myCarousel1").carousel("prev");
		$("#myCarousel2").carousel("prev");
		$("#myCarousel3").carousel("prev");
		pause();
	}
	function next(){
		
		$("#myCarousel1").carousel("next");
		$("#myCarousel2").carousel("next");
		$("#myCarousel3").carousel("next");
		pause();
	}
	function pause(){
		$("#myCarousel1").carousel("pause");
		$("#myCarousel2").carousel("pause");
		$("#myCarousel3").carousel("pause");
	}
	/* WOMENS */
function woprev(){
		
		$("#myCarousel4").carousel("prev");
		$("#myCarousel5").carousel("prev");
		$("#myCarousel6").carousel("prev");
		wopause();
	}
	function wonext(){
		
		$("#myCarousel4").carousel("next");
		$("#myCarousel5").carousel("next");
		$("#myCarousel6").carousel("next");
		wopause();
	}
	function wopause(){
		$("#myCarousel4").carousel("pause");
		$("#myCarousel5").carousel("pause");
		$("#myCarousel6").carousel("pause");
	}

</script>

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
	background: #030825;
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
	margin-left: 13%;
}

.teamdropdown {
	height: 700px;
	width: 87%;
	margin-left: 13%;
	overflow: hidden;
	overflow-y: scroll;
	border-radius: 5px;
	box-shadow: 10px 10px 5px #888888;
}

.teamdropdown::-webkit-scrollbar {
	width: 4px;
}

.teamdropdown::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.teamdropdown::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px #333;
}

.fixture-head {
	line-height: 38px;
	font-size: 24px;
	color: #030825;
	font-weight: 700;
}

.carousel {
	background: #001e35;
	margin-top: 20px;
	box-shadow: 5px 1px 5px #888888;
}

.carousel .item img {
	margin: 0 auto; /* Align slide image horizontally center */
}

.bs-example {
	margin: 20px;
}

a {
	font-weight: 700;
	color: #333;
	text-decoration: none;
}

a:hover {
	font-weight: 700;
	color: #000;
	text-decoration: none;
}

.gender-head {
	line-height: 38px;
	font-size: 24px;
	color: #030825;
	font-weight: 700;
	margin-left: 2%;
	margin-top: 90px
}

.second-carousel-name {
	font-size: 24px;
	color: rgb(255, 255, 255);
	font-weight: 700;
	/* float: left;
	margin-left: 24%; */
	margin-top: 0%;
}
.side-carousel-name
{
	float: left;
	margin-left: 37%;
	font-size: 16px;
	margin-top: 7px;
	color: rgb(147, 147, 147);
}

.player-images
{
	margin-top:3%;;
}
.player-images-side
{
	margin-top:3%;
}

/*MOBILE*/
@media ( max-width :767px) {
	.image-example {
		float: left;
		margin-left: 4.5%;
		/* width:800px; */
	}
}

/*LAPTOP*/
@media ( min-width :768px) {
	.image-example {
		float: left;
		margin-left: 4.5%;
		width: 800px;
	}
}
</style>
</head>
<body>
<%
try
{
if(request.getParameter("tourId")!=null)
{
	DBManager.loadDriver();
	ResultSet rs=null;
//out.println("++++"+request.getParameter("tourId"));
%>
<div class="container-fluid">
<%-- <div class="row" id="topbar">
<div class="col-xs-2 col-md-2">
<font size="2pt"><b>PlaySofTech</b></font>
</div>
<div class="col-xs-8 col-md-8">
<font color="#5191cd" size="2pt">
<%
	
	ResultSet rs= DBManager.fetchQuery("select DATE_FORMAT(now(),'%d %M %x') as date");
	rs.next();
%>
<%=rs.getString("date")%>
</font>
</div>
<div class="col-xs-2 col-md-2">
FOLLOW US
<i class="fa fa-facebook fa-1x" aria-hidden="true"></i>

</div>
</div> --%>
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
					<li><a href="tournament.jsp"><font color="white">TOURNAMENT</font></a></li>
					
					<li class="nav-item dropdown active">
						<a style="padding:16px;" class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournamentnext.jsp?tourId=<%=request.getParameter("tourId") %> role="button" aria-haspopup="true" aria-expanded="false">TEAMS<span class="sr-only">(current)</span></a>
					</li>
					
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
			<img src="images/2(1).png" width="1112" height="320" style="float:right;margin-top:-1.2%;margin-right:-41.6%;overflow-x:hidden;">
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
		<li class="active"><a href="tournamentnext.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation1">OVERVIEW</a></li>
		<li class="active"><a href="addtour.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">ADD</a></li>
		<li class="active"><a  href="selectMatch.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">SELECT MATCH</a></li>
		<li class="active"><a  href="updateplayer.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">EDIT PLAYER</a></li>
<li class="active"><a  href="viewList.jsp?tourId=<%=request.getParameter("tourId") %>" id="presentation">VIEW</a></li>
	</ul>
	</div>
	<!-- <center><img src="images/wcplogo.png" width="800" height="350"></center> -->
	<br><br>
	<div class="row">
	<div class="col-md-3">
		<div class="teamhead"><b>Team List</b></div>
			<div class = "list-group col-md-11 teamdropdown">
			<%
				rs = null;
				rs = DBManager.fetchQuery("select distinct(tId),(select tName from team where tId = tt.tId) as tname,(select SUBSTRING_INDEX(tFlag,'/',-2) from team where tId = tt.tId ) as flag from tourTeam tt where tourId="+request.getParameter("tourId")+" order by tname asc;");
				while(rs.next()){
			%>
			<a href="playerlist.jsp?tourId=<%=request.getParameter("tourId") %>&tId=<%=rs.getInt("tId")%>">
			  <div class = "list-group-item">&nbsp; 
			  	<img src=<%=rs.getString("flag") %> width=50 height=50 style="border-radius:50%;">
			  	&nbsp;&nbsp;&nbsp;
			  	<%if(rs.getString("tname").length() <= 12){ %>
			  	<span><%=rs.getString("tname")%></span> 
			  	<%}else{ %>
			  	<span style="white-space: nowrap; float: left; margin-left: 77px; margin-top: -34px;"><%=rs.getString("tname") %></span>
			  	<%} %>
			  </div>
			</a>
			 <%} %> 
			 
			</div>
		
	</div>
	<div class="col-md-9">
	<div class="row">
	  <center><span class="fixture-head">PLAYER LIST</span></center>
	  
	  <%
	  	rs = null;
	  	int mtid = 0;
	  	int ftid = 0;
	  	int i = 0;
	  	rs = DBManager.fetchQuery("select ttId,ttGender from tourTeam tp,team t where t.tId = tp.tId and tp.tId="+request.getParameter("tId")+" and tourId="+request.getParameter("tourId")+" order by ttGender asc;");
	  	while(rs.next())
	  	{
	  		if(rs.getString("ttGender").equals("M"))
	  		{
	  			mtid = rs.getInt("ttId");
	  		}
	  		else
	  		{
	  			ftid = rs.getInt("ttId");
	  		}
	  	}
	  %>
	  
	    <span class="gender-head">Men's</span>
		<div class="bs-example">
		  <%
		       rs = null;
		       rs = DBManager.fetchQuery("select barcodeId,(select SUBSTRING_INDEX(photo,'/',-2) from member where barcodeId = tp.barcodeId ) as photo,(select fName from member where barcodeId=tp.barcodeId) as fName from tourPlayer tp where ttId="+mtid+" and tourId="+request.getParameter("tourId")+";");
		       int count = 0;
		       rs.last();
		       count = rs.getRow();
		       rs.beforeFirst();
		       if(count > 0)
		       {
          %>
		   
		    <div id="myCarousel1" class="col-md-4 carousel slide" data-ride="carousel1" style="margin-left:-3.3%;width:30%;height:200px;">
		        <!-- Carousel indicators -->
		       
		       
		        <!-- Wrapper for carousel items -->
		        <div class="carousel-inner">
		         <%if(count >= 2){ %>
		        	<%if(rs.next()){ %>
		            <div class="item active player-images-side">
		                <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="height: 160px; width: 200px;">
		              <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		            <div class="item player-images-side">
		       
		            
		                <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		           <%} %> 
		        </div>
		       
		    </div>	
		    
		    <!-- SECOND CAROUSEL -->
		    <%
		    	rs.beforeFirst();
		    %>
		    
		    	    <div id="myCarousel2" class="col-md-4 carousel slide " data-ride="carousel2" style="width:43.3%;height:300px;margin-top:-1%;">
		        <!-- Carousel indicators -->
		       
		        <!-- Wrapper for carousel items -->
		        <div class="carousel-inner">
		        <%
		        if(count >= 2)
		        {
		       	 if(rs.next()){ %>
		          
		            <div class="item player-images">
		                <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		             <center>   <span class="second-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		          <%}
		       	 }%>
		          <%if(rs.next()){ %>
		            <div class="item active player-images">
		             <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		            <center><span class="second-carousel-name"><%=rs.getString("fName") %></span></center>
		            
		               
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		            <div class="item player-images">
		            
		                <img src="Member/<%=rs.getString("photo") %>" alt="Third Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		               <center> <span class="second-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		             
		            
		        </div>
		        <!-- Carousel controls -->
		        <a class="carousel-control left" href="#myCarousel2" data-slide="prev" onclick="prev();" style="float:left;margin-left:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-left" style="margin-top:100%;"></span>
		        </a>
		        <a class="carousel-control right" href="#myCarousel2" data-slide="next" onclick="next();" style="float:right;margin-right:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-right" style="margin-top:100%;"></span>
		        </a>
		    </div>	
		    
		    
		    <!-- THIRD CAROUSEL -->
		    	    <div id="myCarousel3" class="col-md-4 carousel slide" data-ride="carousel3" style="float:right;margin-right:-2%;width:32%;height:200px;">
		        <!-- Carousel indicators -->
		       
		        <!-- Wrapper for carousel items -->
		        <%
		        	rs.beforeFirst();
		        		
		        	if(rs.next()){
		        %>
		        
		        <div class="carousel-inner">
		            <div class="item player-images-side">
		            
		                <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%if(rs.next()){ %>
		            <div class="item player-images-side">
		           
		                <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%if(rs.next()){ %>
		            <div class="item active player-images-side">
		           
		                <img src="Member/<%=rs.getString("photo") %>" alt="Third Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		             <div class="item player-images-side">
		     
		                <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            
		        </div>
		        <!-- Carousel controls -->
		        <!-- <a class="carousel-control left" href="#myCarousel3" data-slide="prev">
		            <span class="glyphicon glyphicon-chevron-left"></span>
		        </a>
		        <a class="carousel-control right" href="#myCarousel3" data-slide="next">
		            <span class="glyphicon glyphicon-chevron-right"></span>
		        </a> -->
		    </div>	
		    <%}
		      else{%>NO PLAYER<%} %>
	     </div>
	   </div>
	   
	   <!-- WOMENS -->
	   <div class="row">
	
	     <span class="gender-head">Women's</span>
		<div class="bs-example">
		
		 <%
		       rs = null;
		       rs = DBManager.fetchQuery("select barcodeId,(select SUBSTRING_INDEX(photo,'/',-2) from member where barcodeId = tp.barcodeId ) as photo,(select fName from member where barcodeId=tp.barcodeId) as fName from tourPlayer tp where ttId="+ftid+" and tourId="+request.getParameter("tourId")+";");
		       count = 0;
		       rs.last();
		       count = rs.getRow();
		       rs.beforeFirst();
		       if(count > 0)
		       {
          %>
		
		    <div id="myCarousel4" class="col-md-4 carousel slide" data-ride="carousel4" style="margin-left:-3.3%;width:30%;height:200px;">
		        <!-- Carousel indicators -->
		       
		        <!-- Wrapper for carousel items -->
		         <div class="carousel-inner">
		         <%if(count >= 2){ %>
		        	<%if(rs.next()){ %>
		            <div class="item active player-images-side">
		                <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="height: 160px; width: 200px;">
		              <center><span class="side-carousel-name"> <%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		            <div class="item player-images-side">
		             <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		            <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            
		            </div>
		            <%} %>
		           <%} %> 
		        </div>
		    </div>	
		    <%
		    	rs.beforeFirst();
		    %>
		    <!-- SECOND CAROUSEL -->
		    	    <div id="myCarousel5" class="col-md-4 carousel slide" data-ride="carousel5" style="width:43.3%;height:300px;margin-top:-1%;">
		        <!-- Carousel indicators -->
		       
		        <!-- Wrapper for carousel items -->
		         <div class="carousel-inner">
		        <%
		        if(count >= 2)
		        {
		       	 if(rs.next()){ %>
		          
		            <div class="item player-images">
		                <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		                <center><span class="second-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		          <%}
		       	 }%>
		          <%if(rs.next()){ %>
		            <div class="item active player-images">
		              <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		           <center><span class="second-carousel-name"><%=rs.getString("fName") %></span></center> 
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		            <div class="item player-images">
		            <img src="Member/<%=rs.getString("photo") %>" alt="Third Slide" style="width: 280px; height: 241px; margin-top: -2%;">
		            <center><span class="second-carousel-name"><%=rs.getString("fName") %></span></center>
		                
		            </div>
		            <%} %>
		             
		            
		        </div>
		        <!-- Carousel controls -->
		        <a class="carousel-control left" href="#myCarousel5" data-slide="prev" onclick="woprev();" style="float:left;margin-left:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-left" style="margin-top:100%;"></span>
		        </a>
		        <a class="carousel-control right" href="#myCarousel5" data-slide="next" onclick="wonext();" style="float:right;margin-right:0%;margin-top:20%;">
		            <span class="glyphicon glyphicon-chevron-right" style="margin-top:100%;"></span>
		        </a>
		    </div>	
		    
		    <!-- THIRD CAROUSEL -->
		    	    <div id="myCarousel6" class="col-md-4 carousel slide" data-ride="carousel6" style="float:right;margin-right:-2%;width:32%;height:200px;">
		        <!-- Carousel indicators -->
		       
		        <!-- Wrapper for carousel items -->
		         <%
		        	rs.beforeFirst();
		        		
		        	if(rs.next()){
		        %>
		        
		        <div class="carousel-inner">
		            <div class="item player-images-side">
		             <img src="Member/<%=rs.getString("photo") %>" alt="First Slide" style="height: 160px; width: 200px;">
		           <center> <span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		               
		            </div>
		            <%} %>
		            <%if(rs.next()){ %>
		            <div class="item player-images-side">
		           
		                <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"> <%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%if(rs.next()){ %>
		            <div class="item active player-images-side">
		           
		                <img src="Member/<%=rs.getString("photo") %>" alt="Third Slide" style="height: 160px; width: 200px;">
		                <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            <%while(rs.next()){ %>
		             <div class="item player-images-side">
		             
		                <img src="Member/<%=rs.getString("photo") %>" alt="Second Slide" style="height: 160px; width: 200px;">
		                 <center><span class="side-carousel-name"><%=rs.getString("fName") %></span></center>
		            </div>
		            <%} %>
		            
		        </div>
		        
		    </div>	
		    <%}else{ %>
		    NOPLAYER
		    <%} %>
	     </div>
	   </div>
	   
	   
	</div>
<br>
<br>
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
catch(Exception e)
{
	System.out.println("TOurnamentnext"+e);
}
%>
	
</div>	
</div>
</body>
</html>