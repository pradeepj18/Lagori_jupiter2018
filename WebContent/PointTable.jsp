<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager"
	import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Point Table</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<style>
.break {
	page-break-before: auto;
}
</style>
</head>

<body>
	<div class="container">
		<%
			DBManager.loadDriver();
			int tourId = 1;
			String gen = "M";
			ResultSet rs = null;
			int pcnt = 0;
			rs = DBManager.fetchQuery("select count(*) from tourPool where tourId=" + tourId + " and tpgender='" + gen
					+ "' group by pname;");
			if (rs.last())
				pcnt = rs.getRow();
			String tname[] = new String[50];
			int ttId[] = new int[50];
			int count = 0, i;
			int tid1 = 0, tid2 = 0;
			int score1 = 0, score2 = 0;
			int sum1 = 0, sum2 = 0;
			for (int k = 0; k < pcnt; k++) {
				count = 0;
				out.println("<br><font size=4><b><center><div class='break'>POOL - " + (char) (k + 65)
						+ "</div></center</b></font><br>");
				rs = DBManager.fetchQuery(
						"select *,(select tName from team t where t.tId = tt.tId) as tName from tourPool tp,tourTeam tt where tp.ttId = tt.ttId and tp.tourId="
								+ tourId + " and tpgender='" + gen + "' and pname=" + (k + 1)
								+ " order by tp.ttId asc;");
				while (rs.next()) {
					tname[count] = rs.getString("tName");
					ttId[count++] = rs.getInt("ttId");
				}
		%>
		<table class="table table-bordered table-responsive">
			<thead>
				<tr>
					<th></th>
					<%
						for (i = 0; i < count; i++)
								out.println("<th>" + tname[i] + "</th>");
							out.println("<th>Total Score</th>");
					%>

				</tr>
			</thead>
			<tbody>
				<%
					for (i = 0; i < count; i++) {

							out.println("<tr>");
							out.println("<th>" + tname[i] + "</th>");
							for (int j = 0; j < count; j++) {
								if (i < j) {
									tid1 = ttId[i];
									tid2 = ttId[j];
									score1 = 0;
									score2 = 0;
									//rs=DBManager.fetchQuery("select ttId,sum(score) from tourRestore where mid in(select mid from wmatch m where (m.tid1 = "+tid2+" and m.tid2="+tid1+")or(m.tid1="+tid1+" and m.tid2="+tid2+") and tourId="+tourId+" and gender='"+gen+"') group by ttId order by ttId asc;");
									rs = DBManager.fetchQuery("select (select sum(score) from tourRestore where ttId=" + tid1
											+ " and mid in(select mid from wmatch m where (m.tid1 = " + tid2 + " and m.tid2="
											+ tid1 + ")or(m.tid1=" + tid1 + " and m.tid2=" + tid2 + ") and tourId=" + tourId
											+ " and gender='" + gen
											+ "') group by ttId) as score1,(select sum(score) from tourRestore where ttId="
											+ tid2 + " and mid in(select mid from wmatch m where (m.tid1 = " + tid2
											+ " and m.tid2=" + tid1 + ")or(m.tid1=" + tid1 + " and m.tid2=" + tid2
											+ ") and tourId=" + tourId + " and gender='" + gen
											+ "') group by ttId) as score2;");
									if (rs.next()) {
										rs.beforeFirst();
										if (rs.next()) {
											if (rs.getString("score1") == null)
												score1 = 0;
											else
												score1 = rs.getInt("score1");
											if (rs.getString("score2") == null)
												score2 = 0;
											else
												score2 = rs.getInt("score2");
										}
										sum1 += score1;
										sum2 += score2;
										out.println("<td align=center>" + score1 + " - " + score2 + "</td>");
									} else
										out.println("<td align=center>0 - 0</td>");
								} else if (i > j) {
									tid1 = ttId[i];
									tid2 = ttId[j];
									score1 = 0;
									score2 = 0;
									//rs=DBManager.fetchQuery("select ttId,sum(score) from tourRestore where mid in(select mid from wmatch m where (m.tid1 = "+tid2+" and m.tid2="+tid1+")or(m.tid1="+tid1+" and m.tid2="+tid2+") and tourId="+tourId+" and gender='"+gen+"') group by ttId order by ttId asc;");
									rs = DBManager.fetchQuery("select (select sum(score) from tourRestore where ttId=" + tid1
											+ " and mid in(select mid from wmatch m where (m.tid1 = " + tid2 + " and m.tid2="
											+ tid1 + ")or(m.tid1=" + tid1 + " and m.tid2=" + tid2 + ") and tourId=" + tourId
											+ " and gender='" + gen
											+ "') group by ttId) as score1,(select sum(score) from tourRestore where ttId="
											+ tid2 + " and mid in(select mid from wmatch m where (m.tid1 = " + tid2
											+ " and m.tid2=" + tid1 + ")or(m.tid1=" + tid1 + " and m.tid2=" + tid2
											+ ") and tourId=" + tourId + " and gender='" + gen
											+ "') group by ttId) as score2;");
									if (rs.next()) {
										rs.beforeFirst();
										if (rs.next()) {
											if (rs.getString("score1") == null)
												score1 = 0;
											else
												score1 = rs.getInt("score1");
											if (rs.getString("score2") == null)
												score2 = 0;
											else
												score2 = rs.getInt("score2");
										}
										sum1 += score1;
										sum2 += score2;
										out.println("<td align=center>" + score1 + " - " + score2 + "</td>");

									} else
										out.println("<td align=center>0 - 0</td>");
								} else
									out.println("<td align=center>---</td>");

							}
							out.println("<td align=center>(" + sum1 + "-" + sum2 + ")</td>");
							sum1 = 0;
							sum2 = 0;
							out.println("</tr>");
						}
				%>
			</tbody>
		</table>
		<%
			}
		%>
	</div>
</body>
</html>