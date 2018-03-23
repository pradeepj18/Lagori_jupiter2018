<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.* " import="lg_DBManager.DBManager" pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Team Details</title>
</head>
<body>
<br><br>
	<%
		try
		{
			response.setContentType("text/html");

			DBManager.loadDriver();
			int ttId = Integer.parseInt(request.getParameter("ttId"));
			int tourId=1;
			//System.out.println("++"+ttId);
			ResultSet rs = null;
	
			rs = DBManager.fetchQuery("select tName from team where tId in(select tId from tourTeam where ttId="+ttId+" and tourId="+tourId+")");
			rs.next();
			out.println("<center><h1>"+rs.getString("tName")+"</h1></center><hr>");
			out.println("<center> <table border=1 style=border-collapse:collapse;border:1px solid #FFFFF;color:#000000;width:100% size=2 cellpadding=1  > ");
			rs = null;
			rs = DBManager.fetchQuery("select tpId,jerseyNo,(select fName from member m where m.barcodeId=tp.barcodeId) as fName,(select mName from member m where m.barcodeId=tp.barcodeId) as mName,(select lName from member m where m.barcodeId=tp.barcodeId) as lName from tourPlayer tp,tourTeam tt where tp.tourId="+tourId+" and tp.ttId=tt.ttId and tp.ttId="+ttId+";");
			if(rs.next())
			{

				//out.println("<tr ><th  width=10% align=center  ><h3>Sr. No</h3></th><th  width=40% align=center  ><h3>Player Name</h3></th><th  width=20% align=center  ><h3>Jersy No</h3></th></tr>");
				out.println("<tr ><th  width=10% align=center  ><h3>Sr. No</h3></th><th  width=40% align=center  ><h3>Player Name</h3></th><th  width=20% align=center  ><h3>Jersy No</h3></th></tr>");
				rs.beforeFirst();
			}
			else
			{
				out.println("<th><h3>NO PLAYER</h3></th>");
			}
			
			
			int i=1;
			
			String name=null;
			while(rs.next())
			{
				if(rs.getString("mName").equalsIgnoreCase(null))
				name=rs.getString("fName")+" "+rs.getString("lName");
				else
					name=rs.getString("fName")+" "+rs.getString("mName")+" "+rs.getString("lName");
				out.println("<tr><td><center><font size=5><div class='t'>"+i++ +"</div></center></td>    <td><font size=5><div class='t'>"+name+"</div></td><td><center><font size=5><div class='t'>"+rs.getInt("jerseyNo")+"</div></center></td></tr>");
			
			}
		
			out.println("</table></center>");
			
			out.println("<a href=teamList.jsp>Back</a>");
			
			
		}
		catch(Exception e){}
	
	%>
	
</body>
</html>