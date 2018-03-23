<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Select Match</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


<script>
var flag;
var mid=0;
var gen='';
function changeColor(id)
{
	if(id == 1)
	{
		document.getElementById("teams2").style.background = '#3366ff';
		document.getElementById("teams1").style.background = '#ff3333';
	}

	else if(id == 2)
	{
		document.getElementById("teams1").style.background = '#3366ff';
		document.getElementById("teams2").style.background = '#ff3333';
	}	
}
function show()
{
	if(!flag)
	{
		document.getElementById("accordion").id = "accordion1";
		flag = true;
	}
	else
	{
		document.getElementById("accordion1").id = "accordion";
		flag = false;
	}
}

function golivescore(id)
{
	
	var toss=0;
	
	var court = document.getElementById("court"+id).value;
	
	if(court == "")
	{	
		document.getElementById("court"+id).focus();
		return false;
	}

	if(document.getElementById("toss-team1"+id).checked)
	{
		toss = document.getElementById("toss-team1"+id).value;
	}
	else if(document.getElementById("toss-team2"+id).checked)
	{
		toss = document.getElementById("toss-team2"+id).value;
	}
	else
	{
		swal("Select the team");
		return false;
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
			if(xmlhttp.readyState == 200 && xmlhttp.status == 4)
			{}
		};
	}
	xmlhttp.open("GET","printmatch?tourId="+getParameter("tourId")+"&toss="+toss+"&court="+court+"&mid="+window.mid+"&gender="+window.gender,true);
	xmlhttp.send(null);
	if(document.getElementById("court"+id).value)
	{
		document.getElementById("court"+id).value='';
		document.getElementsByName('court'+id)[0].placeholder='COURT NO';
	}
	
	document.getElementById("toss-team1"+id).checked = false;
	document.getElementById("toss-team2"+id).checked = false;
	
	window.location.replace("livematch.jsp?tourId="+getParameter("tourId")+"&mid="+window.mid);
	
/* 	$('#toss-modal').modal('toggle'); */
}
function getParameter(variable)
{
       var query = window.location.search.substring(1);
       var vars = query.split("&");
       for (var i=0;i<vars.length;i++) {
               var pair = vars[i].split("=");
               if(pair[0] == variable){return pair[1];}
       }
       return(false);
}

function getmid(mid)
{
	window.mid = mid;
}
function getgen(gender)
{
	window.gender = gender;
}


</script>
<style>
body
{
	background:url("images/bg-footer.jpg");
	background-color: #333;
	background-position: center -100px;
	background-repeat: x-repeat;
	background-size: cover;
	width: 100%;
	height: 200px;
}
img#mahaLagori
 {
    -webkit-filter: brightness(100%); /* Chrome, Safari, Opera */
    filter: brightness(100%);
    background-color: #cccccc;
    z-index:-2;
}
.overlay {
    height: 100%;
    width: 0;
    position: fixed;
    z-index: 2;
    top: 0;
    left: 0;
    background-color: rgb(0,0,0);
    background-color: rgba(0,0,0, 0.9);
    overflow-x: hidden;
    transition: 0.5s;
}
.navbar-default {
    background-color: #f8f8f8;
    border-color:#030825;
}

	.panel-heading a:after
	{
		font-family:"Glyphicons Halflings";
		content:"\e114";
   		float: right;
   		color: #fffff;
   		border-color:#030825;
	}
	.panel-heading a.collapsed:after
	{
		content:"\e080";
		border-color:#030825;
	}
	#accordion
	{
		float:left;
	 	margin-left:-26.6%;
		-moz-margin-start:-26.6%;
		-webkit-margin-start:-26.6%; 
		border-color:#030825;
	}
	#accordion1
	{
		float:left;
		margin-left:-5%;
		-moz-margin-start:-5%;
		-webkit-margin-start:-5%; 
		border-color:#030825;	
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:75%;
	}
	.match-container
	{
		background:#16224d;
		color:#ffffff;
		float:left;
		margin-left:-5%;
		width:60%;
	}	
	.match
	{
		float:left;
		margin-top:1%;
		margin-left:8%;
	}
	.matchdate
	{
		color: #5191cd;
		display:block;
		float:right;
		margin-right:4%;
		margin-top:1%;
		font-size:9pt;
	}	
	.teamvsteam
	{
		text-align:center;
		margin-top:-1%;
	}
	.space
	{
		margin:2%;
	}
	
	#toss
	{
		float:left;
		margin-top:3%;
		margin-left:2%;
	}
	
/*MOBILE*/
@media (max-width: 767px) 
{
		.panel-heading a:after
	{
		font-family:"Glyphicons Halflings";
		content:"\e114";
   		float: right;
   		color: #ffffff;
   		
	}
	.panel-heading a.collapsed:after
	{
		content:"\e080";
		
	}
		#accordion
		{
			float:left;
			margin-left:-163%;
			-moz-margin-start:-163%;
			-webkit-margin-start:-163%;
			
		}
		#accordion1
		{
			float:left;
			margin-left:-35%;
			-moz-margin-start:-35%;
			-webkit-margin-start:-35%;	
		}
}
		
