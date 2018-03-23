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
	System.out.println("*********");
	DBManager DB = new DBManager();
	boolean flag=true;
	String tourId=request.getParameter("tourId");
	String mid=request.getParameter("mid");
	String barcodeId=request.getParameter("barcodeId");
	String ttId=request.getParameter("ttId");
	String htype=request.getParameter("htype");
	String category=request.getParameter("category");
	String option=request.getParameter("flag");
	String id=request.getParameter("id");
	String ttId1 = request.getParameter("tid");
	String barcodeId1=request.getParameter("barcodeId1");
	String barcodeId2=request.getParameter("barcodeId2");
	
	String score = request.getParameter("score");
	ResultSet rs = null;
	
	if(category.equals("1"))
	{
		
		if(option.equals("1"))
		{
			rs = DBManager.fetchQuery("select tp.barcodeId from tourPlayer tp,tourHit th where tp.barcodeId=th.barcodeId and hno="+id+" and th.tourId ="+tourId+" and mid="+mid+" and th.ttId="+ttId1+";");
			
			if(rs.next())
			{	
					DB.insert("update tourHit set barcodeId="+barcodeId+",htype="+htype+",ttId="+ttId+" where hno="+id+" and tourId="+tourId+" and mid="+mid+" and ttId="+ttId1+";");
			}
		}
		else if(option.equals("2"))
		{
			DB.insert(" delete from tourHit where tourId="+tourId+" and mid="+mid+" and hno="+id+" and ttId="+ttId+";");
		}
	}
	else if(category.equals("2"))
	{
		
		if(option.equals("1"))
		{
			rs = DBManager.fetchQuery("select tp.barcodeId from tourPlayer tp,tourMiss th where tp.barcodeId=th.barcodeId and mno="+id+" and th.tourId ="+tourId+" and mid="+mid+" and th.ttId="+ttId1+";");
			if(rs.next())
			{	
					DB.insert("update tourMiss set barcodeId="+barcodeId+",mtype="+htype+",ttId="+ttId+" where mno="+id+" and tourId="+tourId+" and mid="+mid+" and ttId="+ttId1+";");
			}
		}
		else if(option.equals("2"))
		{
			DB.insert(" delete from tourMiss where tourId="+tourId+" and mid="+mid+" and mno="+id+" and ttId="+ttId+";");
			System.out.println("tour miss deleted succesffully");
		}
	}
	else if(category.equals("3"))
	{
		if(option.equals("1"))
		{
		
			rs = DBManager.fetchQuery("select tp.barcodeId from tourPlayer tp,tourRestore tr where tp.barcodeId=tr.barcodeId and rno="+id+" and tr.tourId ="+tourId+" and mid="+mid+" and tr.ttId="+ttId1+";");
			if(rs.next())
			{	
					DB.insert("update tourRestore set barcodeId="+barcodeId+",rtype="+htype+",ttId="+ttId+",score="+score+" where rno="+id+" and tourId="+tourId+" and mid="+mid+" and ttId="+ttId1+";");
			}
		}
		else if(option.equals("2"))
		{
			DB.insert(" delete from tourRestore where tourId="+tourId+" and mid="+mid+" and rno="+id+" and ttId="+ttId+";");
			System.out.println("tour restore deleted succesffully");
		}
	}
	else if(category.equals("4"))
	{
		
		if(option.equals("1"))
		{
			DB.insert("update tourWicket set barcodeId1="+barcodeId1+",barcodeId2="+barcodeId2+",wtype="+htype+",turn="+ttId+" where wno="+id+" and tourId="+tourId+" and mid="+mid+";");
			
		}
		else if(option.equals("2"))
		{
			DB.insert(" delete from tourWicket where tourId="+tourId+" and mid="+mid+" and wno="+id+" and turn="+ttId+";");
			System.out.println("tour miss deleted succesffully");
		}
	}
	
}  /*try close*/
catch(Exception e)
{
	System.out.println("in updatedeleteHMR.java "+e);
}
%>
</body>
</html>