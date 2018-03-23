<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
.table.table-borderless td,
.table.table-borderless th {
    border: 0;
}
</style>
<body>
<%
try
{
	ResultSet rs = null;
	DBManager.loadDriver();
	int tourId = Integer.parseInt(request.getParameter("tourId"));
	int mid = Integer.parseInt(request.getParameter("mid"));
	String set= request.getParameter("set");
	String gen=request.getParameter("gen");
	if(tourId > 0 && mid > 0)
	{
					rs = DBManager.fetchQuery("select tid1,tid2 from wmatch where mid="+mid+" and tourId="+tourId+" and gender='"+gen+"'");
					int tid1 = 0,tid2 = 0;
					if(rs.next())
					{
						tid1 = rs.getInt("tid1");
						tid2 = rs.getInt("tid2");
					}
%>
	<div class="col-xs-6 col-md-4">
			<table class="table table-borderless" style="float:left;margin-left:-30%;margin-top:120%;">
				<thead class="thead-inverse">
					<tr>
					<%
					//System.out.println("select sum(score) as score from tourRestore where tourId ="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid1+" and rtype='"+set+"'");
					rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where tourId ="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid1+" and rtype='"+set+"'");
					%>
						<th><h3><b><%if(rs.next()){out.print(rs.getInt("score"));} %></b></h3>
						</th>
						<th><h3><b>SCORE</b></h3>
						</th>
						<%
					rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where tourId ="+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and ttId="+tid2+" and rtype='"+set+"'");
					%>
						<th><h3><b><%if(rs.next()){out.print(rs.getInt("score"));} %></b></h3>
						</th>
					</tr>
				</thead>
			</table>
			</div>
			<div class="col-xs-6 col-md-4">
			<table class="table table-borderless" style="float:left;margin-left:-185%;margin-top:200%;">
				<thead class="thead-inverse">
					<tr>
					<%rs = DBManager.fetchQuery("select count(turn) as wicket from tourWicket where tourId = "+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and turn="+tid1+" and wtype='"+set+"'");
					%>
						<th><h3><b><%if(rs.next()){out.print(rs.getInt("wicket"));} %></b></h3>
						</th>
						<th><h3><b>WICKET</b></h3>
						</th>
						<%rs = DBManager.fetchQuery("select count(turn) as wicket from tourWicket where tourId = "+request.getParameter("tourId")+" and mid="+request.getParameter("mid")+" and turn="+tid2+" and wtype='"+set+"'");
					%>
						<th><h3><b><%if(rs.next()){out.print(rs.getInt("wicket"));} %></b></h3>
						</th>
					</tr>
				</thead>
			</table>
			</div>
<%
	//DBManager.close();
	}
}
catch(Exception e)
{
	System.out.println("SYNLIVEMATCH "+e);
}
%>
</body>
</html>