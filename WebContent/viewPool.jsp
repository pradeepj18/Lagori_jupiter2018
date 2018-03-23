	<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<title>View Pools</title>
</head>

<body>
<div class="container">
<div class="row" style="margin-left:70px;"> 

<div class="col-md-8">
<table class="table table-striped table-responsive">
<%

	int tourId=Integer.parseInt(request.getParameter("tourId"));
	try
	{
			DBManager.loadDriver();
			int poolCount = 0;
			int teamCount=0;
			ResultSet rs= null,rs1=null;
			rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='M' group by pname;");
			if(!rs.next())
				out.println("<br><br><center>No Boys Pool Found</center>");
			rs.beforeFirst();
			boolean f=true;
			int max=0;
			while(rs.next())
			{
				if(f)
				{
					out.println("<h3><b>POOL (MALE)</b></h3>");
					f=false;
				}
				if(rs.getInt("count(*)")>max)
					max=rs.getInt("count(*)");
				teamCount+=rs.getInt("count(*)");
				poolCount++;
			}
			
			ResultSet[] rss=new ResultSet[poolCount];
		
			%>


    <%
			int ii=0;
    		out.println("<thead><tr>");
			for(ii=0;ii<poolCount;ii++)
			{
				out.print("<th> <font size='4'><b> POOL &#" +(ii+65)+ " </b> </font></th>");

				rss[ii]=DBManager.fetchQuery("select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="+tourId+" and tpgender='M')) as tName from tourPool tp where  tourId="+tourId+" and tpgender='M' and pname="+(ii+1)+";");
			}
			out.println("</tr></thead>");
			out.println("<tbody>");
			int k=1;
			for(int i=0;i<max;i++)
			{
				out.println("<tr>");
				for(int j=0;j<poolCount;j++)
				{
					if(rss[j].next())
					{ 	
						out.print("<td>"+rss[j].getString("tName")+"</td>");						
					}
					else
						out.println("<td></td>");
				}
				out.println("</tr>");
			}
			out.println("</tbody>");
	}
	catch(Exception e){}
	finally{DBManager.close();}
			%>
  </table>
  </div>
  
</div>
</div>

<div class="container">
<div class="row" style="margin-left:70px;"> 

<div class="col-md-8">
<table class="table table-striped table-responsive">
<%
	tourId=Integer.parseInt(request.getParameter("tourId"));
	try
	{
			DBManager.loadDriver();
			int poolCount = 0;
			int teamCount=0;
			ResultSet rs= null,rs1=null;
			rs = DBManager.fetchQuery("select count(*),pname from tourPool where tourId="+tourId+" and tpgender='F' group by pname;");
			if(!rs.next())
				out.println("<br><br><center>No Girls Pool Found</center>");
			rs.beforeFirst();
			boolean f=true;
			int max=0;
			while(rs.next())
			{
				if(f)
				{
					out.println("<h3><b>POOL (FEMALE)</b></h3>");
					f=false;
				}
				if(rs.getInt("count(*)")>max)
					max=rs.getInt("count(*)");
				teamCount+=rs.getInt("count(*)");
				poolCount++;
			}
			
			ResultSet[] rss=new ResultSet[poolCount];
		
			%>


    <%
			int ii=0;
    		out.println("<thead><tr>");
			for(ii=0;ii<poolCount;ii++)
			{
				out.print("<th> <font size='4'><b> POOL &#" +(ii+65)+ " </b> </font></th>");

				rss[ii]=DBManager.fetchQuery("select *,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="+tourId+" and tpgender='F')) as tName from tourPool tp where  tourId="+tourId+" and tpgender='F' and pname="+(ii+1)+";");
			}
			out.println("</tr></thead>");
			out.println("<tbody>");
			int k=1;
			for(int i=0;i<max;i++)
			{
				out.println("<tr>");
				for(int j=0;j<poolCount;j++)
				{
					if(rss[j].next())
					{ 	
						out.print("<td>"+rss[j].getString("tName")+"</td>");						
					}
					else
						out.println("<td></td>");
				}
				out.println("</tr>");
			}
			out.println("</tbody>");
	}
	catch(Exception e){}
	finally{DBManager.close();}
			%>
  </table>
  </div>
  
</div>
</div>

</body>
</html>