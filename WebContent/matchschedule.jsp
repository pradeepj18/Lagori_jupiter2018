<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style>
.teamhead {
	font-family: 'Open Sans', sans-serif;
	background: #0E1957;
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

.teamdropdown1 {
	height: 580px;
	width: 87%;
	margin-left: 13%;
	overflow: hidden;
	overflow-y: scroll;
	border-radius: 5px;
	box-shadow: 5px 2px 2px #7B7575;
}

.list-group-item
{
	padding:0px 0px;
}
.teamdropdown1::-webkit-scrollbar {
	width: 4px;
}

.teamdropdown1::-webkit-scrollbar-track {
	-webkit-box-shadow: inset 0 0 6px rgba(0, 0, 0, 0.3);
	border-radius: 10px;
}

.teamdropdown1::-webkit-scrollbar-thumb {
	border-radius: 10px;
	-webkit-box-shadow: inset 0 0 6px #333;
}



.teamdropdown1 .stats {
    margin: 5px auto 10px;
    overflow: auto;
    width: 100%;
}
ul
{
	list-style: none;
	padding: 0px 0px 0px 0px;
}
.teamdropdown1 .stats li {
   /*  border-right: 1px solid #7a7a7a; */
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
.teamdropdown1 .stats li .value {
    font-size: 16px;
    line-height: 16px;
}
.teamdropdown1 .stats li .value {
    display: block;
    vertical-align: top;
    width: 100%;
}
.result-head1
{
	padding: 6px 13px 9px;
	line-height: 24px;
	background-color: #e21e22;
	color: #fff;
	font-family: "Roboto Condensed";
	font-size: 12px;
	text-transform: uppercase;
	font-weight: 700;
}
  .result-teams1{
    width: 33.3%;
	padding: 3.9% 25px;
	background-color: #f2f2f2;
	border-bottom: 1px solid #e1e1e1;
	font-size: 14px;
	color: #000;
	font-weight: 700;
  }
</style>
</head>

<body>
<div class="row">
	<div class="col-md-12"><center style="font-size: 24px; font-family: initial; font-weight: 700; color: rgb(14, 25, 87);">MATCH SCHEDULE</center></div>
</div>
<%
	try
	{
		ResultSet rs = null;
		int i = 1;
		rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%d %b.%y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from wmatch pm where gender='M' and tourId="+request.getParameter("tourId")+"; ");
%>
		<br>
		<div class="row">
			
			<div class="col-md-6" style="float: left; margin-left: -33px;">
				<div class="teamhead"><b>MALE</b></div>
					<div class = "list-group col-md-12 teamdropdown1">
					<%
						while(rs.next())
						{
						%>
			<div class="row">
	  		  <div class="col-md-12 result-head1">
	            <span class="result-date" >&nbsp;&nbsp;<%=rs.getString("mdate") %>&nbsp;<%=rs.getString("day") %></span><span style="color:#fff;margin-left: 15%;">Match No - <%=i %></span>
	            <span class="result-place" style="float:right;">[<%=rs.getString("mtype") %>]</span>
	         </div>
	       </div>
	 <div class="row" style="line-height: 5%;">
	   <div class="col-md-5 result-teams1">
	     <span class="result-team1" style="white-space:nowrap;margin-left: 1px;font-size: 16px;"><%=rs.getString("tname1") %></span>
	    </div>
	    <div class="col-md-2 result-teams1">
	     <span class="score" style="float: left;margin-left: 100px;">Vs </span>
	    </div>
	    <div class="col-md-5 result-teams1">
	     <span class="result-team2" style="float:right;white-space:nowrap;margin-right: -19px;font-size: 16px;"><%=rs.getString("tname2") %></span>
	    </div>
	 </div>
		<%
			i = i+1;
		}
		%>
	</div>
	</div>
	
	<!-- END MALE -->
			
	<!-- FEMALE -->
	
	
	<div class="col-md-6">
	
		<% i = 1;
		rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tourId="+request.getParameter("tourId")+") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%d %b.%y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from wmatch pm where gender='F' and tourId="+request.getParameter("tourId")+"; ");
        %>
				<div class="teamhead"><b>FEMALE</b></div>
					<div class = "list-group col-md-12 teamdropdown1">
					<%
						while(rs.next())
						{
						%>
			<div class="row">
	  		  <div class="col-md-12 result-head1">
	            <span class="result-date" >&nbsp;&nbsp;<%=rs.getString("mdate") %>&nbsp;<%=rs.getString("day") %></span><span style="color:#fff;margin-left: 15%;">Match No - <%=i %></span>
	            <span class="result-place" style="float:right;">[<%=rs.getString("mtype") %>]</span>
	         </div>
	       </div>
	 <div class="row" style="line-height: 5%;">
	   <div class="col-md-5 result-teams1">
	     <span class="result-team1" style="white-space:nowrap;margin-left: 1px;font-size: 16px;"><%=rs.getString("tname1") %></span>
	    </div>
	    <div class="col-md-2 result-teams1">
	     <span class="score" style="float: left;margin-left: 100px;">Vs </span>
	    </div>
	    <div class="col-md-5 result-teams1">
	     <span class="result-team2" style="float:right;white-space:nowrap;margin-right: -19px;font-size: 16px;"><%=rs.getString("tname2") %></span>
	    </div>
	 </div>
		<%
			i = i+1;
		}
		%>
	</div>
	</div>
	
	</div>
	
			
	<!-- END FEMALE -->
<%  	
	}
	catch(Exception e)
	{
		System.out.println("Exception in matchschedule.jsp"+e);			
	}
%>
</body>
<style>
.matchsch-row {
	width: 33.3%;
	padding: 3.9% 25px;
	background-color: #f2f2f2;
	border-bottom: 1px solid rgb(226, 30, 34);
	font-size: 14px;
	color: #000;
	font-weight: 700;
	
	
}

.table-vs {
	font-size: 18px;
	color: rgb(132, 127, 127);
}
</style>
</html>