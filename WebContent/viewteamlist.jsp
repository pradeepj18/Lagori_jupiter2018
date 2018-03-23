<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Team List</title>
</head>
<body>
	<div class="container">
		<div class="row">
		<div class="col-md-6" style="margin-left:140px">
		<table class="table">
			<thead class="thead-inverse">
				<tr>
					<%
						
						int tourId = Integer.parseInt(request.getParameter("tourId"));
						DBManager.loadDriver();
						ResultSet rs = null;
						String gen = "M";
						int count = 1;
						rs = DBManager.fetchQuery("select ttId,tName from team t,tourTeam tt where t.tId=tt.tId and tourId="
								+ tourId + " and ttGender='" + gen + "';");
						if(rs.next())
						{
						%>	
						<th><b><font size="3" color="black">SRNO</font></b>
						<th><b><font size="3" color="black">TEAM NAME</font></b></th>
					
						<% 	out.println("<h3><b>TEAM LIST (MALE)</b></h3>");
						//rs=DBManager.fetchQuery("select tname from team");
						//rs1=DBManager.fetchQuery("select tname from team");
						rs.beforeFirst();
						while (rs.next()) {

							out.println("<tr><td id=f><font color=black>" + count+++ "</font></td><td><font color=black><a id=f style=text-decoration:none !important; title='Click to see Player List' target='blank' href=teamdetail.jsp?gen=M&ttId="+ rs.getInt("ttId") +">" + rs.getString("tName") + "</a></font></td></tr></div>");

						}
						}
						else
						{
							out.println("<h3><b>No Boys Team List Found</b></h3>");
						}
					%>
				</tr>
			</thead>
		</table>
	</div>
	</div>
	</div>
	
	<div class="container">
		<div class="row">
		<div class="col-md-6" style="margin-left:140px">
		<table class="table">
			<thead class="thead-inverse">
				<tr>
					<%
						
						tourId = Integer.parseInt(request.getParameter("tourId"));
						rs = null;
						gen = "F";
						count = 1;
						rs = DBManager.fetchQuery("select ttId,tName from team t,tourTeam tt where t.tId=tt.tId and tourId="
								+ tourId + " and ttGender='" + gen + "';");
						if(rs.next())
						{
						%>	
						<th><b><font size="3" color="black">SRNO</font></b>
						<th><b><font size="3" color="black">TEAM NAME</font></b></th>
					
						<% 	out.println("<h3><b>TEAM LIST (FEMALE)</b></h3>");
						//rs=DBManager.fetchQuery("select tname from team");
						//rs1=DBManager.fetchQuery("select tname from team");
						rs.beforeFirst();
						while (rs.next()) {

							out.println("<tr><td id=f><font color=black>" + count++
									+ "</font></td><td><font color=black><a id=f style=text-decoration:none !important; title='Click to see Player List' target='blank' href=teamdetail.jsp?gen=M&ttId="
									+ rs.getInt("ttId") + ">" + rs.getString("tName") + "</a></font></td></tr></div>");

						}
						}
						else
						{
							out.println("<h3><b>No Girls Team List Found</b></h3>");
						}
					%>
				</tr>
			</thead>
		</table>
	</div>
	</div>
	</div>
</body>
</html>