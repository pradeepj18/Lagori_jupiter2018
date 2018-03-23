<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print Player</title>
</head>

<body>
	<div class="container">
		<%
		
			try {
				DBManager.loadDriver();
				int tourId = Integer.parseInt(request.getParameter("tourId"));
				String gen = request.getParameter("gen");
				int ttId = Integer.parseInt(request.getParameter("ttId"));
						
				ResultSet rs1 = null;
				ResultSet rs = DBManager.fetchQuery(
						"select *,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="
								+ tourId + "");
				if (rs.next()) {

					rs1 = DBManager.fetchQuery(
							"select ttId,(select tName from team where tId = tt.tId) as tname from tourTeam tt where ttId="+ttId);
					if (rs1.next()) {
						ResultSet p = DBManager.fetchQuery(
								"select tpId,jerseyNo,(select fName from member m where m.barcodeId=tp.barcodeId) as fName,(select mName from member m where m.barcodeId=tp.barcodeId) as mName,(select lName from member m where m.barcodeId=tp.barcodeId) as lName from tourPlayer tp where tp.tourId="
										+ tourId + " and tp.ttId=" + rs1.getInt("ttId") + ";");
						if (p.next()) {

							p.beforeFirst();
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
	
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<h4 style="text-align: center;">
					PLAYER LIST &nbsp;(&nbsp;<b><%=rs1.getString("tname").toUpperCase()%>&nbsp;-&nbsp;
						<%
							if (gen.equals("M")) {
						%>MALE<%
							} else {
						%>FEMALE<%
							}
						%> </b>&nbsp;)
				</h4>

			</div>
		</div>

		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">

				<table class="table table-bordered table-responsive">
					<thead>
						<tr>
							<th>SR NO</th>
							<th>PLAYER NAME</th>
							<th>JERSEY NO</th>
							<th>EXTRA</th>
						</tr>
					</thead>
					<tbody>
						<%
							int i = 1;

											while (p.next()) {
												if (p.getString("lName") == null || p.getString("lName").equals("")) {
						%>
						<tr>
							<td><%=i++%></td>
							<td><%=p.getString("fName").toUpperCase() %></td>
							<td><%=p.getInt("jerseyNo") %></td>
							<td></td>
						</tr>
						<%
							} else if (p.getString("mName") == null || p.getString("mName").equals("")) {
						%>
						<tr>
							<td><%=i++%></td>
							<td><%=p.getString("fName").toUpperCase()%>&nbsp;<%=p.getString("lName").toUpperCase() %></td>
							<td><%=p.getInt("jerseyNo") %></td>
							<td></td>
						</tr>
						<%
							} else {
						%>
						<tr>
							<td><%=i++%></td>
							<td><%=p.getString("fName").toUpperCase()%>&nbsp;<%=p.getString("mName").toUpperCase()%>&nbsp;<%=p.getString("lName")%></td>
							<td><%=p.getInt("jerseyNo") %></td>
							<td></td>
						</tr>
						<%
							}
											}
										
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<button type=button name=print class="btn btn-info print1"
					onClick="window.print()">Print Here</button>
			</div>
		</div>
		<%
			} 
						else{
							%>
							<div class="row">
								<div class="col-md-12 col-xs-12 col-sm-12">
									<h4 style="text-align: center">Player Not Found</h4>
								</div>
							</div>

							<%							
						}
					}		
		} else {
		%>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
				<h4 style="text-align: center">Player Not Found</h4>
			</div>
		</div>

		<%
			}
			} catch (Exception e) {
				System.out.println("Error in print player : " + e);
			}
		%>
	</div>

</body>
</html>