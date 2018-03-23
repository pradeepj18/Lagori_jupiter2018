<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Match</title>
<style type="text/css">
.tcard {
	padding: 15px;
	background-color: #e3e3e3;
	border-left: 6px solid #7f7f84;
	margin-bottom: 10px;
}

.tcard:hover {
	border: 2px solid #45ABCD;
	border-left: 2px solid #45ABCD;
	cursor: pointer;
}

.tcard-info {
	border-color: #45ABCD;
}
</style>
</head>
<body>
	<%
		try {
			DBManager.loadDriver();
			ResultSet rs = null;
			String tourId = request.getParameter("tourId");
			String gen = request.getParameter("gen");
	%>

	<%
		rs = DBManager.fetchQuery(
					"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2,(select pool from wmatch w where w.mid=pm.mid and w.gender=pm.gender  and w.tourId=pm.tourId) as pool,UCASE(pm.mtype) as mtype from print_match pm where tourId="
							+ request.getParameter("tourId") + " and pm.gender='" + gen
							+ "';");
			if (rs.next()) {
				rs.beforeFirst();

				while (rs.next()) {
	%>
	<div class="tcard tcard-info"
		onclick="showHMR(),get_mid(<%=rs.getInt("mid")%>)">
		
		<strong><%=rs.getString("tname1")%>&nbsp;VS&nbsp;<%=rs.getString("tname2")%>&nbsp;&nbsp;<b>[ <%=rs.getString("mtype").toUpperCase() %> &nbsp;-&nbsp;&#<%=rs.getInt("pool")+64 %> ]</b></strong>
	</div>
	<%
		}
			}

			else {
	%>
	<h4>Match Not Found.</h4>
	<%
		}
		} catch (Exception e) {
			System.out.println("updateteamplayer.jsp " + e);
		}
	%>
</body>
</html>