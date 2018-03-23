<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">


</head>
<style>


</style>
<body>
		
		<br>		
				
				<%
					try
				{
					DBManager.loadDriver();
					ResultSet rs=null;
					String mname="";
					rs=DBManager.fetchQuery("select m.fName,m.mName,m.lName,tp.jerseyNo,SUBSTRING_INDEX(m.photo,'/',-2) as photo from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.ttId="+request.getParameter("ttId")+" and tp.tourId="+request.getParameter("tourId")+";");
					if(rs.next())
					{
						%>
						<center><h2><% out.print(request.getParameter("tName"));%></h2><% if((request.getParameter("ttGender")).equals("M")){out.print("<h4> (MALE)</h4>");}else{out.print(" (FEMALE)");} %>	</center>
						<br><center><table class="table table-striped table-responsive">
					<thead>
					<tr>
				
					<th >First Name</th>
						<th >Middle Name</th>
						<th >Last Name</th>
						<th >Jersey No.</th>
					</tr>
				</thead>
				<tbody>
						<% 
						rs.beforeFirst();
					while(rs.next())
					{
						if(rs.getString("mName").equals("") || rs.getString("lName").equals(""))
						{%>
						
					<tr>
				<%-- 	<td><img src="<%=rs.getString("photo") %>" alt="Player Photo" style="height: 100px; width: 100px;"></td> --%>
					<td><%=rs.getString("fName") %></td>
						<td >-</td>
						<td><%=rs.getString("lName") %></td>
						<td><%=rs.getInt("jerseyNo") %></td>
					</tr>
				<% }
					
					else
					{%>
						<tr>
					<%-- 	<td><img src="<%=rs.getString("photo") %>" alt="Player Photo" style="height: 100px; width: 100px;"></td> --%>
						<td><%=rs.getString("fName") %></td>
						<td><%=rs.getString("mName") %></td>
						<td><%=rs.getString("lName") %></td>
						<td><%=rs.getInt("jerseyNo") %></td>
					</tr>	
					<%
					}
					}
				}
					else
					{
						out.println("<center><h2>No Player Found</h2></center>");
					}
				}
				catch(Exception e)
				{
					System.out.println("in printPlayer  "+e);
				}%>
				</tbody>
				</table>
				</center>
	<br><br>
</body>
</html>