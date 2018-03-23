<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Timer</title>

</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


<script type="text/javascript">
var stopwatch;
var runningstate = 0; // 1 means the timecounter is running 0 means counter stopped
var stoptime = 0;
var lapcounter = 0;
var currenttime;
var lapdate = '';
var lapdetails;
var time;
var gen = getParameter("gen");
function timecounter(starttime)
{
//	var mid=document.getElementById("mid").value;
	currentdate = new Date();
	lapdetails = document.getElementById('lapdetails');
	stopwatch = document.getElementById('stopwatch');

	var timediff = currentdate.getTime() - starttime;
	timediff = timediff + stoptime;
	if(runningstate == 0)
	{
		/*         timediff = timediff + stoptime; */

	}
	if(runningstate == 1)
	{
		stopwatch.value = formattedtime(timediff);
		refresh = setTimeout('timecounter(' + starttime + ');',1000);
		
	}
	else
	{
		window.clearTimeout(refresh);
		stoptime = timediff;
	}
}

function marklap()
{
	if(runningstate == 1)
	{
		if(lapdate != '')
		{
			var lapold = lapdate.split(':');
			var lapnow = stopwatch.value.split(':');
			var lapcount = new Array();
			var x = 0;
				for(x; x < lapold.length; x++)
				{
					lapcount[x] = new Array();
					lapcount[x][0] = lapold[x]*1;
					lapcount[x][1] = lapnow[x]*1;
				}
			if(lapcount[1][1] < lapcount[1][0])
			{
				lapcount[1][1] += 60;
				lapcount[0][1] -= 1;
			}
			if(lapcount[2][1] < lapcount[2][0])
			{
				lapcount[2][1] += 10;
				lapcount[1][1] -= 1;
			}
			var mzeros = (lapcount[0][1] - lapcount[0][0]) < 10?'0':'';
			var szeros = (lapcount[1][1] - lapcount[1][0]) < 10?'0':'';
			lapdetails.value += '\t+' + mzeros + (lapcount[0][1] - lapcount[0][0]) + ':'
				+ szeros + (lapcount[1][1] - lapcount[1][0]) + ':'
				+ (lapcount[2][1] - lapcount[2][0]) + '\n';
		}
		lapdate = stopwatch.value;
		stw.value=stopwatch.value;
		lapdetails.value += (++lapcounter) + '. ' + stopwatch.value;
	}
}
function startandstop(a)
{
	var startandstop = document.getElementById('startandstopbutton');
	var startdate = new Date();
	var starttime = startdate.getTime();
	if(runningstate==0)
	{
		startandstop.value = 'STOP';
		document.getElementById("startandstopbutton").style.background = '#ff3333';
		runningstate = 1;
		timecounter(starttime);
	}
	else
	{
		startandstop.value = 'START';
		document.getElementById("startandstopbutton").style.background = '#3366ff';
		runningstate = 0;
		lapdate = ''; 
	}
}
function resetstopwatch()
{
	lapdetails.value = '';
	lapcounter = 0;
	stoptime = 0;
	lapdate = '';
	window.clearTimeout(refresh);
	if(runningstate == 1)
	{
		var resetdate = new Date();
		var resettime = resetdate.getTime();
		timecounter(resettime);
	}
	else
	{
		stopwatch.value = "0:00";
	}
}
function formattedtime(unformattedtime)
{ 
	var second = Math.floor(unformattedtime/1000);
	var minute = Math.floor(unformattedtime/60000);
	second = second - 60 * minute + '';
	if(second < 10)
		return  minute + ':0' + second;
	return  minute + ':' + second;

}
function addHit(id,flag,tid)
{
	var set = document.getElementById("setvalue").value;
	var time=document.getElementById("stopwatch").value;
	var tourId=getParameter("tourId");
	var mid=getParameter("mid");
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
	xmlhttp.open("GET","addHitMiss.jsp?id="+id+"&time="+time+"&set="+set+"&flag="+flag+"&tourId="+tourId+"&mid="+mid+"&tid="+tid+"&gen="+gen,true);
	xmlhttp.send(null);
}
function lagori()
{
	var tid = 0;
	var set = document.getElementById("setvalue").value;
	var Hjno = document.getElementById("Hjno").value;
	var score= document.getElementById("score").value;
	if(Hjno == "")
	{
		document.getElementById("Hjno").focus();
		return false;
	}
	if(score == "")
	{
		document.getElementById("score").focus();
		return false;	
	}
	if(document.getElementById("toss-team1").checked)
	{
		tid = document.getElementById("toss-team1").value;
	}
	else if(document.getElementById("toss-team2").checked)
	{
		tid = document.getElementById("toss-team2").value;
	}
	else
	{
		swal("Select the team who is hitting");
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
			{
			
			}
		};
	}
	xmlhttp.open("GET","lagoriRestore.jsp?Hjno="+Hjno+"&score="+score+"&time="+window.time+"&set="+set+"&tid="+tid+"&tourId="+getParameter("tourId")+"&mid="+getParameter("mid")+"&gen="+gen,true);
	xmlhttp.send(null);
	
	if(document.getElementById("Hjno").value)
	{
		document.getElementById("Hjno").value='';
		document.getElementsByName('Hjno')[0].placeholder='JNO';
	}
	if(document.getElementById("score").value)
	{
		document.getElementById("score").value='';
		document.getElementsByName('score')[0].placeholder='SCORE';
	}
	document.getElementById("toss-team1").checked = false;
	$("#teams1").removeClass("btn-danger").addClass("btn-primary");
	document.getElementById("toss-team2").checked = false;
	$("#teams2").removeClass("btn-danger").addClass("btn-primary");
	
	$('#wicRes').modal('toggle');
}

