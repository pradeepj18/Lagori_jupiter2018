<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lagori</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
</head>
<style>
#tournamentCarousel {
	width: 108%;
	background-image: url("images/slider/ground.png");
	background-color: #16224d;
	background-size: cover;
	float: left;
	height: 170px;
	color: #fff;
	position: relative;
	overflow: hidden;
}
</style>

<body>
<%
	try
	{
		ResultSet rs = null; 
		String tourId = request.getParameter("tourId");
%>
 <div class="row">
   
  
   <!-- TABLE -->

    <div class="col-md-12" style="margin-left: 45px;width:29%;">
   <%
     rs = null;
     
   	 ResultSet rs1= null;
     rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W %d %b.%y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from print_match pm where mtype!='league' and tourId="+tourId+" order by srno desc limit 6");
     if(rs.next())
     {
     	rs.beforeFirst();
    	 while(rs.next())
     {	
    	 
         rs1 = null;
    	 rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tt1 where tourId="+tourId+" and tt1.ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as sum1,(select sum(score) from tourRestore tt2 where tourId="+tourId+" and tt2.ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as sum2 from print_match pm where mid="+rs.getInt("mid")+" and tid1="+rs.getInt("tid1")+" and tid2="+rs.getInt("tid2")+" and tourId="+tourId+";");
    	 
    	 if(rs1.next()){
   %>
   		
     <div class="row">
	   <div class="col-xs-12 result-head">
	     <span class="result-date" ><%=rs.getString("mdate") %>&nbsp;</span><span style="color:#000;"></span>
	     <span class="result-place" style="float:right;"><%=rs.getString("mtype")%></span>
	   </div>
	 </div>
	 <div class="row">
	   <div class="col-xs-5 result-teams">
	     <span class="result-team1" style="white-space:nowrap;float:left;"><%=rs.getString("tname1")%></span>
	    </div>
	    <div class="col-xs-2 result-teams">
	     <span class="score" style="float: left;margin-left: 0px;"><%=rs1.getInt("sum1") %>&nbsp;-&nbsp;<%=rs1.getInt("sum2") %>&nbsp;<span>[<%=rs.getString("gender") %>]</span> </span>
	    </div>
	    <div class="col-xs-5 result-teams">
	     <span class="result-team2" style="float:right;white-space:nowrap;"><%=rs.getString("tname2") %></span>
	    </div>
	 </div>
	<%
	    }
    }
     }
     else
     {
    	 rs = null;
         
       		rs1= null;
         rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W %d %b.%y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from print_match pm where tourId="+tourId+" order by srno desc limit 6");
         if(rs.next())
         {
         	rs.beforeFirst();
        	 while(rs.next())
         {	
        	 
             rs1 = null;
        	 rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tt1 where tourId="+tourId+" and tt1.ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as sum1,(select sum(score) from tourRestore tt2 where tourId="+tourId+" and tt2.ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as sum2 from print_match pm where mid="+rs.getInt("mid")+" and tid1="+rs.getInt("tid1")+" and tid2="+rs.getInt("tid2")+" and tourId="+tourId+";");
        	 
        	 if(rs1.next()){
        		  %>
        	   		
        		     <div class="row">
        			   <div class="col-xs-12 result-head">
        			     <span class="result-date" ><%=rs.getString("mdate") %>&nbsp;</span><span style="color:#000;"></span>
        			     <span class="result-place" style="float:right;"><%=rs.getString("mtype")%></span>
        			   </div>
        			 </div>
        			 <div class="row">
        			   <div class="col-xs-5 result-teams">
        			     <span class="result-team1" style="white-space:nowrap;float:left;"><%=rs.getString("tname1")%></span>
        			    </div>
        			    <div class="col-xs-2 result-teams">
        			     <span class="score" style="float: left;margin-left: 0px;"><%=rs1.getInt("sum1") %>&nbsp;-&nbsp;<%=rs1.getInt("sum2") %>&nbsp;<span>[<%=rs.getString("gender") %>]</span> </span>
        			    </div>
        			    <div class="col-xs-5 result-teams">
        			     <span class="result-team2" style="float:right;white-space:nowrap;"><%=rs.getString("tname2") %></span>
        			    </div>
        			 </div>
        			<%
        			    }
        	 }
     }
         else
         {
        	 %>
 	   		
		     <div class="row">
			   <div class="col-xs-12 result-head">
			     <span class="result-date" >&nbsp;</span><span style="color:#000;"></span>
			    
			   </div>
			 </div>
			 <div class="row">
			   <div class="col-xs-12 result-teams">
			     <span class="result-team1" style="white-space:nowrap;float:left;"></span>
			    </div>
			   
			 </div>
			<% 
         }
     }
   %>
 </div> 
 <br>
   <br><br>
</div>
<hr style="margin-top: 34px; margin-bottom: 26px; border-width: 1px 0px 0px; border-style: solid none none; border-color: rgb(41, 32, 32) -moz-use-text-color -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none; width: 89%;"></hr>
<% }
   catch(Exception e){
   	System.out.println("Home1.jsp"+e);
   }%>
</body>
</html>