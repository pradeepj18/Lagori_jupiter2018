<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Search Player</title>
</head>

<body>
<form>
Enter Player Id or Name : 
<input type="text" name="pid">
<input type="submit" name="submit" value="Search">
</form>
<%
try
{
if(request.getParameter("submit").equalsIgnoreCase("Search"))
{
	DBManager.loadDriver();
String pid=request.getParameter("pid");
ResultSet rs=null;
rs=DBManager.fetchQuery("select * from member where barcodeId like '%"+pid+"%'");
while(rs.next())
{
out.println(rs.getString("fName"));	
}

}
}
catch(Exception e){}
%>
</body>
</html>