function wicket()
{	
	var turn = 0;
	var set = document.getElementById("setvalue").value;
	var Wjno = document.getElementById("Wjno").value;
	var Wcjno= document.getElementById("Wcjno").value;
	if(Wjno == "")
	{
		document.getElementById("Wjno").focus();
		return false;
	}
	if(Wcjno == "")
	{
		document.getElementById("Wcjno").focus();
		return false;	
	}
	if(document.getElementById("toss-team1").checked)
	{
		turn = document.getElementById("toss-team1").value;
	}
	else if(document.getElementById("toss-team2").checked)
	{
		turn = document.getElementById("toss-team2").value;
	}
	else
	{
		swal("Select the team who is hitting");
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
			{
			}
		};
	}
	xmlhttp.open("GET","lagoriWicket.jsp?Wjno="+Wjno+"&Wcjno="+Wcjno+"&time="+window.time+"&set="+set+"&mid="+getParameter("mid")+"&tourId="+getParameter("tourId")+"&turn="+turn+"&gen="+gen,true);
	xmlhttp.send(null);
	
	if(document.getElementById("Wjno").value)
	{
		document.getElementById("Wjno").value='';
		document.getElementsByName('Wjno')[0].placeholder='JNO';
	}
	if(document.getElementById("Wcjno").value)
	{
		document.getElementById("Wcjno").value='';
		document.getElementsByName('Wcjno')[0].placeholder='JNO';
	}
	
	document.getElementById("toss-team1").checked = false;
	$("#teams1").removeClass("btn-danger").addClass("btn-primary");
	document.getElementById("toss-team2").checked = false;
	$("#teams2").removeClass("btn-danger").addClass("btn-primary");
	$('#wicRes').modal('toggle');
}

function teams(id)
{
	if(id == 1)
	{	
		$("#teams1").removeClass("btn-primary").addClass("btn-danger");
		$("#teams2").removeClass("btn-danger").addClass("btn-primary");
	}
	else if(id == 2)
	{	
		$("#teams2").removeClass("btn-primary").addClass("btn-danger");
		$("#teams1").removeClass("btn-danger").addClass("btn-primary");
	}
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

jQuery(document).bind("keyup keydown", function(e){
    if(e.altKey && e.keyCode == 80)
    {
    	swal({
    		  title: "Are you sure to print?",
    		  text: "You will going to print the scoresheet of Lagori!",
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
    		      window.open("lagoriScoreSheet.jsp?mid="+getParameter("mid")+"&tourId="+getParameter("tourId")+"&gen="+getParameter("gen"),"Score Sheet");
    		      swal({
    				  title: "Check the next tab",
    				  text: "",
    				  timer: 2000,
    				  showConfirmButton: false
    				});
    		  } else {
    			    swal("Cancelled", "Printing cancelled :)", "error");
    		  }
    		});
    	
    }
});
function storetime()
{
	window.time = document.getElementById("stopwatch").value;
}

function livescore()
{
	var set = document.getElementById("setvalue").value;
	var xmlhttp = false;
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
				document.getElementById("livescore").innerHTML = xmlhttp.responseText;
			}
		};
	}
	xmlhttp.open("GET","synlivematch.jsp?tourId="+getParameter("tourId")+"&mid="+getParameter("mid")+"&set="+set+"&gen="+gen,true);
	xmlhttp.send(null);
}
</script>

