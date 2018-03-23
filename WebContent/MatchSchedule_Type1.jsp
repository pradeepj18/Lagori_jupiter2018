<%@ page language="java" import="java.sql.*"
	import="lg_DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Match Schedule Type 1</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style type="text/css">
@media print 
{
  @page
  {
 	size:A4;
 	margin:0.5cm 0.5cm 0.5cm 0.5cm;  
  	
  }
  .break 
{
display:block;
 page-break-after:always;
}
.hide
{
visibility:visible;
}
}
.hide
{
visibility:hidden;
}
</style>
</head>

<body>
<div class="container-fluid">

<%
try
{
	String gender="";
	int tourId=1;
	String gen="M";
	DBManager.loadDriver();
	ResultSet rs=null,rs1=null;
	rs=DBManager.fetchQuery("select *,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="+tourId+"");
	if(rs.next())
	{
		rs1 = DBManager.fetchQuery("select mid,(select tName from team tt where tId =(select tId from tourTeam tt where tt.ttId=m.tid1 and tourId="+tourId+" and ttGender='"+gen+"')) as team1,(select tName from team tt where tId =(select tId from tourTeam tt where tt.ttId=m.tid2 and tourId="+tourId+" and ttGender='"+gen+"')) as team2,ucase(DATE_FORMAT(mdate,'%d %b %y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,mdate,tid1,tid2,pool,mtime,gender,mtype,tourId from wmatch m where tourId="+tourId+" and gender='"+gen+"' and mtype='league';");
		if(rs1.next())
		{
%>

<div class="row">
<div class="col-md-12">
<center><h5><%=rs.getString("tourName") %></h5></center>
</div>
</div>
<%-- <div class="row">
<div class="col-md-12">
<center><h5><%=rs.getString("tourTitle") %></h5></center>
</div>
</div> --%>
<div class="row">
<div class="col-md-12">
<center><h5><b>Venue:-</b>&nbsp;&nbsp;<%=rs.getString("tourVenue") %></h5></center>
</div>
</div>
<div class="row">
<div class="col-md-12">
<center><h5><b>Org. By :-</b>&nbsp;&nbsp;<%=rs.getString("tourOrgBy") %> &nbsp;&nbsp;<%=rs.getString("sday") %>&nbsp;to&nbsp;<%=rs.getString("eday") %></h5></center>
</div>
</div>
<br>

<div class="row">
<div class="col-md-12">
<center><h3>MATCH SCHEDULE &nbsp;(&nbsp;<%=rs.getString("tourAge").toUpperCase() %>&nbsp;-&nbsp;<b>MALE</b>&nbsp;)</h3></center>
</div>
</div>


<table class="table table-bordered">
<thead>
<tr>
<th>MATCH NO</th>
<th>TEAM A</th>
<th>TEAM B</th>
<th>POOL</th>
<th>DATE</th>
</tr>
</thead>
<tbody>
<%
rs1.beforeFirst();
while(rs1.next())
{
%>
<tr>
<td><%=rs1.getInt("mid") %></td>
<td><%=rs1.getString("team1") %></td>
<td><%=rs1.getString("team2") %></td>
<td><%=((char)(rs1.getInt("pool")+64)) %></td>
<td><%=rs1.getString("day") %></td>
</tr>
<%} %>
</tbody>
</table>
<%} %>


<%	
}
}//try end
catch(Exception e)
{
System.out.println("Error : "+e);	
} 
%>
</div>
<!-------------------------------------FEMALE SCHEDULE---------------------------------->
<div class="container-fluid">
<div class="break"></div>
<%
try
{

	int tourId=1;
	String gen="F";
	DBManager.loadDriver();
	ResultSet rs=null,rs1=null;
	rs=DBManager.fetchQuery("select *,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="+tourId+"");
	if(rs.next())
	{
		rs1 = DBManager.fetchQuery("select mid,(select tName from team tt where tId =(select tId from tourTeam tt where tt.ttId=m.tid1 and tourId="+tourId+" and ttGender='"+gen+"')) as team1,(select tName from team tt where tId =(select tId from tourTeam tt where tt.ttId=m.tid2 and tourId="+tourId+" and ttGender='"+gen+"')) as team2,mdate,tid1,tid2,pool,mtime,gender,mtype,tourId from wmatch m where tourId="+tourId+" and gender='"+gen+"' and mtype='league';");
		if(rs1.next())
		{
%>

<div class="row">
<div class="col-md-12">
<center><h5><%=rs.getString("tourName") %></h5></center>
</div>
</div>
<%-- <div class="row">
<div class="col-md-12">
<center><h5><%=rs.getString("tourTitle") %></h5></center>
</div>
</div> --%>
<div class="row">
<div class="col-md-12">
<center><h5><b>Venue:-</b>&nbsp;&nbsp;<%=rs.getString("tourVenue") %></h5></center>
</div>
</div>
<div class="row">
<div class="col-md-12">
<center><h5><b>Org. By :-</b>&nbsp;&nbsp;<%=rs.getString("tourOrgBy") %> &nbsp;&nbsp;<%=rs.getString("sday") %>&nbsp;-&nbsp;<%=rs.getString("eday") %></h5></center>
</div>
</div>
<br>

<div class="row">
<div class="col-md-12">
<center><h3>MATCH SCHEDULE &nbsp;(&nbsp;<%=rs.getString("tourAge").toUpperCase() %>&nbsp;-&nbsp;<b>FEMALE</b>&nbsp;)</h3></center>
</div>
</div>


<table class="table table-bordered">
<thead>
<tr>
<th>MATCH NO</th>
<th>TEAM A</th>
<th>TEAM B</th>
<th>POOL</th>
<th>DATE</th>
</tr>
</thead>
<tbody>
<%
rs1.beforeFirst();
while(rs1.next())
{
%>
<tr>
<td><%=rs1.getInt("mid") %></td>
<td><%=rs1.getString("team1") %></td>
<td><%=rs1.getString("team2") %></td>
<td><%=((char)(rs1.getInt("pool")+64)) %></td>
<td><%=rs1.getString("mdate") %></td>
</tr>
<%} %>
</tbody>
</table>
<%} %>


<%	
}
}//try end
catch(Exception e)
{
System.out.println("Error : "+e);	
} 
%>
</div>
 </body>

</html>