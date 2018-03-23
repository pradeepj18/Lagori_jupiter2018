<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" href="css/customcss.css">
</head>
<style>
body {
	overflow-x: hidden;
	overflow-y:scroll;
}
</style>
<body>
	<div class="container">
		<div class="row">
			<%
				try {
					String logo = "";
					int year = Integer.parseInt(request.getParameter("tyear"));
					//System.out.println(year);
					DBManager.loadDriver();
					ResultSet rs = null;
					rs = DBManager.fetchQuery(
							"select tourId,tourName,SUBSTRING_INDEX(tourLogo,'/',-1) as logo,UCASE(DATE_FORMAT(tourSDate,'%Y')) as year from tournament where tourStatus='0';");
					//System.out.println("select tourId,tourName,SUBSTRING_INDEX(tourLogo,'/',-2) as logo from tournament where tourSDate>='"+year+"-01-01' and tourEDate<='"+year+"-12-31'");
					while (rs.next()) {
						if (rs.getInt("year") == year) {
							if(rs.getString("logo")==null)
								logo="favicon.png";
							else
								logo=rs.getString("logo");
			%>

			<a href="tournamentnext.jsp?tourId=<%=rs.getInt("tourId")%>"> 
					<div class="col-md-4 cardheader " id="cardh<%=rs.getInt("tourId")%>" style="max-width:32%;">
				
			<div class="row">
				
			<img src="images/tournament-logo/<%=logo%>" alt="Tournament Logo" height="100">
				</div>
				<div class="row ">
					<hr style="border: 1px solid red;">
				
					<span style="color:white;"><%=rs.getString("tourName")%></span>
</div>
			</div>
					</a>
						<%
				}
					}
				} catch (Exception e) {
				}
			%>
		</div>
		
	</div>

	<%-- 	<a href="tournamentnext.jsp?tourId=<%=tourId%>">
					<img src="images/tournament/mahaLagori.png" width="250" height="250" style="margin-top:10%;">
				</a>
	 --%>

	<!--Card Light-->





</body>
<script type="text/javascript">
$(document).ready(function(){
    $("#btn1").mouseenter(function(){
        alert("You entered p1!");
    });
});
</script>
</html>