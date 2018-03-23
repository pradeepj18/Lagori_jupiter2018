<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
try
{
	DBManager.loadDriver();
	DBManager DB = new DBManager();
	String mid = request.getParameter("mid");
	String mref = "0";//request.getParameter("mref");
	String tourId = request.getParameter("tourId");
	String tmr1 = request.getParameter("tmr1");
	String tmr2 = request.getParameter("tmr2");
	String tmo1 = request.getParameter("tmo1");
	String tmo2 = request.getParameter("tmo2");
	String tourRefree = request.getParameter("tourRefree");
	int tmro = DBManager.getMaxId("tourmatchrefoff", "tmro", tourId);
	//System.out.println("insert into tourmatchrefoff values("+tmro+","+mid+",'"+gen+"',"+tourId+","+tmr1+","+tmr2+","+tmo1+","+tmo2+","+tourRefree+");");
	DB.insert("insert into tourMatchOfficial values("+mid+","+tmr1+","+tmr2+","+tmo1+","+tmo2+","+mref+","+tourRefree+","+tourId+");");
}
catch(Exception e){
	System.out.println("addtourMatchRefree.jva "+e);
}


%>
</body>
</html>