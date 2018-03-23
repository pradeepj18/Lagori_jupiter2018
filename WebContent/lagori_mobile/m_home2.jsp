<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="row">
		<div class="col-md-12 col-xs-12" style="margin-top: 6px;">

			<%
				try {
					ResultSet rs = null;
					String tourId = request.getParameter("tourId");
					rs = null;

					ResultSet rs1 = null;
					rs = DBManager.fetchQuery(
							"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
									+ request.getParameter("tourId")
									+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
									+ request.getParameter("tourId")
									+ ") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W %d %b.%y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from print_match pm where mtype!='league' and tourId="
									+ tourId + " order by srno desc limit 6");
					if (rs.next()) {
						rs.beforeFirst();
						while (rs.next()) {

							rs1 = null;
							rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tt1 where tourId="
									+ tourId + " and tt1.ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
									+ ") as sum1,(select sum(score) from tourRestore tt2 where tourId=" + tourId
									+ " and tt2.ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
									+ ") as sum2 from print_match pm where mid=" + rs.getInt("mid") + " and tid1="
									+ rs.getInt("tid1") + " and tid2=" + rs.getInt("tid2") + " and tourId=" + tourId + ";");

							if (rs1.next()) {
			%>

			<div class="row">
				<div class="col-xs-12 result-head">
					<span class="result-date"><%=rs.getString("mdate")%>&nbsp;</span><span
						style="color: #000;"></span> <span class="result-place"
						style="float: right;"><%=rs.getString("mtype")%></span>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-5 result-teams">
					<span class="result-team1"
						style="white-space: nowrap; float: left;"><%=rs.getString("tname1")%></span>
				</div>
				<div class="col-xs-2 result-teams">
					<span class="score" style="float: left; margin-left: 0px;"><%=rs1.getInt("sum1")%>&nbsp;-&nbsp;<%=rs1.getInt("sum2")%>&nbsp;<span>[<%=rs.getString("gender")%>]
					</span> </span>
				</div>
				<div class="col-xs-5 result-teams">
					<span class="result-team2"
						style="float: right; white-space: nowrap;"><%=rs.getString("tname2")%></span>
				</div>
			</div>
			<%
				}
						}
					} else {
						rs = null;

						rs1 = null;
						rs = DBManager.fetchQuery(
								"select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
										+ request.getParameter("tourId")
										+ ") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
										+ request.getParameter("tourId")
										+ ") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W %d %b.%y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from print_match pm where tourId="
										+ tourId + " order by srno desc limit 6");
						if (rs.next()) {
							rs.beforeFirst();
							while (rs.next()) {

								rs1 = null;
								rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tt1 where tourId="
										+ tourId + " and tt1.ttId=" + rs.getInt("tid1") + " and mid=" + rs.getInt("mid")
										+ ") as sum1,(select sum(score) from tourRestore tt2 where tourId=" + tourId
										+ " and tt2.ttId=" + rs.getInt("tid2") + " and mid=" + rs.getInt("mid")
										+ ") as sum2 from print_match pm where mid=" + rs.getInt("mid") + " and tid1="
										+ rs.getInt("tid1") + " and tid2=" + rs.getInt("tid2") + " and tourId=" + tourId
										+ ";");

								if (rs1.next()) {
			%>

			<div class="row">
				<div class="col-xs-12 result-head">
					<span class="result-date"><%=rs.getString("mdate")%>&nbsp;</span><span
						style="color: #000;"></span> <span class="result-place"
						style="float: right;"><%=rs.getString("mtype")%></span>
				</div>
			</div>
			<div class="row">
				<div class="col-xs-5 result-teams">
					<span style="white-space: nowrap; float: left;"><%=rs.getString("tname1")%></span>
				</div>
				<div class="col-xs-2 result-teams">
					<span style="float: left;"><%=rs1.getInt("sum1")%>&nbsp;-&nbsp;<%=rs1.getInt("sum2")%>&nbsp;<span>[<%=rs.getString("gender")%>]
					</span> </span>
				</div>
				<div class="col-xs-5 result-teams">
					<span style="float: right; white-space: nowrap;"><%=rs.getString("tname2")%></span>
				</div>
			</div>
			<%
				}
							}
						} else {
							// System.out.println("++++");
			%>

			<div class="row">
				<div class="col-xs-12 result-head">
					<span style="color: #fff;">Not Found</span>

				</div>
			</div>

			<%
				}
					}
			%>

			<%
				} catch (Exception e) {
					System.out.println("Home1.jsp" + e);
				}
			%>
		</div>
	</div>
</body>
</html>