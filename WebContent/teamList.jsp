<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Team List</title>
 <style>
@media print
{
#M,#F
{
visibility:hidden;
}
a[href]:after {
    content: none !important;
  }
#f
{
font-size:15px;
color:black;
}
}

</style>
</head>

  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
 

<script type="text/javascript">
function showMteam(tourId)
{
	
	var xmlhttp=false;
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
				document.getElementById("demo").innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET","showMale.jsp?tourId="+tourId+"&gen=M",true);
	xmlhttp.send();
}
function showFteam(tourId)
{
	var xmlhttp=false;
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
				document.getElementById("demo").innerHTML = xmlhttp.responseText;
			}
		}
	}
	xmlhttp.open("GET","showMale.jsp?tourId="+tourId+"&gen=F",true);
	xmlhttp.send();
}

</script>

<%
int tourId=Integer.parseInt(request.getParameter("tourId"));
DBManager.loadDriver();
ResultSet rs=null;
String tname=null,tvenue=null,torgby=null;
int d1=0,d2=0,y1=0,y2=0;
String m1=null,m2=null;
rs=DBManager.fetchQuery("select extract(day from tourSDate) as day1, monthname(tourSDate) as month1,extract(year from tourSDate) as year1, extract(day from tourEDate) as day2, monthname(tourEDate) as month2,extract(year from tourEDate) as year2,tourName,tourVenue,tourOrgBy from tournament where tourId="+tourId+";");
if(!rs.next())
{
	out.println("Invalid Tournament");
	rs.beforeFirst();
}
else
{
tname=rs.getString("tourName");
tvenue=rs.getString("tourVenue");
torgby=rs.getString("tourOrgBy");
d1=rs.getInt("day1");d2=rs.getInt("day2");
m1=rs.getString("month1");m2=rs.getString("month2");
y1=rs.getInt("year1");y2=rs.getInt("year2");

}
%>
<body onload="showMteam(<%=tourId%>)">
	<div class="container-fluid">
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<center>
					<font size="3"><%=tname %></font>
				</center>
			</div>
		</div>
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<center>
					<font size="3"><%=tvenue%>&nbsp;&nbsp;<%=d1 %>-<%=m1 %>,<%=y1 %>&nbsp;-&nbsp;<%=d2 %>-<%=m2 %>,<%=y2 %></font>
				</center>
			</div>
		</div>
		
		<div class="row">
			<div class="col-xs-12 col-md-12">
				<center>
					<font size="3"><%=torgby %></font>
				</center>
			</div>
		</div>
	<div class="row">
		<div class="col-xs-12 col-md-12">
			<center>
				<input type="button" id="M" name="m" value="MALE" onclick="showMteam(<%=tourId%>)"> 
				<input type="button" id="F" name="f" value="FEMALE" onclick="showFteam(<%=tourId%>)">
			</center>
		</div>
	</div>


	<div class="row">	
			<div class="col-xs-1 col-md-2"></div>
				<div class="col-xs-1 col-md-1"></div>
					<div class="col-xs-7 col-md-6" >
					
					<span id="demo" >
					
					</span>
					</div>
				<div class="col-xs-1 col-md-2"></div>
			<div class="col-xs-1 col-md-1"></div>
		</div>
	<div class="row">
		<div class="col-xs-12 col-md-12" ></div> 
	</div>
</div>


</body>
</html>