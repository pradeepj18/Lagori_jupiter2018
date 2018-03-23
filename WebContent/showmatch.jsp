<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
#select-team{
  width:87%;
  height:100%;
  margin-left:-2.5%;
  font-family: 'lucida grande',tahoma,verdana,arial,sans-serif;
    font-size: 16px;
    font-weight: 300;
    color: #333333;
}

.ajax-teamhead
{
	font-family: 'Open Sans', sans-serif;
	background:  #0E1957;
	color: #ffffff;
    border-left: 1px solid #e4e4e2;
    border-right: 1px solid #e4e4e2;
    border-top: 1px solid #e4e4e2;
    border-top-left-radius: 5px;
    border-top-right-radius: 5px;
    display: block;
    font-size: 16px;
    font-weight: 700;
    padding: 8px 0;
    text-align: center;
    margin-left:-3%;
    margin-top: 0;
    width:87.9%;
}
</style>

</head>
<body>
<% 
	try
	{
		
			ResultSet rs = null;
			String tourId=request.getParameter("tourId");
			String gen=request.getParameter("ttGender");
%>
			<div class="ajax-teamhead">Select Match</div>
			<select  name="select-team" size=12 id="select-team" onchange="showHMR();">
			<%
		
			rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2,(select pool from wmatch w where w.mid=pm.mid and w.gender=pm.gender  and w.tourId=pm.tourId) as pool,UCASE(pm.mtype) as mtype from print_match pm where tourId="+request.getParameter("tourId")+" and pm.gender='"+request.getParameter("ttGender")+"';");
			if(rs.next()){
			%>	<option value="<%=rs.getInt("mid") %>" selected="selected" style="padding:9px;"><%=rs.getInt("mid")%> &nbsp;&nbsp;&nbsp;<%=rs.getString("tName1")%>&nbsp;&nbsp; Vs&nbsp;&nbsp; <%=rs.getString("tName2") %>&nbsp;&nbsp;&nbsp;  <%=rs.getString("mtype") %> &nbsp;&nbsp;&nbsp;&#<%=rs.getInt("pool")+64 %></option>
			<%}
			while(rs.next())
				{
				
			%>
				<option value="<%=rs.getInt("mid") %>" style="background:#E9F4FF;padding:9px;" ><%=rs.getInt("mid")%>&nbsp;&nbsp;&nbsp;<%=rs.getString("tName1")%> &nbsp;&nbsp;Vs&nbsp;&nbsp; <%=rs.getString("tName2") %>&nbsp;&nbsp;&nbsp;  <%=rs.getString("mtype") %> &nbsp;&nbsp;&nbsp;&#<%=rs.getInt("pool")+64 %></option>
				<% if(rs.next()){ %>
				<option value="<%=rs.getInt("mid") %>" style="padding:9px;"><%=rs.getInt("mid")%>&nbsp;&nbsp;&nbsp;  <%=rs.getString("tName1")%> &nbsp;&nbsp;Vs&nbsp;&nbsp; <%=rs.getString("tName2") %> &nbsp;&nbsp;&nbsp; <%=rs.getString("mtype") %> &nbsp;&nbsp;&nbsp;&#<%=rs.getInt("pool")+64 %></option>
			<%     }
			   } %>
				</select>
				

<%
	}
	catch(Exception e)
	{
		System.out.println("showmatch.jsp "+e);
	}
%>
</body>
</html>