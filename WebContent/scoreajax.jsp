<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

					<div class="row services">
						<div class="col-md-6">
							<div class="service">
								<div class="icon-holder">
									<img src="images1/icons/heart-blue.png" alt="" class="icon">
								</div>
								<%
								
									int tourId=Integer.parseInt(request.getParameter("tourId"));
									
								ResultSet rs = DBManager.fetchQuery(
												"select mid,tid1,tid2,gender,mtype,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid1 and tourId="
														+ tourId
														+ ") as tname1,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid2 and tourId="
														+ tourId + ") as tname2 from print_match pm where court=1 and tourId=" + tourId
														+ " and pm.mid in(select mid from wmatch where Flag = '1' and tourId="+tourId+") order by srno desc");
									
									
									if (rs.next()) {
											String gen = "";
											if (rs.getString("gender").equals("M")) {
												gen = "MALE";
											} else {
												gen = "FEMALE";
											}
											int scoreA = 0;
											ResultSet score1 = DBManager
													.fetchQuery("select sum(score) as score1 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " group by ttId");
											if (score1.next()) {
												scoreA = score1.getInt("score1");
											}

											int scoreB = 0;
											ResultSet score2 = DBManager
													.fetchQuery("select sum(score) as score2 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " group by ttId");
											if (score2.next()) {
												scoreB = score2.getInt("score2");
											}
								%>

								<h4 class="heading">
									Ground 1<br> Match No:
									<%=rs.getInt("mid")%>
									[<%=gen%>] <br><%=rs.getString("tname1")%>
									<%=scoreA%>
									:
									<%=scoreB%>
									<%=rs.getString("tname2")%>
								</h4>
								<p class="description"></p>
								<%
									}
										else
										{
											%>
											<h1 class="heading">
											Coming Soon
											</h1>
											<% 
										}
								%>
							</div>
						</div>
						<div class="col-md-6">
							<div class="service">
								<div class="icon-holder">
									<img src="images1/icons/guru-blue.png" alt="" class="icon">
								</div>
								<%
									rs = null;
										rs = DBManager.fetchQuery(
												"select mid,tid1,tid2,gender,mtype,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid1 and tourId="
														+ tourId
														+ ") as tname1,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid2 and tourId="
														+ tourId + ") as tname2 from print_match pm where court=2 and tourId=" + tourId
														+ " and pm.mid in(select mid from wmatch where Flag = '1' and tourId="+tourId+") order by srno desc");
										if (rs.next()) {
											String gen = "";
											if (rs.getString("gender").equals("M")) {
												gen = "MALE";
											} else {
												gen = "FEMALE";
											}
											int scoreA = 0;
											ResultSet score1 = DBManager
													.fetchQuery("select sum(score) as score1 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " group by ttId");
											if (score1.next()) {
												scoreA = score1.getInt("score1");
											}

											int scoreB = 0;
											ResultSet score2 = DBManager
													.fetchQuery("select sum(score) as score2 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " group by ttId");
											if (score2.next()) {
												scoreB = score2.getInt("score2");
											}
								%>


								<h4 class="heading">
									Ground 2<br> Match No:
									<%=rs.getInt("mid")%>
									[<%=gen%>] <br><%=rs.getString("tname1")%>
									<%=scoreA%>
									:
									<%=scoreB%>
									<%=rs.getString("tname2")%>
								</h4>
								<p class="description"></p>
								<%
									}
										else
										{
											%>
											<h1 class="heading">
											Coming Soon
											</h1>
											<% 
										}
								%>
							</div>
						</div>
						<%-- <div class="col-md-4 hide">
							<div class="service">
								<div class="icon-holder">
									<img src="images1/icons/weight-blue.png" alt="" class="icon">
								</div>
								<%
									rs = null;
										rs = DBManager.fetchQuery(
												"select mid,tid1,tid2,gender,mtype,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid1 and tourId="
														+ tourId
														+ ") as tname1,(select tName from team t ,tourTeam tt where t.tId=tt.tId and tt.ttId=pm.tid2 and tourId="
														+ tourId + ") as tname2 from print_match pm where court=3 and tourId=" + tourId
														+ " order by srno desc");
										if (rs.next()) {
											String gen = "";
											if (rs.getString("gender").equals("M")) {
												gen = "MALE";
											} else {
												gen = "FEMALE";
											}

											int scoreA = 0;
											ResultSet score1 = DBManager
													.fetchQuery("select sum(score) as score1 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " group by ttId");
											if (score1.next()) {
												scoreA = score1.getInt("score1");
											}

											int scoreB = 0;
											ResultSet score2 = DBManager
													.fetchQuery("select sum(score) as score2 from tourRestore where mid=" + rs.getInt("mid")
															+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " group by ttId");
											if (score2.next()) {
												scoreB = score2.getInt("score2");
											}
								%>

								<h4 class="heading">
									Ground 3<br> Match No:
									<%=rs.getInt("mid")%>
									[<%=gen%>] <br><%=rs.getString("tname1")%>
									<%=scoreA%>
									:
									<%=scoreB%>
									<%=rs.getString("tname2")%>
								</h4>
								<p class="description"></p>
								<%
									}
								%>
							</div>
						</div> --%>
					</div>

</body>
</html>