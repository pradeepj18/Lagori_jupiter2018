<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print Teams</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.table-bordered>tbody>tr>td, .table-bordered>tbody>tr>th,
	.table-bordered>tfoot>tr>td, .table-bordered>tfoot>tr>th,
	.table-bordered>thead>tr>td, .table-bordered>thead>tr>th {
	border: 1px solid #000;
}

.table>thead:first-child>tr:first-child>th {
	border-top: 1px solid;
}

@media print {
	#print {
		visibility: hidden;
	}
	@page {
		size: A4;
		margin: 0.5cm 0.5cm 0.5cm 0.5cm;
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
</style>
</head>

<body>
	<div class="container">
		<%
			try {
				DBManager.loadDriver();
				int tourId = Integer.parseInt(request.getParameter("tourId"));
				String gen = request.getParameter("gen");
				ResultSet rs1 = null;
				ResultSet rs = DBManager.fetchQuery(
						"select *,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="
								+ tourId + "");
				if (rs.next()) {

					rs1 = DBManager.fetchQuery(
							"select ttId,(select tName from team where tId = tt.tId) as tname from tourTeam tt where tourId="
									+ request.getParameter("tourId") + " and ttGender ='" + request.getParameter("gen")
									+ "' order by tname asc;");
					if (rs1.next()) {
		%>

		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h5 style="text-align: center;"><%=rs.getString("tourName")%></h5>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<h5 style="text-align: center;">
					<b>Venue:-</b>&nbsp;&nbsp;<%=rs.getString("tourVenue")%></h5>

			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h5 style="text-align: center;">
					<b>Org. By :-</b>&nbsp;&nbsp;<%=rs.getString("tourOrgBy")%>
					&nbsp;&nbsp;<%=rs.getString("sday")%>&nbsp;to&nbsp;<%=rs.getString("eday")%></h5>

			</div>
		</div>
		<br>

		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h3 style="text-align: center;">
					TEAM LIST &nbsp;(&nbsp;<%=rs.getString("tourAge").toUpperCase()%>&nbsp;-&nbsp;<b>
						<%
							if (gen.equals("M")) {
						%>MALE<%
							} else {
						%>FEMALE<%
							}
						%>
					</b>&nbsp;)
				</h3>

			</div>
		</div>

		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<table class="table table-bordered table-responsive">
					<thead>
						<tr>
							<th>SR NO</th>
							<th>TEAM NAME</th>
							<th>EXTRA</th>
						</tr>
					</thead>
					<tbody>
						<%int i=1;
							rs1.beforeFirst();
										while (rs1.next()) {
						%>
						<tr>
							<td><%=i++%></td>
							<td><%=rs1.getString("tname")%></td>
							<td></td>
						</tr>
						<%
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
			} else {
		%>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<h4 style="text-align: center">Teams Not Found</h4>
			</div>
		</div>
		<%
			}

				} else {
		%>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<h4 style="text-align: center">Teams Not Found</h4>
			</div>
		</div>
		
		<%
			}
			} catch (Exception e) {
				System.out.println("Error in print team : " + e);
			}
		%>
	</div>

</body>
</html>