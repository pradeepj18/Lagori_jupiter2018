<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>LIVE SCORE</title>

</head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="../dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="../dist/sweetalert.css">
<link rel="stylesheet" type="text/css" href="../css/m_livescore.css">
<style type="text/css">
.modal-header {
	padding: 14px;
	border-bottom: 0px solid #e5e5e5;
}

hr {
	margin-top: 0px;
	margin-bottom: 0px;
	border: 0;
	border-top: 2px solid #eee;
}
</style>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">

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
	xmlhttp.open("GET","m_addHitMissServ.jsp?id="+id+"&time="+time+"&set="+set+"&flag="+flag+"&tourId="+tourId+"&mid="+mid+"&tid="+tid+"&gen="+gen,true);
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
	xmlhttp.open("GET","m_lagoriRestoreServ.jsp?Hjno="+Hjno+"&score="+score+"&time="+window.time+"&set="+set+"&tid="+tid+"&tourId="+getParameter("tourId")+"&mid="+getParameter("mid")+"&gen="+gen,true);
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
	xmlhttp.open("GET","m_lagoriWicketServ.jsp?Wjno="+Wjno+"&Wcjno="+Wcjno+"&time="+window.time+"&set="+set+"&mid="+getParameter("mid")+"&tourId="+getParameter("tourId")+"&turn="+turn+"&gen="+gen,true);
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
    			  location.replace("m_selectMatch.jsp?tourId="+getParameter("tourId"));
    		      window.open("m_lagoriScoreSheet.jsp?mid="+getParameter("mid")+"&tourId="+getParameter("tourId")+"&gen="+getParameter("gen"),"Score Sheet");
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
	xmlhttp.open("GET","m_synlivematchServ.jsp?tourId="+getParameter("tourId")+"&mid="+getParameter("mid")+"&set="+set+"&gen="+gen,true);
	xmlhttp.send(null);
}
function printss(tourId,mid,gen)
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
			  location.replace("m_selectMatch.jsp?tourId="+getParameter("tourId"));		  
			  window.open("m_lagoriScoreSheet.jsp?mid="+mid+"&tourId="+tourId+"&gen="+gen,"Score Sheet");
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
</script>

<style>
</style>
</head>
<body onload="livescore()">
	<form>
			<script>
window.onbeforeunload = function()
{
	return "ARE U SURE TO REFRESH";
}

