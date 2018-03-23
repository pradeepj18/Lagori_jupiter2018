<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lagori Wicket</title>
</head>
<body>
<%
try
{
	DBManager DB = new DBManager();
	ResultSet rs = null;
	
	String tourId = request.getParameter("tourId");		
	String time= "00:"+request.getParameter("time");			
	String set = request.getParameter("set");			
	int Wjno = Integer.parseInt(request.getParameter("Wjno"));
	int Wcjno = Integer.parseInt(request.getParameter("Wcjno"));
	int mid = Integer.parseInt(request.getParameter("mid"));			
	int wno = DBManager.getMaxId("tourWicket","wno",tourId);
	int turn = Integer.parseInt(request.getParameter("turn"));
	rs = DBManager.fetchQuery("select tid1,tid2 from wmatch where mid="+mid);
	int tid1 = 0;
	int tid2 = 0;
	String barcodeId1 = null;
	String barcodeId2 = null;
	if(rs.next())
	{
		tid1 = rs.getInt("tid1");
		tid2 = rs.getInt("tid2");
	}
	rs = null;
	if(turn == tid1)
	{
	/*	System.out.println("FIRST TEAM");*/
		rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wcjno+" and ttId="+turn+" and tourId="+tourId);
		if(rs.next())
		{
			barcodeId1 = rs.getString("barcodeId");
		}
		rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wjno+" and ttId="+tid2+" and tourId="+tourId);
		if(rs.next())
		{
			barcodeId2 = rs.getString("barcodeId");
		}
	}
	else
	{
		/*System.out.println("SECOND TEAM"+turn);*/
		rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wcjno+" and ttId="+turn+" and tourId="+tourId);
		if(rs.next())
		{
			barcodeId2 = rs.getString("barcodeId");
		}
		rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wjno+" and ttId="+tid1+" and tourId="+tourId);
		if(rs.next())
		{
			barcodeId1 = rs.getString("barcodeId");
		}
	}
	DB.insert("insert into tourWicket values("+wno+",'"+time+"','"+barcodeId1+"','"+barcodeId2+"',"+tourId+","+mid+","+tid1+","+tid2+","+set+","+turn+");");
}
catch(Exception e)
{
	System.out.println("Lagori Wicket"+e);
}
%>
</body>
</html>