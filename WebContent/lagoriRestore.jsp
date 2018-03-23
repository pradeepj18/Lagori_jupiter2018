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
	DBManager DB = new DBManager();
	ResultSet rs=null;
	String tourId = request.getParameter("tourId");		
	int score  = Integer.parseInt(request.getParameter("score"));	
	String time= "00:"+request.getParameter("time");			
	String set = request.getParameter("set");			
	int Hjno = Integer.parseInt(request.getParameter("Hjno"));			
	int mid = Integer.parseInt(request.getParameter("mid"));			
	int ttId = Integer.parseInt(request.getParameter("tid"));
	int rno = DBManager.getMaxId("tourRestore", "rno",tourId);
	
	rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Hjno+" and tourId="+tourId+" and ttId="+ttId+";");
	if(rs.next())
	{
		/*System.out.println("insert into lagoriRestore values("+rno+",'"+time+"','"+rs.getString("barcodeId")+"',"+tourId+","+mid+","+ttId+","+score+",'"+set+"');");*/
		DB.insert("insert into tourRestore values("+rno+",'"+time+"','"+rs.getString("barcodeId")+"',"+tourId+","+mid+","+ttId+","+score+",'"+set+"');");
	}
	else
	{
		
		out.println("<script type='text/javascript'>alert('Check Jersry No');</script>");
	}
	
}
catch(Exception e)
{
	System.out.println("LagroiRestore Servlet"+e);
}
%>
</body>
</html>