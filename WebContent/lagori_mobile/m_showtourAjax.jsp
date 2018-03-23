<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Tournament Ajax</title>
</head>
<style>

</style>
<body>
		<div class="row">
			<%
				try {
					String logo = "";
					int year = Integer.parseInt(request.getParameter("tyear"));
					//System.out.println(year);
					DBManager.loadDriver();
					ResultSet rs = null;
					rs = DBManager.fetchQuery(
							"select tourId,tourName,SUBSTRING_INDEX(tourLogo,'/',-3) as logo,UCASE(DATE_FORMAT(tourSDate,'%Y')) as year from tournament where tourStatus='0';");
					if (rs.next())

					{
						rs.beforeFirst();
						while (rs.next()) {
							if (rs.getInt("year") == year) {
								if (rs.getString("logo") == null)
									logo = "images/default_tour_logo.png";
								else
									logo = rs.getString("logo");
								//System.out.println(logo);
			%>

			<a href="m_tournamentsnext.jsp?tourId=<%=rs.getInt("tourId")%>">
				<div class="col-md-4 col-xs-12 col-sm-12 cardheader"
					id="cardh<%=rs.getInt("tourId")%>">
					<div class="row">
						<img src="../<%=logo%>" alt="Tournament Logo"
							height="100">
					</div>
					<div class="row ">
						<hr style="border: 1px solid red;">

						<span style="color: white;"><%=rs.getString("tourName")%></span>
					</div>
				</div>
			</a>
			<%
				}
						}
					} else {
			%>
			<%
				}
				} catch (Exception e) {
				}
			%>
		</div>
</body>
</html>