<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>

<body>

<table class="table">
<thead class="thead-inverse">
<tr><th><b><font size="3" color="black">SRNO</font></b><th><b><font size="3" color="black">TEAM NAME</font></b></th></tr>
</thead>
<tbody>
<%
int tourId=Integer.parseInt(request.getParameter("tourId"));
String gen=request.getParameter("gen");
	try
	{
		int count=1;
		String g=request.getParameter("gen");
		DBManager.loadDriver();
		ResultSet rs=null,rs1=null;
		rs=DBManager.fetchQuery("select ttId,tName from team t,tourTeam tt where t.tId=tt.tId and tourId="+tourId+" and ttGender='"+gen+"';");
		//rs=DBManager.fetchQuery("select tname from team");
		//rs1=DBManager.fetchQuery("select tname from team");
	 	while(rs.next())
		{
	 		
			out.println("<tr><td id=f><font color=black>"+count++ +"</font></td><td><font color=black><a id=f style=text-decoration:none !important; title='Click to see Player List' target='blank' href=teamdetail.jsp?ttId="+rs.getInt("ttId")+">"+rs.getString("tName")+"</a></font></td></tr></div>");
			
		}
	 		
	}
	catch(Exception e){}
%>
</tbody>
</table>
</body>
</html>