<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Player Squad</title>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>View Menu</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">



</head>
<style>
.playerblock {
	overflow: hidden;
	margin-left: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 224px;
	width: 300px;
	border-radius: 15px;
	box-shadow: 2px 2px 15px 3px #888888;
	text-decoration: none;
}

.playerblock1 {
	overflow: hidden;
	margin-left: 20px;
	margin-top: 10px;
	margin-bottom: 10px;
	height: 240px;
	width: 300px;
	border-radius: 15px;
	box-shadow: 2px 2px 15px 3px #888888;
	text-decoration: none;
}

.txtdisp {
	margin-top: 10px;
	font-size: 13pt;
}

.btndisp {
	text-align: left;
	margin-left: -10px;
	border-top-left-radius: 10px;
	border-top-right-radius: 10px;
	border-bottom-left-radius: 10px;
	border-bottom-right-radius: 10px;
	width: 270px;
	color: solid white;
}
</style>
<body>

	<br>

	<%
		try {

			DBManager.loadDriver();
			ResultSet rs = null, rs1 = null;
			String lname = "";
			rs = DBManager.fetchQuery(
					"select m.barcodeId,m.fName,m.mName,m.lName,tp.jerseyNo,SUBSTRING_INDEX(m.photo,'/',-1) as photo,DATE_FORMAT(m.dob,'%Y') as year,DATE_FORMAT(now(),'%Y') as year1,ttId from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+ request.getParameter("ttId") + " and tp.tourId=" + request.getParameter("tourId")+ ";");
			if (rs.next()) {

				rs.beforeFirst();
				rs.next();
				int ttId = rs.getInt("ttId");

				rs1 = DBManager.fetchQuery(
						"select tName,SUBSTRING_INDEX(tFlag,'/',-2) as tflag from team t where tId in(select tId from tourTeam tt where tt.ttId="+ ttId + " and tourId="+ request.getParameter("tourId")+");");
				rs1.next();
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<img class="img-responsive" src="<%=rs1.getString("tflag")%>"
					alt="Player Photo" class="img-circle"
					style="height: 120px; width: 120px; margin-left: 100px; text-decoration: none;">
			</div>
			<div class="col-md-6" style="margin-left: 20px;">
				<center>
					<h2><%=rs1.getString("tName")%></h2>
					<%
						if ((request.getParameter("ttGender")).equals("M")) {
									out.print("<h4> (MALE)</h4>");
								} else {
									out.print(" (FEMALE)");
								}
					%>
				</center>

			</div>
		</div>
	</div>
	<hr>
	<div class="container-fluid">
		<div class="row">
			<%
				System.out.println("++" + request.getParameter("tourId"));
						rs.beforeFirst();
						while (rs.next()) {
							if (rs.getString("lName").equals(""))
								lname = "<br>";
							else
								lname = rs.getString("lName");
			%>

			<div
				class="col-md-4 playerblock p<%=rs.getInt("jerseyNo")%> playerblock1">
				<div class="row">
					<div class="col-md-5">
						<a
							href="viewPlayerDetails.jsp?tourId=<%=request.getParameter("tourId")%>&barcodeId=<%=rs.getString("barcodeId")%>&ttId=<%=ttId%>&ttGender=<%=request.getParameter("ttGender")%>">

							<img class="img-responsive img-circle"
							src="Member/<%=rs.getString("photo")%>" alt="Player Photo"
							style="height: 110px; width: 110px; margin-top: 10px; margin-left: -15px;">
						</a>

					</div>
					<div class="col-md-5"
						style="text-align: center; margin-left: -30px; margin-top: 20px; background-color: white;">
						<span class="txtdisp"><%=rs.getString("fName").toUpperCase() + " "%></span>
						<h3>
							<b><span style="font-size: 22px;"><%=lname.toUpperCase()%></span></b>
						</h3>
						<span>AGE &nbsp; </span><span
							style="font-size: 25px; font-style: solid black"><%=(rs.getInt("year1") - rs.getInt("year")) + 20%></span>
					</div>

				</div>
				<hr style="margin-top: 10px;">
				<div class="col-md-12"
					style="margin-top: -13px; margin-left: -5px; font-size: 10px">
					<span>MATCHES </span><span style="color: blue;">00 </span><span
						style="font-size: 10pt; color: solid black"><b>|</b></span> <span>LAGORI
						MISS </span><span style="color: blue;">00 </span><span
						style="font-size: 10pt; color: solid black"><b>|</b></span> <span>LAGORI
						HIT </span><span style="color: blue;">00 </span>
				</div>
				<div class="col-md-12"
					style="margin-top: 5px; margin-left: -5px; font-size: 10px">
					<a
						href="viewPlayerDetails.jsp?tourId=<%=request.getParameter("tourId")%>&barcodeId=<%=rs.getString("barcodeId")%>&ttId=<%=ttId%>&ttGender=<%=request.getParameter("ttGender")%>"><button
							type="button" class="btn btn-primary btndisp ">
							VIEW PROFILE<span class="glyphicon glyphicon-chevron-right"
								style="margin-left: 130px;"></span>
						</button>&nbsp; </a>
				</div>
			</div>


			<%
				}
			%>
		</div>
	</div>

	<%
		} else {
				out.println("<center><h2>No Player Found</h2></center>");
			}
		} catch (Exception e) {
			System.out.println("in printPlayerSquad  " + e);
		}
	%>

</body>
<!-- <script type="text/javascript">
	$(document).ready(function() {
		$(".p2").hover(function() {
			var div = $(".p2");
			div.animate({
				height : '+=200px',
				width : '+=200px'
			}, "slow");

		}, function() {
			var div = $(".p2");
			div.animate({
				height : '-=200px',
				width : '-=200px'
			}, 1000);

		});
	});
</script> -->
</html>