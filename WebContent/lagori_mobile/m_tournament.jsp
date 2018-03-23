<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Show Tournaments</title>
<meta name="viewport"
	content="width=device-width, initial-scale=1,user-scalable=no">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../css/customcss.css">
<style type="text/css">
body {
	overflow-x: hidden;
	overflow-y: scroll;
	background-color:#001e35;
}
</style>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-sm-2"></div>
			<div class="col-md-4 col-xs-12 col-sm-8">

				<select id="tyear" class="form-control" onchange="showtour();">
					<option value="SelectYear">Select Tournament Year</option>
					<%
						try {
							ResultSet rs = null;
							DBManager.loadDriver();
							rs = DBManager.fetchQuery(
									"select distinct ucase(DATE_FORMAT(tourSDate,'%Y')) as date1 from tournament group by date1; ");
							if(rs.next())
							{
								
							rs.beforeFirst();
							while (rs.next()) {
					%>
					<option value="<%=rs.getInt("date1")%>"><%=rs.getInt("date1")%></option>
					<%
						}
							}
							else
							{
								%>
								<option value="-1">NO TOURNAMENT FOUND</option>
								<% 
							}
						} catch (Exception e) {
						}
					%>
				</select>
			</div>
			<div class="col-md-4 col-sm-2"></div>
		</div>
		<br>
		<span id="st"></span>


	</div>
</body>
<script type="text/javascript">
	function showtour() {

		var xmlhttp = false;
		var tyear = document.getElementById("tyear").value;
		if (window.XMLHttpRequest) {
			xmlhttp = new XMLHttpRequest();
		}

		if (xmlhttp) {
			xmlhttp.onreadystatechange = function() {
				if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
					document.getElementById("st").innerHTML = xmlhttp.responseText;
				}
			};
		}

		xmlhttp.open("GET", "m_showtourAjax.jsp?tyear=" + tyear, true);
		xmlhttp.send(null);
	}
</script>
</html>