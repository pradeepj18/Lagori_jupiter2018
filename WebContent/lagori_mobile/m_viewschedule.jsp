<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
</style>
</head>
<body>
	<div class="container">
		<%
			try {
				DBManager.loadDriver();
				ResultSet rs = null;
				int i = 1;
		%>
		<div class="row teamhead">
			<span>MATCH SCHEDULE</span>
		</div>
		<div class="row">
			<%
				rs = DBManager.fetchQuery(
							"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
									+ request.getParameter("tourId")
									+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
									+ request.getParameter("tourId")
									+ ") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%D %b,%y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from wmatch pm where gender='M' and tourId="
									+ request.getParameter("tourId") + "; ");
			%>
			<div class="col-md-6 col-xs-12 col-sm-12">
				<%
				String d="";
					if (rs.next()) {
				%>
				<div class="row">
					<span class="teamhead">MALE</span>
				</div>
				<%
				rs.beforeFirst();
					while (rs.next()) {
						d=rs.getString("mdate").toString().substring(0, 3);
						System.out.println(d);
				%>
				<div class="row">
					<div class="col-md-5 col-xs-5 col-sm-5 result-head"
						style="border-right: 0px;">
						<span><%=d %>&nbsp;<%=rs.getString("day")%></span>
					</div>
					<div class="col-md-2 col-xs-3 col-sm-2 result-head"
						style="text-align: center; border-right: 0px; border-left: 0px;">
						<span style="text-align: center;">M-<%=i%></span>
					</div>
					<div class="col-md-5 col-xs-4 col-sm-5 result-head"
						style="border-left: 0px;">
						<span style="float: right;">[<%=rs.getString("mtype")%>]
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-xs-5 col-sm-5 result-teams">
						<span
							style="float: right; white-space: nowrap; margin-right: -20px;"><%=rs.getString("tname1")%></span>
					</div>
					<div class="col-md-2 col-xs-1 col-sm-2 result-teams"
						style="text-align: center;">
						<span>Vs</span>
					</div>
					<div class="col-md-5 col-xs-6 col-sm-5 result-teams">
						<span
							style="float: left; white-space: nowrap; margin-left: -40px;"><%=rs.getString("tname2")%></span>
					</div>
				</div>
				<%
					i = i + 1;
							}
						} else {
				%>
				<div class="row">
					<span class="teamhead">MALE SCHEDULE NOT FOUND</span>
				</div>
				<%
					}
				%>
			</div>


			<div class="col-md-6 col-xs-12 col-sm-12">
				<%
					i = 1;
						rs = null;
						rs = DBManager.fetchQuery(
								"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
										+ request.getParameter("tourId")
										+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
										+ request.getParameter("tourId")
										+ ") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W')) as mdate,ucase(DATE_FORMAT(mdate,'%D %b %y')) as day,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from wmatch pm where gender='F' and tourId="
										+ request.getParameter("tourId") + "; ");
						if (rs.next()) {
				%>

				<div class="row">
					<span class="teamhead">FEMALE</span>
				</div>
				<%
				rs.beforeFirst();
					while (rs.next()) {
						d=rs.getString("mdate").toString().substring(0, 3);
						System.out.println(d);
				%>
				<div class="row">
					<div class="col-md-5 col-xs-5 col-sm-5 result-head"
						style="border-right: 0px;">
						<span><%=d%>&nbsp;<%=rs.getString("day")%></span>
					</div>
					<div class="col-md-2 col-xs-3 col-sm-2 result-head"
						style="text-align: center; border-right: 0px; border-left: 0px;">
						<span style="text-align: center;">F-<%=i%></span>
					</div>
					<div class="col-md-5 col-xs-4 col-sm-5 result-head"
						style="border-left: 0px;">
						<span style="float: right;">[<%=rs.getString("mtype")%>]
						</span>
					</div>
				</div>
				<div class="row">
					<div class="col-md-5 col-xs-5 col-sm-5 result-teams">
						<span
							style="float: right; white-space: nowrap; margin-right: -20px;"><%=rs.getString("tname1")%></span>
					</div>
					<div class="col-md-2 col-xs-1 col-sm-2 result-teams"
						style="text-align: center;">
						<span>Vs</span>
					</div>
					<div class="col-md-5 col-xs-6 col-sm-5 result-teams">
						<span
							style="float: left; white-space: nowrap; margin-left: -40px;"><%=rs.getString("tname2")%></span>
					</div>
				</div>
				<%
					i = i + 1;
							}
						} else {
				%>
				<div class="row">
					<span class="teamhead">FEMALE SCHEDULE NOT FOUND</span>
				</div>
				<%
					}
				%>
			</div>
		</div>
		<%
			} catch (Exception e) {
				System.out.println("Exception in m_viewschedule.jsp" + e);
			}
		%>
	</div>
</body>
</html>