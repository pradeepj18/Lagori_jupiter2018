<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager"
	import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Pool Print</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
@media print {
	#print {
		visibility: hidden;
	}
	@page {
		size: A4;
		margin: 0cm 0cm 0cm 0cm;
	}
	.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th,
		.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th,
		.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
		border: 1px solid #000;
	}
	.table>thead:first-child>tr:first-child>th {
		border-top: 1px solid;
	}
}

.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th,
	.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border: 1px solid #000;
}

.table>thead:first-child>tr:first-child>th {
	border-top: 1px solid;
}
</style>
</head>

<body>
	<div class="container">
		<%
			String g = "";
			int tourId = Integer.parseInt(request.getParameter("tourId"));
			String gen = request.getParameter("gen");
			if (gen.equals("M"))
				g = "MALE";
			else
				g = "FEMALE";
			try {
				DBManager.loadDriver();
				int poolCount = 0;
				int teamCount = 0;
				ResultSet rs = null, rs1 = null;
				ResultSet check = DBManager.fetchQuery(
						"select *,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="
								+ tourId + "");
				if (check.next()) {
		%>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h5 style="text-align: center;"><%=check.getString("tourName")%></h5>

			</div>
			<div class="col-md-12 col-xs-12 col-sm-12">
				<h5 style="text-align: center;">
					<b>Venue:-</b>&nbsp;&nbsp;<%=check.getString("tourVenue")%></h5>

			</div>
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h5 style="text-align: center;">
					<b>Org. By :-</b>&nbsp;&nbsp;<%=check.getString("tourOrgBy")%>
					&nbsp;&nbsp;<%=check.getString("sday")%>&nbsp;to&nbsp;<%=check.getString("eday")%></h5>

			</div>
		</div>
		<%
			rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId=" + tourId
							+ " and tpgender='" + gen + "' group by pname;");
					if (!rs.next())
						out.println("<br><br><center>No " + g.substring(0, 1) + g.substring(1, g.length()).toLowerCase()
								+ " Pool Found</center>");
					rs.beforeFirst();
					boolean f = true;
					int max = 0;
					while (rs.next()) {
						if (f) {
							out.println("<h3><center>Pool - " + g.substring(0, 1)
									+ g.substring(1, g.length()).toLowerCase() + "</center></h3>");
							f = false;
						}
						if (rs.getInt("count(*)") > max)
							max = rs.getInt("count(*)");
						teamCount += rs.getInt("count(*)");
						poolCount++;
					}

					ResultSet[] rss = new ResultSet[poolCount];
		%>

		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<table class="table table-bordered table-responsive">
					<thead>
						<%
							int ii = 0;
									for (ii = 0; ii < poolCount; ii++) {
										out.print("  <th width=10% > POOL &#" + (ii + 65) + "</th>");

										rss[ii] = DBManager.fetchQuery(
												"select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="
														+ tourId + " and tpgender='" + gen
														+ "')) as tName from tourPool tp where  tourId=" + tourId + " and tpgender='"
														+ gen + "' and pname=" + (ii + 1) + ";");
									}
						%>
					</thead>
					<tbody>
						<%
							out.println("<tr>");
									int k = 1;
									for (int i = 0; i < max; i++) {
										for (int j = 0; j < poolCount; j++) {
											if (rss[j].next()) {
												out.print("<td  >" + rss[j].getString("tName") + "</td>");
											} else
												out.println("<td></td>");
										}
										out.println("</tr>");
									}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<button type=button name=print id="print" class="btn btn-info"
					onClick="window.print()">Print Here</button>
			</div>
		</div>
		<%
			}
			} catch (Exception e) {
			} finally {
				DBManager.close();
			}
		%>

	</div>
</body>
</html>