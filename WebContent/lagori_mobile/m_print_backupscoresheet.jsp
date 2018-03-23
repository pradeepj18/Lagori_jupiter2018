<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print ScoreSheet</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container">
		<%
			try {
				DBManager.loadDriver();
				ResultSet rs = null;
				int tourId = Integer.parseInt(request.getParameter("tourId"));
				rs = DBManager.fetchQuery(
						"select mid,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="
								+ request.getParameter("tourId")
								+ ") as tname1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="
								+ request.getParameter("tourId")
								+ ") as tname2,gender,ucase(mtype) as type from wmatch pm where Flag='2' and tourId="
								+ request.getParameter("tourId"));
				if (rs.next()) {
		%><br>
		<div class="row">
			<div class="col-md-4 col-sm-2"></div>
			<div class="col-md-4 col-xs-12 col-sm-8">
				<select id="matchselect" class="form-control" required
					onchange="get_scoresheet(<%=tourId%>)">
					<option value="-1">SELECT MATCH</option>
					<%
					rs.beforeFirst();
						while (rs.next()) {
					%>
					<option value="<%=rs.getInt("mid")%>&<%=rs.getString("gender")%>">
					
					<%=rs.getInt("mid")%>&nbsp;&nbsp;<%=rs.getString("tname1")%>&nbsp;VS&nbsp;<%=rs.getString("tname2")%>&nbsp;&nbsp;[ <%=rs.getString("type")%>
						&nbsp;-&nbsp;<%=rs.getString("gender")%> ]
					</option>
					<%
						}
					%>
				</select>
			</div>
			<div class="col-md-4 col-sm-2"></div>
		</div><hr>
		<div class="row">
			<div class="col-md-12 col-xs-12 col-sm-12">
			<div id="showscoresheet"></div>
			</div>
			
		</div>


		<%
			}
			} catch (Exception e) {
				System.out.println("printscoresheet : " + e);
			}
		%>
	</div>
	<script type="text/javascript">
		function get_scoresheet(tourId) {
			var midgen = document.getElementById("matchselect").value;

			var variable = midgen.split("&");
			var mid = variable[0];
			var gen = variable[1];
			var xmlhttp = false;
			if (window.XMLHttpRequest) {
				xmlhttp = new XMLHttpRequest();
			}
			if (xmlhttp) {
				xmlhttp.onreadystatechange = function() {
					if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
						document.getElementById("showscoresheet").innerHTML = xmlhttp.responseText;
					}
				};
			}

			xmlhttp.open("GET","m_lagoriScoreSheet.jsp?mid="+mid+"&tourId="+tourId+"&gen="+gen,true);
			xmlhttp.send(null);

		}
	</script>
	<script type="text/javascript">
function getprint(tourId,mid,gen)
{

window.open("m_lagoriScoreSheet.jsp?mid="+mid+"&tourId="+tourId+"&gen="+gen,"ScoreSheet");


}
</script>
</body>
</html>