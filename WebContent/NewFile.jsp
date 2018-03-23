<%@ page language="java" import="java.sql.*"
	import="lg_DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%!static int k=100; %>
<%
	try
{

		DBManager.loadDriver();
		ResultSet rs = DBManager
				.fetchQuery("select ttId from tourTeam where ttId not in (select ttId from tourPlayer);");
		/* while (rs.next()) 
		{
			System.out.println("aaaaaa : " + rs.getInt("ttId"));
			for (int j = 0; j < 8; j++) {
				System.out.println(k);
				new DBManager().insert("insert into member(barcodeId,fName,lName) values(" + (7000 + k) + ",'"
						+ ((char) (65 + j)) + "','" + ((char) (65 + j)) + "')");
				//new DBManager().insert("insert into tourPlayer values("+(k)+","+(j+1)+",'active',1,"+rs.getInt("ttId")+","+(7000+k)+");");
				k++;

			}
		} */
		rs.last();
		int i =0;
		int team[] = new int[rs.getRow()];
		rs.beforeFirst();
		while(rs.next()){
			team[i] = rs.getInt("ttId");
			i++;
		}
		
		for(int jj = 0;jj < i;jj++){
			System.out.println("Team "+team[jj]);
			for (int j = 0; j < 8; j++) {
				System.out.println(k);
				new DBManager().insert("insert into member(barcodeId,fName,lName) values(" + (7000 + k) + ",'"
						+ ((char) (65 + j)) + "','" + ((char) (65 + j)) + "')");
				new DBManager().insert("insert into tourPlayer values("+(k)+","+(j+1)+",'active',1,"+team[jj]+","+(7000+k)+");");
				k++;

			}
		}
		
	} catch (Exception e) {
		e.getMessage();
	}
%>
</body>
</html>