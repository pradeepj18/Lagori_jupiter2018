<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lagori Point Table</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">

<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%	int tourId = 1; %>
		<div class="col-md-6 col-xs-12">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [MALE]</h5>
					</div>

					<div class="panel-body"
						style="height: 430px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								DBManager.loadDriver();
								int P = 0, W = 0, point = 0, i = 1;
							
								ResultSet rs = null, rs1 = null, rs2 = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + tourId + " and tpgender='M' group by pname;");
								if (rs.last())
									pcnt = rs.getRow();
								else
								{
									%>
						<h3>NO MATCHE FOUND</h3>
						<% 
								}

								for (int k = 0; k < pcnt; k++) {
									rs = null;
						%>
						<h4 style="text-align: center;">
							POOL -
							<%=((char) (65 + k))%></h4>
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team Name</th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
								int tid1 = 0, tid2 = 0;
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+tourId+" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+tourId+" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+tourId+" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+tourId+" and tpgender='M' and pname="+(k+1)+" order by W desc;");
										if(rs.next())
										{
											rs.beforeFirst();
										while(rs.next())
										{
							%>

								<tr>
									<td style="font-size: 16px;"><b><%=i++%></b></td>
									<td><span
										style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
									<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
									<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W")*2)%></b></td>
								</tr>
								<%	
								
									}
										}
										else
										{
										%>


								<tr>
									<td></td>
									<td></td>
									<td style="text-align: center;"><span><b></b></span></td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;"></td>
								</tr>
								<% 	
										}
										i=1;
										%>
							</tbody>
						</table>
						<%
							}
							} catch (Exception e) {
								e.getMessage();
							}
						%>
					</div>
				</div>
			</div>
		</div>
		<!-- ------------------------------FEMALE POINT TABLE--------------------- -->
		<div class="col-md-6 col-xs-12">
			<div class="panel-group">
				<div class="panel panel-primary">
					<div class="panel-heading"
						style="font-weight: 800; text-align: center; font-size: 12pt;">
						<h5 style="font-size: 16pt;">LEAGUE POINT TABLE - [ FEMALE ]</h5>
					</div>

					<div class="panel-body"
						style="height: 431px; overflow-y: scroll; overflow-x: hidden;">

						<%
							try {
								DBManager.loadDriver();
								int i = 1;
							
								ResultSet rs = null;
								int pcnt = 0;
								rs = DBManager.fetchQuery(
										"select count(*) from tourPool where tourId=" + tourId + " and tpgender='F' group by pname;");
								if (rs.last())
									pcnt = rs.getRow();
								else
								{
									%>
						<h3>NO MATCHE FOUND</h3>
						<% 
								}

								for (int k = 0; k < pcnt; k++) {
									rs = null;
						%>
						<h4 style="text-align: center;">
							POOL -
							<%=((char) (65 + k))%></h4>
						<table class="table table-responsive">

							<thead class="thead-inverse"
								style="background: #337ab7; color: #ffffff; text-transform: uppercase;">
								<tr>
									<th>#</th>
									<th>Team Name</th>
									<th>P</th>
									<th>W</th>
									<th>L</th>
									<th>Points</th>
								</tr>
							</thead>
							<tbody>
								<%
								int tid1 = 0, tid2 = 0;
										rs = DBManager.fetchQuery("select *,(select tName from team t where t.tId = tt.tId and tt.ttId=tp.ttId) as tName,(select count(mid) from tourPointTable where tourId="+tourId+" and (tid1=tp.ttId or tid2=tp.ttId) and mtype='league' and gender=tpgender) as P,(select count(winner) from tourPointTable where tourId="+tourId+" and winner=tp.ttId and mtype='league' and gender=tpgender and winner!=0) as W,(select count(looser) from tourPointTable where tourId="+tourId+" and looser=tp.ttId and mtype='league' and gender=tpgender and looser!=0) as L from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="+tourId+" and tpgender='F' and pname="+(k+1)+" order by W desc;");
										if(rs.next())
										{
											rs.beforeFirst();
										while(rs.next())
										{
							%>

								<tr>
									<td style="font-size: 16px;"><b><%=i++%></b></td>
									<td><span
										style="font-size: 16px; text-transform: uppercase;"><%=rs.getString("tName")%></span></td>
									<td style="text-align: center; font-size: 16px;"><span><%=rs.getInt("P")%></span></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("W")%></td>
									<td style="text-align: center; font-size: 16px;"><%=rs.getInt("L")%></td>
									<td style="text-align: center; font-size: 16px;"><b><%=(rs.getInt("W")*2)%></b></td>
								</tr>
								<%	
								
									}
										}
										else
										{
										%>


								<tr>
									<td
										style="font-family: gotham-light, sans-serif; font-size: 16px; height: 36px; text-transform: uppercase;"><b></b></td>
									<td><span
										style="font-family: gotham-light, sans-serif; font-size: 16px; text-transform: uppercase;">
									</span></td>
									<td style="text-align: center;"><span><b></b></span></td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;"></td>
									<td style="text-align: center;"></td>
								</tr>
								<% 	
										}
										i=1;
										%>
							</tbody>
						</table>
						<%
							}
							} catch (Exception e) {
								e.getMessage();
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>