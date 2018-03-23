<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show team</title>
<style type="text/css">
.tcard {
	padding: 15px;
	background-color: #e3e3e3;
	border-left: 6px solid #7f7f84;
	margin-bottom: 10px;
}
.tcard:hover
{
border:2px solid #45ABCD;
border-left: 2px solid #45ABCD;
cursor:pointer;
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
			String gen = request.getParameter("ttGender");
	%>

	<%
		rs = DBManager.fetchQuery(
					"select tt.ttId,t.tName,tt.ttGender from team t,tournament tour,tourTeam tt where t.tId=tt.tId and tour.tourId=tt.tourId and tour.tourId="
							+ tourId + " and tt.ttGender='" + gen + "' ORDER BY tName asc;");
			if (rs.next()) {
				rs.beforeFirst();

				while (rs.next()) {
	%>
	<div class="tcard tcard-info" onclick="showplayer(),get_ttId(<%=rs.getInt("ttId")%>)">
		<strong><%=rs.getString("tName")%></strong>
	</div>
	<%
		}
			}

			else {
	%>
	<h4>Player Not Found.</h4>
	<%
		}
		} catch (Exception e) {
			System.out.println("updateteamplayer.jsp " + e);
		}
	%>
</body>
</html>