</script>


		<br>
		<div class="container-fluid">
			<div class="row">
				<div class="col-md-4 col-sm-3"></div>
				<div class="col-xs-12 col-md-4 col-sm-6 center">

					<select class="form-control" id="setvalue">
						<option value='1'>SET A</option>
						<option value='2'>SET B</option>
						<option value='3'>SET C</option>
						<option value='4'>SET D</option>
						<option value='5'>SET E</option>
						<option value='6'>GOLDEN</option>
					</select>
				</div>
				<div class="col-md-4 col-sm-3"></div>
			</div>

			<div class="row">
				<div class="col-xs-12 col-md-4 col-sm-6">
					<%
						try {
							DBManager DB = new DBManager();
							DBManager.loadDriver();
							ResultSet rs = null;
							rs = DBManager.fetchQuery(
									"select tid1,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId=tid1 and tourId="
											+ request.getParameter("tourId")
											+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId=tid2 and tourId="
											+ request.getParameter("tourId") + ") as tname2 from wmatch where mid="
											+ request.getParameter("mid") + " and gender='" + request.getParameter("gen")
											+ "' and tourId=" + request.getParameter("tourId"));
							String tname1 = "NO NAME";
							String tname2 = "NO NAME";
							int tid1 = 0;
							int tid2 = 0;
							if (rs.next()) {
								tname1 = rs.getString("tname1");
								tname2 = rs.getString("tname2");
								tid1 = rs.getInt("tid1");
								tid2 = rs.getInt("tid2");
							}
							rs = null;
							rs = DBManager.fetchQuery(
									"select barcodeId,jerseyNo as jno,(select fName from member m where m.barcodeId= tourPlayer.barcodeId) as pname from tourPlayer where ttId="
											+ tid1 + " and tourId=" + request.getParameter("tourId"));
					%>
					<table class="table" id="team1">
						<thead class="thead-inverse">
							<tr>
								<th scope="row" colspan="4" id="tname1">
									<h2>
										<b> <%=tname1%>
										</b>
									</h2>

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
								if (rs.next()) {
										rs.beforeFirst();
										while (rs.next()) {
							%>
							<tr>
								<th scope="row"><%=rs.getInt("jno")%></th>
								<td class="hidden-xs"><%=rs.getString("pname").toUpperCase()%></td>
								<td><button type="button"
										value=<%=rs.getString("barcodeId")%> id="hit"
										class="btn btn-warning"
										onclick="addHit('<%=rs.getString("barcodeId")%>',1,<%=tid1%>)">
										<b>HIT</b>
									</button></td>
								<td><button type="button"
										value=<%=rs.getString("barcodeId")%> id="hit"
										class="btn btn-danger"
										onclick="addHit('<%=rs.getString("barcodeId")%>',2,<%=tid1%>)">
										<b>MISS</b>
									</button></td>
							</tr>
							<%
								}
									}
							%>
						</tbody>
					</table>
				</div>


				<div class="col-xs-12 col-md-4 col-sm-12">
					<div class="row">
						<div class="col-xs-12 col-md-12 col-sm-12 center">

							<input class="stopwatch"
								style="border: 0px solid #000; background: white;"
								id="stopwatch" value="00:00" type="text"><br> <br>
						</div>
					</div>
					<div class="row">
						<div class="col-xs-3 col-md-3 col-sm-3 center">
							<input class="btn btn-primary" id="startandstopbutton" value="GO"
								onclick="startandstop(1);" type="button">&nbsp;
						</div>
						<div class="col-xs-5 col-md-5 col-sm-5 center">
							<button class="btn btn-primary" id="wicresbtn"
								data-toggle="modal" data-target="#wicRes" type="button"
								onclick="storetime();">WICKET/RESET</button>


						</div>
						<div class="col-xs-4 col-md-4 col-sm-4 center">
							<input class="btn btn-primary" id="reset" value="RESET"
								onclick="resetstopwatch();" type="button">
						</div>
					</div>


					<!-- POPUP WICKET -->
					<div class="modal fade" id="wicRes">
						<div class="modal-dialog">
							<!-- CONTENT -->
							<div class="container-fluid">
								<div class="modal-content">
									<div class="row">
										<div class="modal-header">
											<div class="col-xs-5 col-md-5 col-sm-5 center">
												<div class="btn-group btn-primary" id="teams1"
													data-toggle="buttons" onclick="teams(1)">
													<label class="btn"> <input type="radio"
														name="teams" id="toss-team1" value=<%=tid1%>><%=tname1%>
													</label>
												</div>
											</div>
											<div class="col-xs-5 col-md-5 col-sm-5 center">
												<div class="btn-group btn-primary" id="teams2"
													data-toggle="buttons" onclick="teams(2)">
													<label class="btn"> <input type="radio"
														name="teams" id="toss-team2" value=<%=tid2%>><%=tname2%>
													</label>
												</div>
											</div>
											<div class="col-xs-2 col-md-2 col-sm-2 center">
												<button type="button" class="close" data-dismiss="modal"
													onclick="livescore();">&times;</button>
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="modal-header">
											<div class="col-xs-6 col-md-6 col-sm-6 center">
												<h4 class="modal-title">SCORE</h4>
											</div>
											<div class="col-xs-6 col-md-6 col-sm-6 center">
												<h4 class="modal-title" id="wicket">WICKET</h4>
											</div>
										</div>
									</div>
									<hr>
									<div class="row">
										<div class="modal-body">
											<div class="col-xs-6 col-sm-6 col-md-6 center">

												<div class="input-group">
													<span  class="input-group-addon" id="basic-addon1"><b>RESTORER</b></span>
													<input style="width: 50%;" class="form-control" id="Hjno"
														type="number" name="Hjno" placeholder="JNO"
														aria-describedby="basic-addon1" />
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6 center">

												<div class="input-group">
													<span style="width: 33.5%;"class="input-group-addon" id="basic-addon1"><b>HITTER</b></span>
													<input style="width: 50%;" class="form-control" id="Wjno"
														type="number" name="Wjno" placeholder="JNO"
														aria-describedby="basic-addon1" />
												</div><br>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6 center">
												<div class="input-group">
													<span style="width: 40%;" class="input-group-addon" id="basic-addon1"><b>SCORE&nbsp;&nbsp;&nbsp;</b></span>
													<input style="width: 50%;" class="form-control" id="score"
														type="number" name="score" placeholder="SCORE" />
												</div>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6 center">
												<div class="input-group">
													<span class="input-group-addon" id="basic-addon1"><b>CAUGHT</b></span>
													<input style="width: 50%;" class="form-control" id="Wcjno"
														type="number" name="Wcjno" placeholder="JNO"
														aria-describedby="basic-addon1" />
												</div><br>
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6 center">
												<input type="button" class="btn btn-success submit-btn" value="LAGORI"
													onclick="lagori();livescore();">
											</div>
											<div class="col-xs-6 col-sm-6 col-md-6 center">
												<input type="button" class="btn btn-success submit-btn" value="WICKET"
													onclick="wicket();livescore();">
											</div>
										</div>
									</div><br>
									<div class="modal-footer">
										<button type="button" class="btn btn-danger submit-btn"
											data-dismiss="modal" onclick="livescore();">Close</button>
									</div>
								</div>
							</div>
						</div>
					</div>

<br> <br>
					<div class="row">
						<%
							String flagA = "", flagB = "";
								rs = DBManager.fetchQuery(
										"select tid1,(select SUBSTRING_INDEX(tFlag,'/',-3) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="
												+ tid1 + " and tourId=" + request.getParameter("tourId")
												+ ") as flagA,tid2,(select SUBSTRING_INDEX(tFlag,'/',-3) from tourTeam tt,team t where tt.tId = t.tId and tt.ttId="
												+ tid2 + " and tourId=" + request.getParameter("tourId")
												+ ") as flagB from wmatch w,tournament t where t.tourId=w.tourId and mid='"
												+ request.getParameter("mid") + "' and w.tourId='" + request.getParameter("tourId")
												+ "';");
								if (rs.next()) {
						%>
						
						<div class="col-xs-6 col-sm-6 col-md-6 center">
							<img src="../<%=rs.getString("flagA")%>" alt="<%=tname1%> Logo"
								class="myimg-circle">
						</div>
						<div class="col-xs-6 col-sm-6 col-md-6 center">
							<img src="../<%=rs.getString("flagB")%>" alt="<%=tname2%> Logo"
								class="myimg-circle">
						</div>
						<%
							}
						%>

					</div><br><br>
					<div class="row">
						<div class="col-xs-12 col-md-12 col-sm-12 center">
							<div id="livescore"></div>
						</div>
					</div>

				</div>


				<div class="col-xs-12 col-md-4 col-sm-6">
					<%
						rs.close();
							rs = null;
							rs = DBManager.fetchQuery(
									"select barcodeId,jerseyNo as jno,(select fName from member m where m.barcodeId= tourPlayer.barcodeId) as pname from tourPlayer where ttId="
											+ tid2 + " and tourId=" + request.getParameter("tourId"));
					%>
					<table class="table" id="team2">
						<thead class="thead-inverse">
							<tr>
								<th scope="row" colspan="4">
										<h2 style="text-align:center;">
											<b> <%=tname2%>
											</b>
										</h2>
																	</th>
							</tr>
							<tr>
								<th class="hidden-xs"></th>
								<th class="hidden-xs"></th>
								<th class="visible-xs">MISS</th>
								<th class="visible-xs">HIT</th>
								<th>JNO</th>
								<th class="hidden-xs">NAME</th>
							</tr>
						</thead>
						<tbody>
							<%
								if (rs.next()) {
										rs.beforeFirst();
										while (rs.next()) {
							%>
							<tr>
								<td><button type="button"
										value=<%=rs.getString("barcodeId")%> id="hit"
										class="btn btn-danger"
										onclick="addHit('<%=rs.getString("barcodeId")%>',2,<%=tid2%>)">
										<b>MISS</b>
									</button></td>
								<td><button type="button"
										value=<%=rs.getString("barcodeId")%> id="hit"
										class="btn btn-warning"
										onclick="addHit('<%=rs.getString("barcodeId")%>',1,<%=tid2%>)">
										<b>HIT</b>
									</button></td>

								<th scope="row"><%=rs.getInt("jno")%></th>
								<td class="hidden-xs"><%=rs.getString("pname").toUpperCase()%></td>
							</tr>

							<%
								}
									}
							%>
						</tbody>
					</table>
					<%
						} catch (Exception e) {
							System.out.println("Exception in bootStrap" + e);
						}
					%>

				</div>
			</div>
		<div class="row">
		<div class="col-md-12 col-xs-12 col-sm-12 center">
		<h4><input type="button" class="btn btn-success submit-btn" value="PRINT SCORESHEET" onclick="printss(<%=request.getParameter("tourId")%>,<%=request.getParameter("mid")%>,'<%=request.getParameter("gen")%>');"></h4>
		</div>
		</div>
		</div>
	</form>
</body>
</html>
