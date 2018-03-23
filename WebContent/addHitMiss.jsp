<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>HIT MISS</title>
</head>
<body>
<%
try
{
	DBManager DB = new DBManager();
	String flag = request.getParameter("flag");
	String mid = request.getParameter("mid");
	String tourId = request.getParameter("tourId");
	String time = request.getParameter("time");
	String tid = request.getParameter("tid");
	
	//HIT
	if(flag.equals("1"))
	{
		int hno = DBManager.getMaxId("tourHit", "hno");
	 	DB.insert("insert into tourHit values("+hno+",'"+request.getParameter("time")+"','"+request.getParameter("id")+"',"+request.getParameter("tourId")+","+request.getParameter("mid")+","+request.getParameter("tid")+","+request.getParameter("set")+");");
	}
	
	//MISS
	else if(flag.equals("2"))
	{
		int mno = DBManager.getMaxId("tourMiss", "mno");
	 	DB.insert("insert into tourMiss values("+mno+",'"+request.getParameter("time")+"','"+request.getParameter("id")+"',"+request.getParameter("tourId")+","+request.getParameter("mid")+","+request.getParameter("tid")+","+request.getParameter("set")+");");
	}
	
}
catch(Exception e)
{
	System.out.println("ADD MISS "+e);
}
%>
</body>
</html>