</style>
<body>
<%
if(request.getParameter("tourId")!=null)
{
//out.println("++++"+request.getParameter("tourId"));
%>
<div class="container-fluid">
<!-- <div class="row">
<div class="col-md-12">
<br>
</div>
</div> -->
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
					<li>
						<a  href="tournament.jsp" role="button"><font color="white">TOURNAMENT</font></a>
					</li>
					
					<li><a href="#"><font color="white">TEAMS</font></a></li>
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="selectMatch.jsp">SELECT MATCH <span class="sr-only">(current)</span></a></li>
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
	<div class="row">
		<div class="col-sm-4 col-xs-4 col-md-4">
		<div class="panel-group" id="accordion" >
			<div class="panel panel-default">
				<div class="panel-heading"  style="background-color:#030825;color:#ffffff;">
					<h4 class="panel-title">
					<a data-toggle="collapse" data-target="#collapseone"  style="text-decoration:none;color:#ffffff" onclick="show()">
					SUMMARY
					</a>
					</h4>
				</div>
				<div id="collapseone" class="panel-collapse collapse">
					<div class="panel-body">
					ANAND 
					'fsdfsd
					fsdfs
					dfs
					fds
					dfs
					
					</div>
				</div>
			</div>
		</div>
		</div>
		<div class="col-sm-8 col-xs-8 col-md-8">
		<div class="row">
		<div class="col-md-12 col-xs-12 col-sm-12">
		<%
			try
			{	
				DBManager.loadDriver();		
				ResultSet rs = null;
				//System.out.println("select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1) as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2) as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,gender from wmatch where mid not in(select mid from print_match)");
				rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1) as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2) as tname2,UCASE(DATE_FORMAT(mdate,'%d %M %Y')) as mdate,gender from wmatch where mid not in(select mid from print_match)");
				while(rs.next())
				{
					
		%>
		<a href="#toss-modal<%=rs.getInt("mid") %>" data-toggle="modal" onclick="getmid(<%=rs.getInt("mid")%>);getgen('<%=rs.getString("gender")%>');">
			<div class="match-container">
			<div class="row">
				<div class="match">
					<b>MATCH <%=rs.getInt("mid") %>&nbsp;&nbsp;
					<%if("M".equals(rs.getString("gender"))) {%>
					<img src="images/male.png" height="20" width="20" style="float:right;margin-top:-5%;marign-left:15%;"></b>
					<% }else if("F".equals(rs.getString("gender"))){%>
						<img src="images/female.png" height="20" width="20" style="float:right;margin-top:-5%;marign-left:8%;"></b>
					<%} %>
					
				</div>
				<div class="matchdate">
				<%=rs.getString("mdate") %>
				</div>
			</div>
				<div class="row">
					<div class="col-md-2">
					<%
						String flagA = "-",flagB="-";
						ResultSet rs1 = DBManager.fetchQuery("select tid1,(select SUBSTRING_INDEX(tFlag,'/',-2) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="+rs.getInt("tid1")+") as flagA,tid2,(select SUBSTRING_INDEX(tFlag,'/',-2) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="+rs.getInt("tid2")+") as flagB from wmatch w,tournament t where t.tourId=w.tourId and mid="+rs.getInt("mid")+" and w.tourId='"+request.getParameter("tourId")+"';");
						if(rs1.next())
						{
							flagA = rs1.getString("flagA");
							flagB = rs1.getString("flagB");
						}
					%>
					<img src="<%=flagA %>" width="120" height="120" style="float:left;margin-left:10%;margin-top:10%;border-radius:70px;">
					</div>
					<div class="col-md-8">
					<div class="teamvsteam">
					<h4><b><%=rs.getString("tname1") %></b></h4>
					<h5>VS</h5>
					<h4><b><%=rs.getString("tname2") %></b></h4>
					</div>
					</div>
					<div class="col-md-2">
					<img src="<%=flagB %>" width="120" height="120" style="float:right;margin-right:10%;margin-top:10%;border-radius:70px;">
					&nbsp;
					</div>
				
				</div>
			</div>
		</a>
		
		<div class="modal fade" id="toss-modal<%=rs.getInt("mid")%>">
 			<div class="modal-dialog">
 			<!-- CONTENT -->
 			<div class="modal-content">
 			<h4 class="modal-title" id="toss"><b>TOSS</b></h4>
 				<div class="modal-header">
 				<div class="btn-group btn-primary" id="teams1" data-toggle="buttons"  onclick="changeColor(1);" style="margin-left:25%;">
 				<label class="btn">
 					<input type="radio" name="teams<%=rs.getInt("mid") %>" id="toss-team1<%=rs.getInt("mid") %>" value=<%=rs.getInt("tid1") %>><%=rs.getString("tname1") %>
 				</label>
 				</div>
 				
 				<div class="btn-group btn-primary" id="teams2" data-toggle="buttons" onclick="changeColor(2);" style="margin-left:5%;">
 				<label class="btn">
 					<input type="radio" name="teams<%=rs.getInt("mid") %>" id="toss-team2<%=rs.getInt("mid") %>" value=<%=rs.getInt("tid2") %>><%=rs.getString("tname2") %>
 				</label>
 				</div>
 					<button type="button" class="close" data-dismiss="modal">&times;</button>
 				</div>
 				<div class="modal-body">
 				 <h4 class="modal-title"><b>COURT</b></h4>
 					 <div class="modal-title" id="wicket" style="float:left;margin-left:33%;margin-top:-4.5%;">
 					 <input type="text" class="form-control" id="court<%=rs.getInt("mid")%>" placeholder="COURT NO" name="court<%=rs.getInt("mid")%>">
 					 </div>
 				</div>
 				<div class="modal-footer">
 				 	<button type="button" class="btn btn-default"  onclick="golivescore(<%=rs.getInt("mid")%>);">GO</button>
 				</div>
 			</div>
 			</div>
 		</div>
		
		<div class="row space"></div>
		<%
		}
	}
	catch(Exception e)
	{
		System.out.println("Select Match "+e);
	}
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

%>
		
	</div>
	</div>
	</div>	
	</div>
</div>
</body>
</html>