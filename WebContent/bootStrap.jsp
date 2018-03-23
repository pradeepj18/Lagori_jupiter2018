<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Timer</title>
<!-- <script>
window.onbeforeunload = function()
{
	alert("AAA");
	return "ARE U SURE TO REFRESH";
};

</script> -->
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<script type="text/javascript">
var stopwatch;
var runningstate = 0; // 1 means the timecounter is running 0 means counter stopped
var stoptime = 0;
var lapcounter = 0;
var currenttime;
var lapdate = '';
var lapdetails;

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
		showGoalTeam1(mid);
		showGoalTeam2(mid);
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
		startandstop.value = 'Stop';
		document.getElementById("startandstopbutton").style.background = '#ff3333';
		runningstate = 1;
		timecounter(starttime);
	}
	else
	{
		startandstop.value = 'Start';
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
function addHit(id,flag)
{
	var time=document.getElementById("stopwatch").value;
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
	if(flag == 1)
	{
		xmlhttp.open("GET","addHit.jsp?id="+id+"&time="+time,true);
	}
	else if(flag == 2)
	{
		xmlhttp.open("GET","addMiss.jsp?id="+id+"&time="+time,true);
	}
	xmlhttp.send(null);
}
function lagori()
{
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
	xmlhttp.open("GET","lagoriRestore.jsp?Hjno="+Hjno+"&score="+score,true);
	xmlhttp.send(null);
	document.getElementById("Hjno").value="";
	document.getElementById("score").value="";
	$('#wicRes').modal('toggle');
}
function wicket()
{
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
	xmlhttp.open("GET","lagoriWicket.jsp?Wjno="+Wjno+"&Wcjno="+Wcjno,true);
	xmlhttp.send(null);
	document.getElementById("Wjno").value="";
	document.getElementById("Wcjno").value="";
	$('#wicRes').modal('toggle');
}
</script>

<style>
.container
{
	margin-top:20px;
}
.container-fluid
{
	margin-top:10%;
}
@media (min-width: 100px) 
{
	.stopwatch
	{
		text-align:center;
		height:110%;
		width:110%;
		font-size:30px;
		font-family: 'MyWebFont', Digital-7,Digital-7;
		color:#0d0d0d;
		
	}
}
@media (min-width:720px)and  (min-width:1020px) 
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
<body>
<form>
<div class="container">
<div class="row">
<div class="col-xs-4 col-md-4">
	<div class="form-group" style="float:left;margin-left:130%;width:50%;">
		  <select class="form-control">
		  <option>SET A</option>
		  <option>SET B</option>
		  <option>SET C</option>
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
		rs = DBManager.fetchQuery("select * from team where tid=1");
		rs.next();
		String team = rs.getString("tname");
		rs = DBManager.fetchQuery("select * from player where tid=1");
%>
		<table class="table">
			<thead class="thead-inverse">
			<tr>
				<th scope="row" colspan="4">
				<center><h2><b>
				<%=team %>
				</b></h2>
				</center>
				</th>
			</tr>
			<tr>
				<th>JNO</th>
				<th>NAME</th>
			</tr>
			</thead>
			<tbody>
<%
		while(rs.next())
		{
%>
			<tr>
				<th scope="row"><%=rs.getInt("jno")%></th>
				<td><%=rs.getString("pname") %></td>
				<td><button type="button" value=<%=rs.getString("rbfid") %> id="hit" class="btn btn-warning" onclick=addHit('<%=rs.getString("rbfid") %>',1)>HIT</button></td>
				<td><button type="button" value=<%=rs.getString("rbfid") %> id="hit" class="btn btn-danger" onclick=addHit('<%=rs.getString("rbfid") %>',2)>MISS</button></td>
			</tr>
		<%
		}
		
		%>
			</tbody>
		</table>
</div>

<div class="form-group">
	<div class="col-xs-4 col-md-4">
 		<input class="stopwatch" style="border:none;background:white;" id="stopwatch" value="00:00" type="text" disabled><br><br>
 		<input style="margin-right:30px;" class="btn btn-primary" id="startandstopbutton" value="GO" onclick="startandstop(1);" type="button">
 		<textarea name="hide" style="display:none;" id="lapdetails"></textarea>
 		<button style="margin-right:30px;" class="btn btn-primary" id="startandstopbutton" data-toggle="modal" data-target="#wicRes" type="button">WICKET/RESTORE</button>
 		
 		<!-- POPUP WICKET -->
 		<div class="modal fade" id="wicRes">
 			<div class="modal-dialog">
 			<!-- CONTENT -->
 			<div class="modal-content">
 				<div class="modal-header">
 					<button type="button" class="close" data-dismiss="modal">&times;</button>
 					 <h4 class="modal-title">SCORE</h4>
 					 <h4 class="modal-title" id="wicket" style="float:left;margin-left:60%;margin-top:-4.5%;">WICKET</h4>
 				</div>
 				<div class="modal-body">
	 				<div class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>HITTER</b></span>
		 				<input style="width:15%;" class="form-control" id="Hjno" type="text" name="Hjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
		 			<div style="float:left;margin-top:-5.2%;margin-left:60%;" class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>HITTER</b></span>
		 				<input style="width:50%;" class="form-control" id="Wjno" type="text" name="Wjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
		 			<br>
		 			<div class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>SCORE</b></span>
		 				<input style="width:15%;" class="form-control" id="score" type="text" name="score" placeholder="SCORE" />
	 				</div>
	 				<div style="float:left;margin-top:-5.2%;margin-left:60%;" class="input-group">	
		 				<span class="input-group-addon" id="basic-addon1"><b>CAUGHT</b></span>
		 				<input style="width:50%;" class="form-control" id="Wcjno" type="text" name="Wcjno" placeholder="JNO" aria-describedby="basic-addon1"/>
		 			</div>
	 				<br>
	 					<input type="button" class="btn btn-primary" value="LAGORI" onclick="lagori()">
	 					
	 				<div style="float:right;margin-right:26%;">
	 					<input type="button" class="btn btn-primary" value="WICKET" onclick="wicket()">
	 				</div>
 				</div>
 				<div class="modal-footer">
 				 	<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
 				</div>
 			</div>
 			</div>
 		</div>
 		<input class="btn btn-primary" id="startandstopbutton" value="RESET" onclick="resetstopwatch();" type="button">
 		<div class="container-fluid">
 		<div class="row">
			<div class="col-xs-4 col-md-4">
				<img src="images/india.jpg" alt="INDIA" width="90" height="90" class="img-circle" style="margin-top:15%;margin-left:-13%;">
				
				<img src="images/pakistan.jpg" alt="PAKISTAN" width="90" height="90" class="img-circle" style="float:left;margin-left:275%;margin-top:-95%;">
			</div>
			<div class="col-xs-4 col-md-4">
			<table class="table" style="float:left;margin-left:-50%;margin-top:120%;">
				<thead class="thead-inverse">
					<tr>
						<th><h3><b>60</b></h3>
						</th>
						<th><h3><b>SCORE</b></h3>
						</th>
						<th>
						<h3><b>30</b></h3>
						</th>
					</tr>
				</thead>
			</table>
			</div>
			<div class="col-xs-4 col-md-4">
			<table class="table" style="float:left;margin-left:-185%;margin-top:200%;">
				<thead class="thead-inverse">
					<tr>
						<th><h3><b>60</b></h3>
						</th>
						<th><h3><b>WICKET</b></h3>
						</th>
						<th>
						<h3><b>30</b></h3>
						</th>
					</tr>
				</thead>
			</table>
			</div>
		</div>
		</div>
	</div>
</div>

<div class="col-xs-4 col-md-4 team2">
<% 
		rs.close();
		rs=null;		
		rs = DBManager.fetchQuery("select * from team where tid=2");
		rs.next();
		team = rs.getString("tname");
		rs.close();
		rs = DBManager.fetchQuery("select * from player where tid=2");
		%>
		<table class="table">
			<thead class="thead-inverse">
			<tr>
				<th scope="row" colspan="4">
				<center><h2><b>
				<%=team %>
				</b></h2>
				</center>
				</th>
			</tr>
			<tr>
				<th></th>
				<th></th>
				<th>JNO</th>
				<th>NAME</th>
			</tr>
			</thead>
			<tbody>
<%
		while(rs.next())
		{
%>
			<tr>
				<td><button type="button" value=<%=rs.getString("rbfid") %> id="hit" class="btn btn-danger" onclick=addHit('<%=rs.getString("rbfid") %>',2)>MISS</button></td>
				<td><button type="button" value=<%=rs.getString("rbfid") %> id="hit" class="btn btn-warning" onclick=addHit('<%=rs.getString("rbfid") %>',1)>HIT</button></td>	
				<th scope="row"><%=rs.getInt("jno")%></th>
				<td><%=rs.getString("pname") %></td>
				
			</tr>
		
		<%
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
%>
</div>
</div>

</div>
</form>
</body>
</html>
