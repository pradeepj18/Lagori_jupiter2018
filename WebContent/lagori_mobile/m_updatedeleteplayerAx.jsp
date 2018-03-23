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
	DBManager.loadDriver();
	
	boolean flag=true;
	String tourId=request.getParameter("tourId");
	String ttId=request.getParameter("ttId");
	String barcodeId = request.getParameter("barcodeId");
	String fName = request.getParameter("fName");
	String mName = request.getParameter("mName");
	String lName = request.getParameter("lName");
	String tName = request.getParameter("tName");
	String jerseyNo=request.getParameter("jerseyNo");
	String category=request.getParameter("category");
	int option=Integer.parseInt(request.getParameter("flag"));
	
	if(category.equals("1"))
	{
		ResultSet rs = null;
		if(option == 1)
		{
			DBManager DB = new DBManager();
			
		rs = DBManager.fetchQuery("select fName from member where barcodeId='"+barcodeId+"'");
		if(rs.next())
		{
			if(rs.getString("fName").equals(fName))
			{
				System.out.println("fName Not Update");
			}
			else
			{
				DB.insert("update member set fName=UCASE('"+fName+"') where barcodeId='"+barcodeId+"'");
			}
		}
		rs=null;
		
		rs = DBManager.fetchQuery("select mName from member where barcodeId='"+barcodeId+"'");
		if(rs.next())
		{
			
			DB.insert("update member set mName=UCASE('"+mName+"') where barcodeId='"+barcodeId+"'");
		}
		rs=null;
		rs = DBManager.fetchQuery("select lName from member where barcodeId='"+barcodeId+"'");
		if(rs.next())
		{
			if(rs.getString("lName").equals(lName))
			{
				System.out.println("lName Not Update");
			}
			else
			{
				DB.insert("update member set lName=UCASE('"+lName+"') where barcodeId='"+barcodeId+"'");
			}
		}
				rs=null;
				rs=DBManager.fetchQuery("select jerseyNo from tourPlayer where tourId="+tourId+" and ttId="+ttId+";");
				while(rs.next())
				{
					if(rs.getString("jerseyNo").equals(jerseyNo))
					{
						System.out.println("JERSEY NO ALREADY EXIST");
						flag=false;
					}
					
				}
				if(flag)
				{
					DB.insert("update tourPlayer set jerseyNo ='"+jerseyNo+"' where tourId='"+tourId+"' and ttId='"+ttId+"' and barcodeId='"+barcodeId+"';");
				}
				
		}
		else if(option == 2)
		{DBManager DB = new DBManager();
			DB.insert("delete from tourPlayer where tourId='"+tourId+"' and barcodeId='"+barcodeId+"';");
			System.out.println("player deleted succesffully");
		}
	}
	else if(category.equals("2"))
	{
	//	System.out.println("in cat 2");
		ResultSet rs = null;
		if(option == 1)
		{DBManager DB = new DBManager();
				rs = DBManager.fetchQuery("select fName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("fName").equals(fName))
					{
						System.out.println("fName Not Update");
					}
					else
					{
						DB.insert("update member set fName=UCASE('"+fName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select mName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("mName").equals(mName))
					{
						System.out.println("mName Not Update");
					}
					else
					{
						DB.insert("update member set mName=UCASE('"+mName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select lName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("lName").equals(lName))
					{
						System.out.println("lName Not Update");
					}
					else
					{
						DB.insert("update member set lName=UCASE('"+lName+"') where barcodeId='"+barcodeId+"'");
					}
				}
		}
		else if(option == 2)
		{DBManager DB = new DBManager();
			DB.insert("delete from tourCoach where tourId='"+tourId+"' and barcodeId='"+barcodeId+"';");
			System.out.println("coach deleted succesffully");
		}
	}
	else if(category.equals("3"))
	{
		//System.out.println("in cat 3");
		ResultSet rs = null;
		if(option == 1)
		{DBManager DB = new DBManager();
				rs = DBManager.fetchQuery("select fName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("fName").equals(fName))
					{
						System.out.println("fName Not Update");
					}
					else
					{
						DB.insert("update member set fName=UCASE('"+fName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select mName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("mName").equals(mName))
					{
						System.out.println("mName Not Update");
					}
					else
					{
						DB.insert("update member set mName=UCASE('"+mName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select lName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("lName").equals(lName))
					{
						System.out.println("lName Not Update");
					}
					else
					{
						DB.insert("update member set lName=UCASE('"+lName+"') where barcodeId='"+barcodeId+"'");
					}
				}
		}
		else if(option == 2)
		{DBManager DB = new DBManager();
			DB.insert("delete from tourManager where tourId='"+tourId+"' and barcodeId='"+barcodeId+"';");
			System.out.println("Manager deleted succesffully");
		}
	}
	else if(category.equals("4"))
	{
		//System.out.println("in cat 4");
		ResultSet rs = null;
		if(option == 1)
		{DBManager DB = new DBManager();
				rs = DBManager.fetchQuery("select fName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("fName").equals(fName))
					{
						System.out.println("fName Not Update");
					}
					else
					{
						DB.insert("update member set fName=UCASE('"+fName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select mName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("mName").equals(mName))
					{
						System.out.println("mName Not Update");
					}
					else
					{
						DB.insert("update member set mName=UCASE('"+mName+"') where barcodeId='"+barcodeId+"'");
					}
				}
				rs=null;
				rs = DBManager.fetchQuery("select lName from member where barcodeId='"+barcodeId+"'");
				if(rs.next())
				{
					if(rs.getString("lName").equals(lName))
					{
						System.out.println("lName Not Update");
					}
					else
					{
						DB.insert("update member set lName=UCASE('"+lName+"') where barcodeId='"+barcodeId+"'");
					}
				}
		}
		else if(option == 2)
		{DBManager DB = new DBManager();
			DB.insert("delete from tourOfficial where tourId='"+tourId+"' and barcodeId='"+barcodeId+"';");
			//System.out.println("Official deleted succesffully");
		}
	}
	
	else if(category.equals("5"))
	{
		//System.out.println("in cat 5");
		ResultSet rs = null;
		if(option == 1)
		{DBManager DB = new DBManager();
				//System.out.println("select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="+barcodeId+";");
				rs = DBManager.fetchQuery("select tName from team t,tourTeam tt where t.tId=tt.tId and tt.ttId="+barcodeId+";");
				if(rs.next())
				{
					if(rs.getString("tName").equals(tName))
					{
						System.out.println("tName Not Update");
					}
					else
					{
					//	System.out.println("update team set tName='"+tName+"' where tId=(select tId from tourTeam where ttId="+barcodeId+");");
						DB.insert("update team set tName=UCASE('"+tName+"') where tId=(select tId from tourTeam where ttId="+barcodeId+");");
					//	System.out.println("tNAme updated");
					}
				}
				
		}
		else if(option == 2)
		{DBManager DB = new DBManager();
		//	System.out.println("delete from tourTeam where tourId="+tourId+" and ttId="+barcodeId+";");
			DB.insert("delete from tourTeam where tourId="+tourId+" and ttId="+barcodeId+";");
			//System.out.println("Official deleted succesffully");
		}
	}
}
catch(Exception e)
{
	System.out.println("updatedeleteplayer servlet"+e);
	e.printStackTrace();
}

%>
</body>
</html>