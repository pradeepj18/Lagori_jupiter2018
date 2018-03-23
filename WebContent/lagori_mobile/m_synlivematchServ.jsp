<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Sync live</title>
</head>
<style>
.table.table-borderless td, .table.table-borderless th {
	border: 0;
}
</style>
<body>
<div class="container-fluid">
	<%
		try {
			ResultSet rs = null;
			DBManager.loadDriver();
			int tourId = Integer.parseInt(request.getParameter("tourId"));
			int mid = Integer.parseInt(request.getParameter("mid"));
			String set = request.getParameter("set");
			String gen = request.getParameter("gen");
			if (tourId > 0 && mid > 0) {
				rs = DBManager.fetchQuery("select tid1,tid2 from wmatch where mid=" + mid + " and tourId=" + tourId
						+ " and gender='" + gen + "'");
				int tid1 = 0, tid2 = 0;
				if (rs.next()) {
					tid1 = rs.getInt("tid1");
					tid2 = rs.getInt("tid2");
				}
	%>
	<div class="row">
	<div class="col-xs-12 col-md-12 col-sm-12">
		<table class="table table-border">
			<thead class="thead-inverse">
				<tr>
					<%
						rs=null;
						rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where tourId ="
										+ request.getParameter("tourId") + " and mid=" + request.getParameter("mid") + " and ttId="
										+ tid1 + " and rtype='" + set + "'");
					%>
					<th><h3 style="text-align:center;">
							<b > <%if (rs.next()) {out.print(rs.getInt("score"));} else {out.println("0");}%></b>
					</h3></th>
					<th><h3 style="text-align:center;">
							<b>SCORE</b>
						</h3></th>
					<%
						rs=null;
						rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where tourId ="
										+ request.getParameter("tourId") + " and mid=" + request.getParameter("mid") + " and ttId="
										+ tid2 + " and rtype='" + set + "'");
					%>
					<th><h3 style="text-align:center;">
							<b > <%if (rs.next()) {out.print(rs.getInt("score"));} else {out.println("0");}%></b>
					</h3></th>
				</tr>
			</thead>
		</table>
	</div>
	<div class="col-xs-12 col-md-12 col-sm-12" >
		<table class="table table-border">
			<thead class="thead-inverse">
				<tr>
					<%
						rs = DBManager.fetchQuery("select count(turn) as wicket from tourWicket where tourId = "
										+ request.getParameter("tourId") + " and mid=" + request.getParameter("mid") + " and turn="
										+ tid1 + " and wtype='" + set + "'");
					%>
					<th><h3 style="text-align:center;">
							<b > <%if (rs.next()) {out.print(rs.getInt("wicket"));} else {out.println("0");}%></b>
						</h3></th>
					<th><h3 style="text-align:center;">
							<b >WICKET</b>
						</h3></th>
					<%
						rs = DBManager.fetchQuery("select count(turn) as wicket from tourWicket where tourId = "
										+ request.getParameter("tourId") + " and mid=" + request.getParameter("mid") + " and turn="
										+ tid2 + " and wtype='" + set + "'");
					%>
					<th><h3 style="text-align:center;">
							<b > <%if (rs.next()) {out.print(rs.getInt("wicket"));} else {out.println("0");}%></b>
						</h3></th>
				</tr>
			</thead>
		</table>
	</div>	</div>
	<%
		//DBManager.close();
			}
		} catch (Exception e) {
			System.out.println("SYNLIVEMATCH " + e);
		}
	%>
	</div>
</body>
</html>