<style>
/* body{ 
  background: url(images/tile3.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
}
 */
.container
{
	margin-top:20px;
}
.container-fluid
{
	margin-top:10%;
}

/*DROP DOWN SELECT*/

.bootstrap-select.btn-group .dropdown-toggle .filter-option {
    display: inline-block;
    overflow: hidden;
    width: 100%;
    text-align: left;
    line-height: 21px;
    font-size: 22px;
	color: #FE0000;
	font-weight: 700;
}

/*END*/

/* MOBILE */
@media (max-width:767px) and (orientation: portrait)
{
 	body 
 	{
        transform: rotate(-90deg);
        transform-origin: 50% 50%;
        oveflow-y:hidden;
	}
	
	.stopwatch
	{
		float:right;
		margin-right:60%;
		margin-top:-20%;
		text-align:center;
		/* height:150%; */
		width:190%;
		font-size:60px;
		font-family: 'MyWebFont', Digital-7,Digital-7;
		color:#0d0d0d;	
	}
	#set
	{
		float:right;
		margin-right:110%;
		width:15%;
	}
	#startandstopbutton
	{
		float:right;
		margin-right:210%;
		margin-top:0%;
		width:25%;
		font-size:12px;
	}
	#wicresbtn
	{
		float:right;
		margin-right:210%;
		width:30%;
		font-size:12px;
		
	}
	#reset
	{
		float:right;
		margin-right:210%;
		width:40%;
		font-size:12px;
	}
	#team1
	{
		float:right;
		margin-right:110px;
		margin-top:0%;
	}
	#team2
	{
		float:right;
		margin-top:0%;
	}
	#hit
	{
		font-size:12px;
	}
	.tname1
	{
		float:left;
	}
	#livescore
	{
		float:left;
		marign-left:200px;
	}
}

@media (max-width:767px) and (orientation: landscape)
{
	.stopwatch
	{
		float:left;
		margin-left:-50%;
		margin-top:-20%;
		text-align:center;
		/* height:150%; */
		width:190%;
		font-size:60px;
		font-family: 'MyWebFont', Digital-7,Digital-7;
		color:#0d0d0d;	
	}
	#set
	{
		float:left;
		margin-left:95%;
		width:15%;
	}
	#startandstopbutton
	{
		float:left;
		margin-left:-5%;
		margin-top:0%;
		width:25%;
		font-size:12px;
	}
	#wicresbtn
	{
		float:left;
		margin-left:2%;
		width:30%;
		font-size:12px;
		
	}
	#reset
	{
		float:left;
		margin-left:2%;
		font-size:12px;
	}
	#team1
	{
		float:left;
		margin-top:0%;
	}
	#team2
	{
		float:right;
		margin-top:0%;
	}
	#hit
	{
		font-size:12px;
	}
	.tname1
	{
		float:left;
	}
}

/*Tablet*/
@media (min-width:768px) and (max-width:991px)
{
	.stopwatch
	{
		text-align:center;
		height:100%;
		width:100%;
		font-family: 'MyWebFont', Digital-7,Digital-7;
		font-size:125px;
		color:#0d0d0d;	
	}
	#set
	{
		float:left;
		margin-left:130%;
		width:50%;
	}
	#startandstopbutton
	{
		margin-right:18px;
	}
}

/*LAPTOP*/
@media (min-width:992px)
{
	.stopwatch
	{
		text-align:center;
		height:100%;
		width:100%;
		font-family: 'MyWebFont', Digital-7,Digital-7;
		font-size:125px;
		color:#0d0d0d;	
	}
	#set
	{
		float:left;
		margin-left:130%;
		width:50%;
	}
	#startandstopbutton
	{
		float:left;
		margin-left:30px;
		
	}
	#tname1
	{
		text-align:center;
	}
	#livescore
	{
		float:left;
		margin-left:-25%;
		margin-top:50%;
	}
}


