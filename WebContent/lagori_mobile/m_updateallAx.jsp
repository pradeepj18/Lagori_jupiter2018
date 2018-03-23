<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*,java.lang.Object.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.btn
{
border-radius: 0px;
}
.btn-primary
{
background-color:#45ABCD;
}
.input-cs
{
height: 35px;
padding: 0px 5px;
}
</style>
</head>

<body>

<%
	try
	{
		DBManager.loadDriver();
		ResultSet rs=null;
		String tourId= request.getParameter("tourId");
		String ttGender=request.getParameter("ttGender");
		String ttId=request.getParameter("ttId");
		String category=request.getParameter("memcategory");
		
String mname="",lname="";
		
		if(category.equals("1"))
		{
			
	
		
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select jerseyNo,tp.barcodeId,fName,mName,lName from tourPlayer tp,member m where tp.barcodeId=m.barcodeId and tp.tourId="+tourId+" and tp.ttId="+ttId+";");
				if(rs.next())
				{
					%>
					<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>PLAYER LIST</b></h3>
					</div>
					</div>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     FIRST NAME
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     MIDDLE NAME
					     </div>					    
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     LAST NAME
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-2">
					     JNO
					     </div>
					   </div>
					   
					<%
					
					rs.beforeFirst();
					while(rs.next())
					{
						if(rs.getString("mName")==null)
							mname="";
						else
							mname=rs.getString("mName");
						if(rs.getString("lName")==null)
							lname="";
						else
							lname=rs.getString("lName");
						%>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName").toUpperCase() %>" id='fName<%=rs.getString("barcodeId") %>'>
					     </div>
					      <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=mname.toUpperCase() %>" id='mName<%=rs.getString("barcodeId") %>'>
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=lname.toUpperCase() %>" id='lName<%=rs.getString("barcodeId") %>'>
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4	">
					    <input class="form-control input-cs" style="width: 100%;" type="number" name='jerseyNo<%=rs.getString("barcodeId") %>' min="1" max="1000" pattern="[0-9]+" value="<%=rs.getInt("jerseyNo") %>" id='jerseyNo<%=rs.getString("barcodeId") %>'>
					     </div>
					     </div>
					     <div class="row"style="margin-top: 5px;">
					     
					      <div class="col-md-2 col-xs-4 col-sm-4">
								<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">			   
					     </div>
					     <div class="col-md-2 col-xs-4 col-sm-4">
					   			<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">
					   </div>
					   </div>
					
						<br>
						<%
					}
				}
				else
				{
			%>
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>PLAYER NOT FOUND</b></h3>
					</div>
					</div>
			<%
				}
			}
		}
		else if(category.equals("2"))
		{
			
		
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery(" select tc.tcId,m.fName,m.mName,m.lName,tc.barcodeId from member m,tourCoach tc where m.barcodeId=tc.barcodeId and tc.tourId="+tourId+" and tc.ttId="+request.getParameter("ttId")+";");
				if(rs.next())
				{%>
				 <div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>COACH LIST</b></h3>
					</div>
					</div>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     FIRST NAME
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     MIDDLE NAME
					     </div>					    
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     LAST NAME
					     </div>
					     
					   </div>
		<%
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName").toUpperCase() %>" id='fName<%=rs.getString("barcodeId") %>'>
					     </div>
					      <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName").toUpperCase() %>" id='mName<%=rs.getString("barcodeId") %>'>
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName").toUpperCase() %>" id='lName<%=rs.getString("barcodeId") %>'>
					     </div>
					    
					     </div>
					     <div class="row"style="margin-top: 5px;">
					     
					      <div class="col-md-2 col-xs-4 col-sm-4">
								<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">			   
					     </div>
					     <div class="col-md-2 col-xs-4 col-sm-4">
					   			<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">
					   </div>
					   </div>
					
						<br>
						<%
					}
				}
			else
			{
		%>
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>COACH NOT FOUND</b></h3>
					</div>
					</div>
		<%
			}
		}
		}
		else if(category.equals("3"))
		{
			
	
			if(ttId.matches("[0-9]+") && tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select tm.tmId,m.fName,m.mName,m.lName,tm.barcodeId from member m,tourManager tm where m.barcodeId=tm.barcodeId and tm.tourId="+tourId+" and tm.ttId="+ttId+";");
				if(rs.next())
				{
					%>
					 <div class="row">
							<div class="col-md-12 col-xs-12 col-sm-12 center">
							<h3><b>MANAGER LIST</b></h3>
							</div>
							</div>
								 <div class="row">
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     FIRST NAME
							     </div>
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     MIDDLE NAME
							     </div>					    
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     LAST NAME
							     </div>
							     
							   </div>
				<%
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName").toUpperCase() %>" id='fName<%=rs.getString("barcodeId") %>'>
					     </div>
					      <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName").toUpperCase() %>" id='mName<%=rs.getString("barcodeId") %>'>
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName").toUpperCase() %>" id='lName<%=rs.getString("barcodeId") %>'>
					     </div>
					    
					     </div>
					     <div class="row"style="margin-top: 5px;">
					     
					      <div class="col-md-2 col-xs-4 col-sm-4">
								<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">			   
					     </div>
					     <div class="col-md-2 col-xs-4 col-sm-4">
					   			<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">
					   </div>
					   </div>
					
						<br>
						<%
					}
				}
			else
			{
		%>
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>MANAGER NOT FOUND</b></h3>
					</div>
					</div>
		<%
			}
		}
		}
		else if(category.equals("4"))
		{
			
	
			if(tourId.matches("[0-9]+"))
			{	
				rs=null;
				rs=DBManager.fetchQuery("select t.toId,m.fName,m.mName,m.lName,t.barcodeId from member m,tourOfficial t where m.barcodeId=t.barcodeId and t.tourId="+tourId+";");
				if(rs.next())
				{
					%>
					 <div class="row">
							<div class="col-md-12 col-xs-12 col-sm-12 center">
							<h3><b>OFFICIAL LIST</b></h3>
							</div>
							</div>
								 <div class="row">
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     FIRST NAME
							     </div>
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     MIDDLE NAME
							     </div>					    
							     <div class="col-md-3 col-xs-4 col-sm-4">
							     LAST NAME
							     </div>
							     
							   </div>
				<%
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						 <div class="row">
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='fName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("fName").toUpperCase() %>" id='fName<%=rs.getString("barcodeId") %>'>
					     </div>
					      <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='mName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("mName").toUpperCase() %>" id='mName<%=rs.getString("barcodeId") %>'>
					     </div>
					     <div class="col-md-3 col-xs-4 col-sm-4">
					     <input class="form-control input-cs" type="text" name='lName<%=rs.getString("barcodeId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("lName").toUpperCase() %>" id='lName<%=rs.getString("barcodeId") %>'>
					     </div>
					    
					     </div>
					     <div class="row"style="margin-top: 5px;">
					     
					      <div class="col-md-2 col-xs-4 col-sm-4">
								<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">			   
					     </div>
					     <div class="col-md-2 col-xs-4 col-sm-4">
					   			<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("barcodeId")%>',<%=category%>,'<%=ttGender%>')">
					   </div>
					   </div>
					
						<br>
						<%
					}
				}
			else
			{
		%>
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>OFFICIAL NOT FOUND</b></h3>
					</div>
					</div>
		<%
			}
		}
		}
		else if(category.equals("5"))
		{
			
		if(tourId.matches("[0-9]+"))
			{	
		
				rs=null;
				rs=DBManager.fetchQuery("select tt.ttId,t.tName from team t,tourTeam tt where t.tId=tt.tId and tt.tourId="+tourId+" and tt.ttGender='"+ttGender+"';");
				if(rs.next())
				{
					%>
					 <div class="row">
							<div class="col-md-12 col-xs-12 col-sm-12 center">
							<h3><b>TEAM LIST</b></h3>
							</div>
							</div>
								 <div class="row">
							     <div class="col-md-4 col-xs-6 col-sm-6">
							     TEAM NAME
							     </div>
							    
							   </div>
				<%
					
					rs.beforeFirst();
					while(rs.next())
					{
						%>
						<div class="row">
					     <div class="col-md-4 col-xs-6 col-sm-6">
					    <input class="form-control input-cs" type="text" name='tName<%=rs.getString("ttId") %>' pattern="[a-z A-Z]+" value="<%=rs.getString("tName") %>" id='tName<%=rs.getString("ttId") %>'>
						
					     </div>
					      <div class="col-md-2 col-xs-3 col-sm-3">
								<input type="button" class="btn btn-primary" value="UPDATE" onclick="updateConfirm('<%=rs.getString("ttId")%>',<%=category%>,'<%=ttGender%>')">			   
					     </div>
					     <div class="col-md-2 col-xs-3 col-sm-3">
					   			<input type="button" class="btn btn-danger" value="DELETE" onclick="deleteConfirm('<%=rs.getString("ttId")%>',<%=category%>,'<%=ttGender%>')">
					   </div>
					   </div>
					
						<br>
						<%
					}
				}
			else
			{
		%>
				<div class="row">
					<div class="col-md-12 col-xs-12 col-sm-12 center">
					<h3><b>TEAMS NOT FOUND</b></h3>
					</div>
					</div>
		<%
			}
		}
		}
			
	
	
}
catch(Exception e) 
{
	System.out.println("showplayer.jsp  "+e);
}
%>
<!-- </div> -->
</body>
</html>