<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print match update</title>
</head>
<body>
<%
try
{
	DBManager.loadDriver();
	DBManager DB = new DBManager();
	ResultSet rs = null,rs1 = null;
	rs = DBManager.fetchQuery("select TIME_FORMAT(now(),'%H:%i:%s') as time,DATE_FORMAT(now(),'%X-%m-%d') as mdate;");
	
	int mid = Integer.parseInt(request.getParameter("mid"));
	String tourid = request.getParameter("tourId");
	int court = Integer.parseInt(request.getParameter("court"));
	int twon = Integer.parseInt(request.getParameter("toss"));
	String gender=request.getParameter("gender");
	
	rs1 = DBManager.fetchQuery("select mid,m.tid1,m.tid2,m.mtype from wmatch m where m.tourId="+tourid+" and m.gender='"+gender+"' and m.mid="+mid+" and Flag='0';");
	if(rs1.next())
	{
		int tid1 = rs1.getInt("m.tid1");
		int tid2 = rs1.getInt("m.tid2");
		String mtype = rs1.getString("m.mtype");
	
	
		rs.next();
		int srno = DBManager.getMaxId("print_match", "mid", tourid);
		DB.insert("insert into print_match values("+mid+",'"+rs.getString("mdate")+"','"+rs.getString("time")+"',"+twon+","+court+","+tourid+",'"+gender+"',"+tid1+","+tid2+",'"+mtype+"',"+srno+");");
		try
		{
		DB.insert("update wmatch set Flag='1' where tourId="+tourid+" and gender='"+gender+"' and mid="+mid+";");
		}
		catch(Exception e1)
		{
			System.out.println("Error in PrintMatchupdateServ:  "+e1);
		}
	}
	else
	{
	}
	
}
catch(Exception e)
{
	System.out.println("PrintMatch "+e);
}
%>
</body>
<script type="text/javascript">
window.close();
</script>
</html>