.team2
{
	margin-top:-14px;
}
@font-face 
{
	font-family: 'MyWebFont';
	src: url('fonts/digital-7.ttf');
}
.clear {
    clear: both;
}
</style>
</head>
<body onload="livescore()">
<form>
<%
if(request.getParameter("tourId")!=null)
{
%>
<script>
window.onbeforeunload = function()
{
	return "ARE U SURE TO REFRESH";
}

</script>

<div class="container">
<div class="row">
<div class="col-xs-4 col-md-4">
	<div class="form-group" id="set">
		  <select class="selectpicker" id="setvalue" style="color:#000;font-weight:700;">
		  <option value='1'>SET A</option>
		  <option value='2'>SET B</option>
		  <option value='3'>SET C</option>
		  <option value='4'>SET D</option>
		  <option value='5'>SET E</option>
		  <option value='6'>GOLDEN</option>
		  </select>
	</div>
	</div>
</div>
<div class="row">
<div class="col-xs-4 col-md-4">
<%
	try
	{
		DBManager DB = new DBManager();
		DBManager.loadDriver();
		ResultSet rs=null;
		rs = DBManager.fetchQuery("select tid1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId=tid1 and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId=tid2 and tourId="+request.getParameter("tourId")+") as tname2 from wmatch where mid="+request.getParameter("mid")+" and gender='"+request.getParameter("gen")+"' and tourId="+request.getParameter("tourId"));
		String tname1 = "NO NAME";
		String tname2 = "NO NAME";
		int tid1 = 0;
		int tid2 = 0;
		if(rs.next())
		{
			tname1 = rs.getString("tname1");
			tname2 = rs.getString("tname2");
			tid1 = rs.getInt("tid1");
			tid2 = rs.getInt("tid2");
		}
		rs = null;
		rs = DBManager.fetchQuery("select barcodeId,jerseyNo as jno,(select fName from member m where m.barcodeId= tourPlayer.barcodeId) as pname from tourPlayer where ttId="+tid1+" and tourId="+request.getParameter("tourId"));
%>
		<table class="table" id="team1">
			<thead class="thead-inverse">
			<tr>
				<th scope="row" colspan="4" id="tname1">
				<h2><b>
				<%=tname1 %>
				</b></h2>
				
				</th>
			</tr>
			<tr>
				<th>JNO</th>
				<th class="hidden-xs">NAME</th>
				<th class="visible-xs">HIT</th>
				<th class="visible-xs">MISS</th>
			</tr>
			</thead>
			<tbody>
<%
		if(rs.next())
		{
			rs.beforeFirst();
			while(rs.next())
			{
%>
			<tr>
				<th scope="row"><%=rs.getInt("jno")%></th>
				<td class="hidden-xs"><%=rs.getString("pname") %></td>
				<td><button type="button" value=<%=rs.getString("barcodeId") %> id="hit" class="btn btn-warning" onclick=addHit('<%=rs.getString("barcodeId") %>',1,<%=tid1 %>)>HIT</button></td>
				<td><button type="button" value=<%=rs.getString("barcodeId") %> id="hit" class="btn btn-danger" onclick=addHit('<%=rs.getString("barcodeId") %>',2,<%=tid1 %>)>MISS</button></td>
			</tr>
		<%
			}
		}
		%>
			</tbody>
		</table>
</div>

<div class="form-group">
	<div class="col-xs-4 col-md-4">
 		<input class="stopwatch" style="border:none;background:white;" id="stopwatch" value="00:00" type="text" disabled><br><br>
 		<input  class="btn btn-primary" id="startandstopbutton" value="GO" onclick="startandstop(1);" type="button">&nbsp;
 		<textarea name="hide" style="display:none;" id="lapdetails"></textarea>
 		<button  class="btn btn-primary hidden-xs" id="wicresbtn" data-toggle="modal" data-target="#wicRes" type="button" onclick="storetime();">WICKET/RESET</button>
 		<button  class="btn btn-primary visible-xs" id="wicresbtn" data-toggle="modal" data-target="#wicRes" type="button" onclick="storetime();">W/R</button>
 		
 		<!-- POPUP WICKET -->
 		<div class="modal fade" id="wicRes">
 			<div class="modal-dialog">
 			<!-- CONTENT -->
 			
 			<div class="modal-content">
 				<div class="modal-header">
 				<div class="btn-group btn-primary" id="teams1" data-toggle="buttons" onclick="teams(1)" style="margin-left:25%;">
 				<label class="btn">
 					<input type="radio" name="teams" id="toss-team1" value=<%=tid1 %>><%=tname1 %>
 				</label>
 				</div>
 				<div class="btn-group btn-primary" id="teams2" data-toggle="buttons" onclick="teams(2)" style="margin-left:5%;">
 				<label class="btn">
 					<input type="radio" name="teams" id="toss-team2" value=<%=tid2 %>><%=tname2 %>
 				</label>
 				</div>
 					<button type="button" class="close" data-dismiss="modal" onclick="livescore();">&times;</button>
 				</div>
 				<div class="modal-header">
 					 <h4 class="modal-title">SCORE</h4>
 					 <h4 class="modal-title" id="wicket" style="float:left;margin-left:60%;margin-top:-4.5%;">WICKET</h4>
 				</div>
 				<div class="modal-body">
	 				<div class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>RESTORER</b></span>
		 				<input style="width:12%;" class="form-control" id="Hjno" type="text" name="Hjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
		 			<div style="float:left;margin-top:-5.2%;margin-left:60%;" class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>HITTER</b></span>
		 				<input style="width:50%;" class="form-control" id="Wjno" type="text" name="Wjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
		 			<br>
		 			<div class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>SCORE&nbsp;&nbsp;&nbsp;</b></span>
		 				<input style="width:15%;" class="form-control" id="score" type="text" name="score" placeholder="SCORE" />
	 				</div>
	 				<div style="float:left;margin-top:-5.2%;margin-left:60%;" class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>CAUGHT</b></span>
		 				<input style="width:50%;" class="form-control" id="Wcjno" type="text" name="Wcjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
	 				<br>
	 					<input type="button" class="btn btn-primary" value="LAGORI" onclick="lagori();livescore();">
	 					
	 				<div style="float:right;margin-right:26%;">
	 					<input type="button" class="btn btn-primary" value="WICKET" onclick="wicket();livescore();">
	 				</div>
 				</div>
 				<div class="modal-footer">
 				 	<button type="button" class="btn btn-default" data-dismiss="modal" onclick="livescore();">Close</button>
 				</div>
 			</div>
 			</div>
 		</div>
 		<input class="btn btn-primary" id="reset" value="RESET" onclick="resetstopwatch();" type="button">
 		<div class="container-fluid">
 		<div class="row">
		<div class="col-xs-4 col-md-4">
			<%
				String flagA = "",flagB="";
				rs = DBManager.fetchQuery("select tid1,(select SUBSTRING_INDEX(tFlag,'/',-2) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="+tid1+" and tourId="+request.getParameter("tourId")+") as flagA,tid2,(select SUBSTRING_INDEX(tFlag,'/',-2) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="+tid2+" and tourId="+request.getParameter("tourId")+") as flagB from wmatch w,tournament t where t.tourId=w.tourId and mid='"+request.getParameter("mid")+"' and w.tourId='"+request.getParameter("tourId")+"';");
				if(rs.next())
				{
			%>
				<img src="<%=rs.getString("flagA") %>" alt="" width="120" height="120" class="img-circle" style="margin-top:30%;margin-left:-13%;">
				
				<img src="<%=rs.getString("flagB") %>" alt="" width="120" height="120" class="img-circle" style="float:left;margin-left:227%;margin-top:-130%;">
			<%  }%>
			</div>
			<div class="col-xs-8 col-md-8">
			<div id="livescore"></div>
			</div>
		</div>
		</div>
	</div>
</div>

<div class="col-xs-4 col-md-4 team2">
<% 
		rs.close();
		rs=null;	
		rs = DBManager.fetchQuery("select barcodeId,jerseyNo as jno,(select fName from member m where m.barcodeId= tourPlayer.barcodeId) as pname from tourPlayer where ttId="+tid2+" and tourId="+request.getParameter("tourId"));
		%>
		<table class="table" id="team2">
			<thead class="thead-inverse">
			<tr>
				<th scope="row" colspan="4">
				<center><h2><b>
				<%=tname2 %>
				</b></h2>
				</center>
				</th>
			</tr>
			<tr>
				<th class="hidden-xs"></th>
				<th class="hidden-xs"></th>
				<th class="visible-xs">MISS</th>
				<th  class="visible-xs">HIT</th>
				<th>JNO</th>
				<th class="hidden-xs">NAME</th>
			</tr>
			</thead>
			<tbody>
<%
		if(rs.next())
		{
			rs.beforeFirst();
			while(rs.next())
			{
%>
			<tr>
			<td><button type="button" value=<%=rs.getString("barcodeId") %> id="hit" class="btn btn-danger" onclick=addHit('<%=rs.getString("barcodeId") %>',2,<%=tid2 %>)>MISS</button></td>
			<td><button type="button" value=<%=rs.getString("barcodeId") %> id="hit" class="btn btn-warning" onclick=addHit('<%=rs.getString("barcodeId") %>',1,<%=tid2 %>)>HIT</button></td>
				
				<th scope="row"><%=rs.getInt("jno")%></th>
				<td class="hidden-xs"><%=rs.getString("pname") %></td>	
			</tr>
		
		<%
			}
		}
		%>
			</tbody>
		</table>
<%		
	}
	catch(Exception e)
	{
			System.out.println("Exception in bootStrap"+e);
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
<% }
%>
</div>
</div>

</div>
</form>
</body>
</html>
