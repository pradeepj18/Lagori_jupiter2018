<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager" import="java.sql.*" import="javax.swing.tree.DefaultMutableTreeNode"
    import="javax.swing.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Print All Teams</title>
  <link rel="stylesheet" href="css/bootstrap.min.css">
  <script src="js/jquery-3.1.1.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
<style>
@media print
{
.break 
{
display:block;
 page-break-after:always;
}

 }
</style>
<style type="text/css">
.watermark::after {
  content: "";
 background:url("images/petanquelogo.jpeg");
  opacity: 0.2;
  top: 0;
  left: 0;
  bottom: 0;
 width:100%;
  position: absolute;
   
  background-repeat: no-repeat;
    background-position: center;
    background-attachment: fixed;
    
}

</style>
</head>

<body >
<div class="container">

<%


try
{
	
DBManager.loadDriver();
int tourId=1;
String gen="M";
ResultSet rs=null;
int count=0;
rs=DBManager.fetchQuery("select ttId,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=tp.ttId and tourId="+tourId+" and tpgender='"+gen+"')) as tName from tourPool tp where  tourId="+tourId+" and tpgender='"+gen+"';");
int ttId[]=new int[100];
String tName[]=new String[100];

while(rs.next())
{
	ttId[count]=rs.getInt("ttId");
	tName[count]=rs.getString("tName");
	count++;
}
rs=null;

for(int i=0;i<count;i++)
{
	%>
	<div class="row">
	<div class="col-md-12">
	<center><h2><%=tName[i] %></h2></center>
	</div>
	</div>
	<div class="row">
	<div class="col-md-2"></div>
	<div class="col-md-8">
	
	<table class="table table-bordered table-responsive">
	

	<% 
	//out.println("<center> <table border=1 style=border-collapse:collapse;border:1px solid #FFFFF;color:#000000;width:100% size=2 cellpadding=1  > ");
	
	rs=DBManager.fetchQuery("select tpId,jerseyNo,(select fName from member m where m.barcodeId=tp.barcodeId) as fName,(select mName from member m where m.barcodeId=tp.barcodeId) as mName,(select lName from member m where m.barcodeId=tp.barcodeId) as lName from tourPlayer tp,tourTeam tt where tp.tourId="+tourId+" and tp.ttId=tt.ttId and tp.ttId="+ttId[i]+";");
	if(rs.next())
	{
		%>
		<thead>
	<tr>
	<th>SR NO</th>
	<th>PLAYER NAME</th>
	<th>JERSEY NO</th>
	</tr>
	</thead>
		<% 
		//out.println("<tr ><th  width=10% align=center  ><h3>Sr. No</h3></th><th  width=40% align=center  ><h3>Player Name</h3></th><th  width=20% align=center  ><h3>Jersy No</h3></th></tr>");
		rs.beforeFirst();
	}
	else
	{
		out.println("<th><h3>NO PLAYER FOUND</h3></th>");
	}
	int cnt=0;
	String name=null;
	while(rs.next())
	{
		if(rs.getString("mName").equalsIgnoreCase(null))
		name=rs.getString("fName")+" "+rs.getString("lName");
		else
			name=rs.getString("fName")+" "+rs.getString("mName")+" "+rs.getString("lName");
		%>
		<tbody>
		<tr style="font-size:12pt;">
		<td ><%=cnt++ %></td>
		<td><%=name %></td>
		<td><%=rs.getInt("jerseyNo") %></td>
		</tr>
		</tbody>
		<% 
		//out.println("<tr><td><center><font size=5><div class='t'>"+cnt++ +"</div></center></td>    <td><font size=5><div class='t'>"+name+"</div></td><td><center><font size=5><div class='t'>"+rs.getInt("jerseyNo")+"</div></center></td></tr>");
	
	}

	//out.println("</table></center>");
	%>
		</table>
		</div>
		<div class="col-md-2"></div>
	</div>
	<div class="break"></div>
	<% 
	
}
}
catch(Exception e)
{e.getMessage();}

%>

</div>
</body>
</html>