<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print Player</title>
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
	.print1 {
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
				rs1 = DBManager.fetchQuery(
						"select ttId,(select tName from team where tId = tt.tId) as tname from tourTeam tt where tourId="
								+ request.getParameter("tourId") + " and ttGender ='" + request.getParameter("gen")
								+ "' order by tname asc;");
				if (rs1.next()) {
		%><br>
		<div class="row">
			<div class="col-md-4 col-sm-4"></div>
			<div class="col-md-4 col-xs-12 col-sm-4">
				<select class="form-control print1" id="ttId"
					onchange="get_ttId(<%=tourId%>,'<%=gen%>')">
					<option value="-1">Select Team Here</option>
					<%
						rs1.beforeFirst();
								while (rs1.next()) {
					%>
					<option value="<%=rs1.getInt("ttId")%>"><%=rs1.getString("tname")%></option>
					<%
						}
					%>
				</select>
			</div>
			<div class="col-md-4 col-sm-4"></div>
		</div>

		<span class="top" id="player"></span>
		<%
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
	<script type="text/javascript">
function get_ttId(tourId,gen)
{
	
	var ttId=document.getElementById("ttId").value;
	
	$("#player").load("m_printPlayerAx.jsp?tourId="+tourId+"&gen="+gen+"&ttId="+ttId+"");	
}
</script>
</html>