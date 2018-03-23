<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Player Details</title>
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
<style type="text/css">
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
	background-size:100% 38%;
	position:relative;
	width: 100%;
	height: 50%;
	max-width:100%;
	overflow-x:hidden;
	clear:both; 
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
	width:75%;
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
.pdetail
{
padding:10px;
}
.labeldisp
{
color:white;
font-size:15pt;

}
.valdisp
{
color:white;
font-size:20pt;
color:#33ff99;
margin-top:10px;
}
</style>
</head>
<body onload="showteam();showplayer();">
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
<font size="2pt">PLAYSOFTECH</font>
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
		<nav class="navbar navbar-default" style="background-color:#2045a5;opacity:0.9;" >
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
					<li class="nav-item dropdown active">
						<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="tournament.jsp" role="button" aria-haspopup="true" aria-expanded="false">TOURNAMENT<span class="sr-only">(current)</span></a>
					</li>
					
				<!-- 	<li><a href="#"><font color="white">TEAMS</font></a></li> -->
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li><a href="selectMatch.jsp"><font color="white">SELECT MATCH</font></a></li>
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
			<img src="images/2(1).png" width="1110" height="320" style="float:right;margin-top:-1.2%;margin-right:-42.6%;">
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

	<div class="container-fluid " >
	<div class="row">
	<%
	DBManager.loadDriver();
	rs = null;
	String gender="";
	String lname = "";
	String cat="";
	rs = DBManager.fetchQuery("select catagory,gender,barcodeId,fName,mName,lName,SUBSTRING_INDEX(photo,'/',-1) as photo1,DATE_FORMAT(dob,'%W, %M %d, %Y') as dob from member where barcodeId="+request.getParameter("barcodeId"));
	if(rs.next())
	{
		rs.beforeFirst();
		rs.next();
		if(rs.getString("gender").equalsIgnoreCase("M"))
			gender="MALE";
		else
			gender="FEMALE";
		if(rs.getString("catagory").equals(null))
			cat="NOT AVAILABLE";
		else
			cat=rs.getString("catagory");
	%>
	
	<div class="col-md-3 pdetail"style="background:url('images/bg-footer.jpg');margin-top:10px;">
	<img class="img-responsive img-thumbnail" alt="Player Photo" src="Member/<%=rs.getString("photo1")%>"style="height:300px;">
	
	</div>
	
	<div class="col-md-5" style="background:url('images/bg-footer.jpg');margin-top:10px;height:relative;">
	<span class="labeldisp">NAME  &nbsp;</span><span class="valdisp"><%=rs.getString("fName")+" "+rs.getString("lName") %></span><br>
	<span class="labeldisp">DATE OF BIRTH  &nbsp;</span><span class="valdisp"><%=rs.getString("dob") %></span>	<br>
	<span class="labeldisp">GENDER  &nbsp;</span><span class="valdisp"><%=gender %></span><br>
	<span class="labeldisp">CATAGORY  &nbsp;</span><span class="valdisp"><%=cat %></span><br>
	<span class="labeldisp">CURRENT STATUS  &nbsp;</span><span class="valdisp"></span><br>
	<span class="labeldisp">EMAIL  &nbsp;</span><span class="valdisp"></span>
	
	
	</div>
	<div class="col-md-4"style=margin-top:10px;height:relative;">
	<span  style="font-size:20pt;">BIO</span><br>
	<p></p>
	</div>
	</div>
	</div>
	<%}
	}
}
catch(Exception e){System.out.println("Exception "+e);}
	%>

<br>
</div>
</html>