<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Score Sheet</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../css/m_lagoriScoreSheet.css">
<style>
tr.border_bottom td {
	border-bottom: 1pt solid black;
}

* {
	box-sizing: border-box;
}

#date {
	margin-top: 0px;
}

#wicket {
	margin-top: -8.9%;
	margin-left: -10%;
}

#score {
	margin-top: -0.2%;
	margin-left: -10%;
}

#wonby {
	margin-top: 1%;
}

#sign {
	margin-top: 0.3%;
}

#table {
	margin-top: 0.3%;
}

#referee {
	margin-top: 0.3%;
}

#teamA {
	width: 72.4%;
	border: 1px solid;
	margin-top: -0.1%;
	margin-left: 1.3%;
}

#golden {
	border: 1px solid;
	margin-top: -1.6%;
	margin-left: 0%;
	margin-right: 2.2%;
}

@media print {
	* {
		color: #000 !important;
		text-shadow: none !important;
		background: transparent !important;
		box-shadow: none !important;
	}
	.hide-p{visiblity:hidden;}
	#date {
		margin-top: 2%;
	}
	#teamA {
		margin-top: 0.2%;
		width: 71%;
	}
	#playerA {
		margin-left: -1%;
		margin-top: 0%;
	}
	#score {
		margin-top: -17%;
		margin-left: -18%;
		font-size: 11.3pt;
	}
	#wicket {
		margin-top: -13%;
		margin-left: -18%;
	}
	#golden {
		margin-top: -2.6%;
		margin-left: -0.7%;
		width: 104.7%;
	}
	html, body {
		height: 100%;
		background: #FFF;
		font-size: 11pt;
		font-family: Arial, Helvetica, sans-serif;
	}
	@page {
		size: A4;
		margin: 0cm 0.8cm 0.0cm -0.5cm;
	}
}
</style>
<body>
	<%
		try {
			String mid = request.getParameter("mid");
			int pool = 0;
			int winner = 0, looser = 0;
			String mtype = "";
			DBManager.loadDriver();
			ResultSet rs = null, rs1 = null;
			rs = DBManager.fetchQuery(
					"select mid,DATE_FORMAT(mdate,'%d-%m-%X') as mdate,tid1,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid1 and tourId="
							+ request.getParameter("tourId")
							+ ") as tname1,tid2,(select tName from team t,tourTeam tt where t.tId = tt.tId and tt.ttId=tid2 and tourId="
							+ request.getParameter("tourId")
							+ ") as tname2,mtime,gender,mtype,pool from wmatch where mid=" + mid + " and tourId="
							+ request.getParameter("tourId") + " and gender='" + request.getParameter("gen")
							+ "';");

			String tname1 = "NO NAME";
			String tname2 = "NO NAME";
			int tid1 = 0;
			int tid2 = 0;
			String gender = "";
			String mdate = "00-00-0000";
			if (rs.next()) {
				tname1 = rs.getString("tname1");
				tname2 = rs.getString("tname2");
				tid1 = rs.getInt("tid1");
				tid2 = rs.getInt("tid2");
				gender = rs.getString("gender");
				mdate = rs.getString("mdate");
				pool = rs.getInt("pool");
				mtype = rs.getString("mtype");
			}
			rs1 = DBManager.fetchQuery(
					"select court,(select tName from tourTeam tt,team t where tt.tId = t.tId and tt.ttId = twon and tourId="
							+ request.getParameter("tourId") + ") as tosswon from print_match where tourId="
							+ request.getParameter("tourId") + " and mid=" + request.getParameter("mid")
							+ " and gender='" + gender + "'");
			String court = "-";
			String tosswon = "-";
			if (rs1.next()) {
				court = rs1.getString("court");
				tosswon = rs1.getString("tosswon");
			}
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-2 col-xs-2"></div>
			<div class="col-md-8 col-xs-8">
				<%
					rs1 = DBManager.fetchQuery("select tourName,tourOrgBy,tourVenue from tournament where tourId="
								+ request.getParameter("tourId"));
						if (rs1.next()) {
				%>
				<center>
					<b><u>LAGORI SCORE SHEET</u></b>
				</center>
				<center>
					<b>Event:</b><%=rs1.getString("tourName")%><br> <b>Org.By:</b><%=rs1.getString("tourOrgBy")%><br>
					<b>Venue:</b><%=rs1.getString("tourVenue")%><br>
					<%
						}
					%>
				</center>
				<b>Teams:</b>&nbsp;&nbsp;<%=tname1%><b>&nbsp;&nbsp;VS</b>&nbsp;&nbsp;<%=tname2%>
			</div>
			<div class="col-md-2 col-xs-2" id="date">
				<b>Date:</b><%=mdate%><br> <b>Court:</b><%=court%><br> <b><%=rs.getString("mtype")%></b><br>
				<b>Match No:</b><%=mid%>
			</div>
		</div>
		<div class="row">
			<div class="col-md-8 col-xs-8" id="teamA">
				<div class="col-md-8 col-xs-8">
					<b>Name Of Team A:</b><%=tname1%><br> <b>Team Fouls:</b>
				</div>
				<div class="col-md-4 col-xs-4">
					<b>Toss Won By:</b><%=tosswon%><br> <b>Uniform color:</b><br>
					<b>Time: </b>
					<%
						rs = DBManager.fetchQuery("select TIME_FORMAT(now(),'%h:%i:%s') as time;");
							if (rs.next()) {
					%>
					<%=rs.getString("time")%>
					<%
						}
					%>
				</div>

			</div>
		</div>
		<%
			rs = null;
				rs = DBManager.fetchQuery(
						"select jerseyNo,(select fName from member where member.barcodeId = tp.barcodeId) as fname,(select lName from member where member.barcodeId = tp.barcodeId) as lname from tourPlayer tp where tourId="
								+ request.getParameter("tourId") + " and ttId =" + tid1);
		%>
		<div class="row">
			<div class="col-md-9 col-xs-9">
				<table class="table" border="1" id="playerA">

					<thead>
						<tr class="border_bottom">
							<th scope="row" width=1% style="padding: 0.1%;">SR NO</th>
							<th scope="row" width=1% style="padding: 0.1%;"><center>Chest
									No</center></th>
							<th scope="row" width=25% style="padding: 0.1%;"><center>Player
									Full Name</center></th>
							<th scope="row" width=1% style="padding: 0.1%;">Foul</th>
							<th scope="row" width=1% style="padding: 0.1%;">No of Lagori
								Break</th>
							<th scope="row" width=1% style="padding: 0.1%;">No of Lagori
								Restore</th>
							<th scope="row" width=1% style="padding: 0.1%;">Wicket taken</th>
						</tr>
					</thead>
					<tbody>
						<%
							ResultSet rsHit = DBManager.fetchQuery(
										"select (select count(barcodeId) as hit from tourHit h where h.barcodeId=p.barcodeId and mid="
												+ request.getParameter("mid")
												+ " and p.tourId=h.tourId) as hit from tourPlayer p where ttId=" + tid1 + " and tourId="
												+ request.getParameter("tourId") + ";");
								ResultSet rsRestore = DBManager.fetchQuery(
										"select jerseyNo,(select count(barcodeId) from tourRestore h where h.barcodeId=p.barcodeId and mid="
												+ request.getParameter("mid")
												+ " and p.tourId=h.tourId) as hit from tourPlayer p where ttId=" + tid1 + " and tourId="
												+ request.getParameter("tourId") + ";");
								for (int i = 1; i <= 12; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.1%;"><center><%=i%></center></td>
							<td style="padding: 0.1%;">
								<center>
									<%
										if (rs.next()) {
									%>
									<%=rs.getInt("jerseyNo")%>
									<%
										rs.previous();
												} else {
									%>
									&nbsp;
									<%
										}
									%>
								</center>
							</td>
							<td style="padding: 0.1%;">
								<%
									if (rs.next()) {
								%> <%=rs.getString("fName")%> <%
 	} else {
 %> &nbsp; <%
 	}
 %>
							</td>
							<td style="padding: 0.1%;">&nbsp;</td>
							<td style="padding: 0.1%;"><center>
									<b>
										<%
											if (rsHit.next()) {
														out.print(rsHit.getInt("hit"));
													}
										%>
									</b>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<b>
										<%
											if (rsRestore.next()) {
														out.print(rsRestore.getInt("hit"));
													}
										%>
									</b>
								</center></td>
							<td style="padding: 0.1%;">&nbsp;</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
			<div class="col-md-3 col-xs-3" style="margin-top: -5.2%;">
				<table class="table" border=1 id="score">
					<thead>
						<tr class="border_bottom">
							<th style="padding: 0.7%;">1st</th>
							<th style="padding: 0.7%;">2nd</th>
							<th style="padding: 0.7%;">3rd</th>
							<th style="padding: 0.7%;">4th</th>
							<th style="padding: 0.7%;">5th</th>
						</tr>
						<tr class="border_bottom">
							<%
								for (int i = 0; i < 5; i++) {
							%>
							<th style="padding: 0.5%;">Score</th>
							<%
								}
							%>
						</tr>
					</thead>
					<tbody>
						<%
							ResultSet rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='1'");
								ResultSet rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='2'");
								ResultSet rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='3'");
								ResultSet rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='4'");
								ResultSet rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='5'");
								ResultSet rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid1 + " and rtype='6'");

								ResultSet rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and turn=" + tid1 + " and wtype='1'");
								ResultSet rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and turn=" + tid1 + " and wtype='2'");
								ResultSet rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and turn=" + tid1 + " and wtype='3'");
								ResultSet rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and turn=" + tid1 + " and wtype='4'");
								ResultSet rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and turn=" + tid1 + " and wtype='5'");

								int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;
								for (int i = 0; i < 12; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.3%;">
								<%
									if (rsscore1.next()) {
												count1 = count1 + rsscore1.getInt("score");
								%><center><%=rsscore1.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore2.next()) {
												count2 = count2 + rsscore2.getInt("score");
								%><center><%=rsscore2.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore3.next()) {
												count3 = count3 + rsscore3.getInt("score");
								%><center><%=rsscore3.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore4.next()) {
												count4 = count4 + rsscore4.getInt("score");
								%><center><%=rsscore4.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore5.next()) {
												count5 = count5 + rsscore5.getInt("score");
								%><center><%=rsscore5.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
						</tr>
						<%
							}
								if (rswicket1.next()) {
									count1 = count1 - (rswicket1.getInt("count(wno)") * 5);
									if (count1 < 0) {
										count1 = 0;
									}
									rswicket1.beforeFirst();
								}
								if (rswicket2.next()) {
									count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
									if (count2 < 0) {
										count2 = 0;
									}
									rswicket2.beforeFirst();
								}
								if (rswicket3.next()) {
									count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
									if (count3 < 0) {
										count3 = 0;
									}
									rswicket3.beforeFirst();
								}
								if (rswicket4.next()) {
									count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
									if (count4 < 0) {
										count4 = 0;
									}
									rswicket4.beforeFirst();
								}
								if (rswicket5.next()) {
									count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
									if (count5 < 0) {
										count5 = 0;
									}
									rswicket5.beforeFirst();
								}
						%>
						<tr class="border_bottom">
							<td style="padding: 0.3%;"><center>
									<b><%=count1%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count2%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count3%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count4%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count5%></b>
								</center></td>
						</tr>
					</tbody>
				</table>
				<table class="table" border="1" id="wicket">
					<thead>
						<tr class="border_bottom">
							<%
								for (int i = 0; i < 5; i++) {
							%>

							<th style="padding: 0.1%;"><font size="2">Wicket</font></th>
							<%
								}
							%>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < 1; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket1.next()) {
													out.print(rswicket1.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket2.next()) {
													out.print(rswicket2.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket3.next()) {
													out.print(rswicket3.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket4.next()) {
													out.print(rswicket4.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket5.next()) {
													out.print(rswicket5.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
						</tr>

						<%
							}
								//GOLDEN HIT FOR TEAM 1
								int golden1 = 0;
								if (rsscore6.next()) {
									golden1 = rsscore6.getInt("score");
								}

								//NO OF SET WON CALCULATE
								rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='1'");
								rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='2'");
								rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='3'");
								rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='4'");
								rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='5'");
								rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid=" + mid
										+ " and tourId=" + request.getParameter("tourId") + " and ttId=" + tid2 + " and rtype='6'");

								rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and turn=" + tid2 + " and wtype='1'");
								rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and turn=" + tid2 + " and wtype='2'");
								rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and turn=" + tid2 + " and wtype='3'");
								rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and turn=" + tid2 + " and wtype='4'");
								rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + mid + " and tourId="
										+ request.getParameter("tourId") + " and turn=" + tid2 + " and wtype='5'");

								int countB1 = 0, countB2 = 0, countB3 = 0, countB4 = 0, countB5 = 0;
								for (int i = 0; i < 12; i++) {
									if (rsscore1.next()) {
										countB1 = countB1 + rsscore1.getInt("score");
									}
									if (rsscore2.next()) {
										countB2 = countB2 + rsscore2.getInt("score");
									}
									if (rsscore3.next()) {
										countB3 = countB3 + rsscore3.getInt("score");
									}
									if (rsscore4.next()) {
										countB4 = countB4 + rsscore4.getInt("score");
									}
									if (rsscore5.next()) {
										countB5 = countB5 + rsscore5.getInt("score");
									}
								}
								rsscore1.beforeFirst();
								rsscore2.beforeFirst();
								rsscore3.beforeFirst();
								rsscore4.beforeFirst();
								rsscore5.beforeFirst();
								if (rswicket1.next()) {
									countB1 = countB1 - (rswicket1.getInt("count(wno)") * 5);
									if (countB1 < 0) {
										countB1 = 0;
									}
									rswicket1.beforeFirst();
								}
								if (rswicket2.next()) {
									countB2 = countB2 - (rswicket2.getInt("count(wno)") * 5);
									if (countB2 < 0) {
										countB2 = 0;
									}
									rswicket2.beforeFirst();
								}
								if (rswicket3.next()) {
									countB3 = countB3 - (rswicket3.getInt("count(wno)") * 5);
									if (countB3 < 0) {
										countB3 = 0;
									}
									rswicket3.beforeFirst();
								}
								if (rswicket4.next()) {
									countB4 = countB4 - (rswicket4.getInt("count(wno)") * 5);
									if (countB4 < 0) {
										countB4 = 0;
									}
									rswicket4.beforeFirst();
								}
								if (rswicket5.next()) {
									countB5 = countB5 - (rswicket5.getInt("count(wno)") * 5);
									if (count5 < 0) {
										countB5 = 0;
									}
									rswicket5.beforeFirst();
								}
								int setwonA = 0, setwonB = 0;
								if (count1 > countB1) {
									setwonA = setwonA + 1;
								} else if (count1 < countB1) {
									setwonB = setwonB + 1;
								}
								if (count2 > countB2) {
									setwonA = setwonA + 1;
								} else if (count2 < countB2) {
									setwonB = setwonB + 1;
								}
								if (count3 > countB3) {
									setwonA = setwonA + 1;
								} else if (count3 < countB3) {
									setwonB = setwonB + 1;
								}
								if (count4 > countB4) {
									setwonA = setwonA + 1;
								} else if (count4 < countB4) {
									setwonB = setwonB + 1;
								}
								if (count5 > countB5) {
									setwonA = setwonA + 1;
								} else if (count5 < countB5) {
									setwonB = setwonB + 1;
								}

								//GOLDEN HIT FOR TEAM 2
								int golden2 = 0;
								if (rsscore6.next()) {
									golden2 = rsscore6.getInt("score");
								}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row" id="golden">
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<font size="3">&nbsp;&nbsp;No of Sets Won:&nbsp;&nbsp;&nbsp;<b><%=setwonA%></b></font>
			</div>
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<center>
					<font size="3">Golden Hit:&nbsp;&nbsp;&nbsp;<b><%=golden1%></b></font>
				</center>
			</div>
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<center>
					<font size="3">Warning:__</font>
				</center>
			</div>
			<!-- <div class="col-md-8 col-xs-8" style="margin-top:-1.5%; width:97.5%;height:20%;margin-left:1.3%;border:1px solid;"> -->


		</div>

		<!-- TABLE 2 -->
		<div class="row">
			<div class="col-md-8 col-xs-8" id="teamA">
				<div class="col-md-8 col-xs-8">
					<b>Name Of Team B:</b><%=tname2%><br> <b>Team Fouls:</b>
				</div>
				<div class="col-md-4 col-xs-4">
					<b>Toss Won By:</b><br> <b>Uniform color:</b><br> <b>Time:
					</b>
					<%
						rs = DBManager.fetchQuery("select TIME_FORMAT(now(),'%h:%i:%s') as time;");
							if (rs.next()) {
								out.print(rs.getString("time"));
							}
					%>
				</div>

			</div>
		</div>
		<%
			rs = null;
				rs = DBManager.fetchQuery(
						"select jerseyNo,(select fName from member where member.barcodeId = tp.barcodeId) as fname,(select lName from member where member.barcodeId = tp.barcodeId) as lname from tourPlayer tp where tourId="
								+ request.getParameter("tourId") + " and ttId =" + tid2);
		%>
		<div class="row">
			<div class="col-md-9 col-xs-9">
				<table class="table" border="1" id="playerA">

					<thead>
						<tr class="border_bottom">
							<th scope="row" width=1% style="padding: 0.1%;">SR NO</th>
							<th scope="row" width=1% style="padding: 0.1%;"><center>Chest
									No</center></th>
							<th scope="row" width=25% style="padding: 0.1%;"><center>Player
									Full Name</center></th>
							<th scope="row" width=1% style="padding: 0.1%;">Foul</th>
							<th scope="row" width=1% style="padding: 0.1%;">No of Lagori
								Break</th>
							<th scope="row" width=1% style="padding: 0.1%;">No of Lagori
								Restore</th>
							<th scope="row" width=1% style="padding: 0.1%;">Wicket taken</th>
						</tr>
					</thead>
					<tbody>
						<%
							rsHit = DBManager.fetchQuery(
										"select (select count(barcodeId) as hit from tourHit h where h.barcodeId=p.barcodeId and mid="
												+ request.getParameter("mid")
												+ " and p.tourId=h.tourId) as hit from tourPlayer p where ttId=" + tid2 + " and tourId="
												+ request.getParameter("tourId") + ";");
								rsRestore = DBManager.fetchQuery(
										"select jerseyNo,(select count(barcodeId) from tourRestore h where h.barcodeId=p.barcodeId and mid="
												+ request.getParameter("mid")
												+ " and p.tourId=h.tourId) as hit from tourPlayer p where ttId=" + tid2 + " and tourId="
												+ request.getParameter("tourId") + ";");
								for (int i = 1; i <= 12; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.1%;"><center><%=i%></center></td>
							<td style="padding: 0.1%;">
								<center>
									<%
										if (rs.next()) {
									%>
									<%=rs.getInt("jerseyNo")%>
									<%
										rs.previous();
												} else {
									%>
									&nbsp;
									<%
										}
									%>
								</center>
							</td>
							<td style="padding: 0.1%;">
								<%
									if (rs.next()) {
								%> <%=rs.getString("fName")%> <%
 	} else {
 %> &nbsp; <%
 	}
 %>
							</td>
							<td style="padding: 0.1%;">&nbsp;</td>
							<td style="padding: 0.1%;"><center>
									<b>
										<%
											if (rsHit.next()) {
														out.print(rsHit.getInt("hit"));
													}
										%>
									</b>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<b>
										<%
											if (rsRestore.next()) {
														out.print(rsRestore.getInt("hit"));
													}
										%>
									</b>
								</center></td>
							<td style="padding: 0.1%;">&nbsp;</td>
						</tr>
						<%
							}
						%>

					</tbody>
				</table>
			</div>
			<div class="col-md-3 col-xs-3" style="margin-top: -5.2%;">
				<table class="table" border=1 id="score">
					<thead>
						<tr class="border_bottom">
							<th style="padding: 0.7%;">1st</th>
							<th style="padding: 0.7%;">2nd</th>
							<th style="padding: 0.7%;">3rd</th>
							<th style="padding: 0.7%;">4th</th>
							<th style="padding: 0.7%;">5th</th>
						</tr>
						<tr class="border_bottom">
							<%
								for (int i = 0; i < 5; i++) {
							%>
							<th style="padding: 0.5%;">Score</th>
							<%
								}
							%>
						</tr>
					</thead>
					<tbody>
						<%
							count1 = 0;
								count2 = 0;
								count3 = 0;
								count4 = 0;
								count5 = 0;
								for (int i = 0; i < 12; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.3%;">
								<%
									if (rsscore1.next()) {
												count1 = count1 + rsscore1.getInt("score");
								%><center><%=rsscore1.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore2.next()) {
												count2 = count2 + rsscore2.getInt("score");
								%><center><%=rsscore2.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore3.next()) {
												count3 = count3 + rsscore3.getInt("score");
								%><center><%=rsscore3.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore4.next()) {
												count4 = count4 + rsscore4.getInt("score");
								%><center><%=rsscore4.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
							<td style="padding: 0.3%;">
								<%
									if (rsscore5.next()) {
												count5 = count5 + rsscore5.getInt("score");
								%><center><%=rsscore5.getInt("score")%></center>
								<%
									} else {
								%>&nbsp;<%
									}
								%>
							</td>
						</tr>
						<%
							}
								if (rswicket1.next()) {
									count1 = count1 - (rswicket1.getInt("count(wno)") * 5);
									if (count1 < 0) {
										count1 = 0;
									}
									rswicket1.beforeFirst();
								}
								if (rswicket2.next()) {
									count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
									if (count2 < 0) {
										count2 = 0;
									}
									rswicket2.beforeFirst();
								}
								if (rswicket3.next()) {
									count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
									if (count3 < 0) {
										count3 = 0;
									}
									rswicket3.beforeFirst();
								}
								if (rswicket4.next()) {
									count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
									if (count4 < 0) {
										count4 = 0;
									}
									rswicket4.beforeFirst();
								}
								if (rswicket5.next()) {
									count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
									if (count5 < 0) {
										count5 = 0;
									}
									rswicket5.beforeFirst();
								}
						%>
						<tr class="border_bottom">
							<td style="padding: 0.3%;"><center>
									<b><%=count1%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count2%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count3%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count4%></b>
								</center></td>
							<td style="padding: 0.3%;"><center>
									<b><%=count5%></b>
								</center></td>
						</tr>
					</tbody>
				</table>
				<table class="table" border="1" id="wicket">
					<thead>
						<tr class="border_bottom">
							<%
								for (int i = 0; i < 5; i++) {
							%>

							<th style="padding: 0.1%;"><font size="2">Wicket</font></th>
							<%
								}
							%>
						</tr>
					</thead>
					<tbody>
						<%
							for (int i = 0; i < 1; i++) {
						%>
						<tr class="border_bottom">
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket1.next()) {
													out.print(rswicket1.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket2.next()) {
													out.print(rswicket2.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket3.next()) {
													out.print(rswicket3.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket4.next()) {
													out.print(rswicket4.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
							<td style="padding: 0.1%;"><center>
									<%
										if (rswicket5.next()) {
													out.print(rswicket5.getInt("count(wno)"));
												} else {
									%>&nbsp;<%
										}
									%>
								</center></td>
						</tr>

						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
		<div class="row" id="golden">
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<font size="3">&nbsp;&nbsp;No of Sets Won:&nbsp;&nbsp;&nbsp;<b><%=setwonB%></b></font>
			</div>
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<center>
					<font size="3">Golden Hit:&nbsp;&nbsp;&nbsp;<b><%=golden2%></b></font>
				</center>
			</div>
			<div class="col-md-4 col-xs-4" style="margin-top: -1.4%;">
				<center>
					<font size="3">Warning:__</font>
				</center>
			</div>
			<!-- <div class="col-md-8 col-xs-8" style="margin-top:-1.5%; width:97.5%;height:20%;margin-left:1.3%;border:1px solid;"> -->


		</div>

		<div class="row">
			<div class="col-md-12 col-xs-12">
				<%
					int ws = 0, ls = 0;
						String won = null;
						if (setwonA > setwonB) {
							ws = ws + setwonA;
							ls = ls + setwonB;
							won = tname1;
							winner = tid1;
							looser = tid2;
						} else if (setwonA < setwonB) {
							ws = ws + setwonB;
							ls = ls + setwonA;
							won = tname2;
							winner = tid2;
							looser = tid1;
						} else {
							if (golden1 > golden2) {
								ws = setwonA + golden1;
								ls = setwonB + golden2;
								won = tname1;
								winner = tid1;
								looser = tid2;
							} else if (golden1 < golden2) {
								ws = setwonB + golden2;
								ls = setwonA + golden1;
								won = tname2;
								winner = tid2;
								looser = tid1;
							} else {
								won = "DRAW";
								looser = 0;
								winner = 0;
								ws = setwonA;
								ls = setwonB;
							}
						}
				%>
				<div id="wonby">
					<center>
						<b>Won By:&nbsp;&nbsp;&nbsp;<%=won%></b>
					</center>
				</div>
				<div id="sign">
					<center>CAPTAIN SIGNATURE:Team A:____________ Team
						B:___________________</center>
				</div>
				<div id="table">
					<center>TABLE OFFICIAL(Name ang
						sign)________________________________</center>
				</div>
				<div id="referee">
					<center>REFEREE(Name and
						sign)_______________________________</center>
				</div>


			</div>
		</div><br><br>
	<%-- 	<div class="col-md-12 col-xs-12 col-sm-12" style="text-align:center">
			<button class="btn btn-info hide-p" onclick="getprint(<%=request.getParameter("tourId")%>,<%=mid%>,'<%=gender%>')">Print Here</button>
		</div> --%>
	</div>
	<%
		try {
				ResultSet w = DBManager.fetchQuery("select mid from wmatch where Flag='2' and tourId='"
						+ request.getParameter("tourId") + "' and mid=" + mid + " and gender='" + gender + "';");
				if (!w.next())
					new DBManager()
							.insert("update wmatch set Flag='2' where tourId='" + request.getParameter("tourId")
									+ "' and mid=" + mid + " and gender='" + gender + "';");
			} catch (Exception e) {
				System.out.println("Error ScoreSheet update wmatch : " + e);
			}
			try {
				if (mtype.equalsIgnoreCase("league") || mtype == "league") {
					ResultSet r = DBManager.fetchQuery("select mid from tourPointTable where tourId='"
							+ request.getParameter("tourId") + "' and mid=" + mid + " and gender='" + gender
							+ "' and tid1=" + tid1 + " and tid2=" + tid2 + ";");
					if (r.next()) {
						//System.out.println("UP");
						new DBManager().insert("update tourPointTable set pool=" + pool + ",tid1=" + tid1 + ",tid2="
								+ tid2 + ",winner=" + winner + ",looser=" + looser + ",total_set="
								+ (setwonA + setwonB + golden1 + golden2) + ",won_set=" + ws + ",loose_set=" + ls
								+ " where tourId='" + request.getParameter("tourId") + "' and mid=" + mid
								+ " and gender='" + gender + "';");
					} else {
						new DBManager().insert("insert into tourPointTable values("
								+ DBManager.getMaxId("tourPointTable", "ptno") + "," + mid + ","
								+ request.getParameter("tourId") + ",'" + gender + "'," + pool + "," + tid1 + ","
								+ tid2 + ",'league'," + winner + "," + looser + ","
								+ (setwonA + setwonB + golden1 + golden2) + "," + ws + "," + ls + ")");
					}
				}
			} catch (Exception e) {
				System.out.println("Error ScoreSheet update wmatch : " + e);
			}
		} catch (Exception e) {
			System.out.println("ScoreSheet " + e);
		}
	%>
</body>


</html>