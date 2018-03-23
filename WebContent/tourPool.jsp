<%@ page language="java" import="java.sql.*"
	import="lg_DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add Pool Team</title>

</head>

<body onload="call1()">
	<h3>Add Pool</h3>
	
		<form>
			Total Pool
					<%
					String gen;
					int tourId=7;
					try
					{
						if(request.getParameter("name") != null)
						{
					%>
					<input type="text" name="no_pool" id="no_pool" value=<%=request.getParameter("name") %>><br><br>
					<%	
						}
						else if(request.getParameter("no_pool") != null)
						{
							%>
							<br><br>
							<input type="text" name="no_pool" id="no_pool" value=<%=request.getParameter("no_pool") %>>
							<%	
							
						}
						else
						{
					%>
				
						<input type="text" name="no_pool" id="no_pool" autofocus reqiured>
					
					<% }
					if(request.getParameter("gen") != null && request.getParameter("gen").equals("M"))
					{
					%>
						<input type="radio" name="p" value="M" id="M" onchange="call(this)" checked>Male
					<%
					}
					else if(request.getParameter("p") != null && request.getParameter("p").equals("M"))
					{
					%>
						<input type="radio" name="p" value="M" id="M" onchange="call(this)" checked>Male
					<%
					}
					else
					{
					%>
					<br>
					<br>
						<input type="radio" name="p" value="M" id="M" onchange="call(this)">Male
					<%
					}
					if(request.getParameter("gen") != null && request.getParameter("gen").equals("F"))
					{
					%>
						<input type="radio" name="p" value="F" id="F"  onchange="call(this)" checked>Female
					<%
					}
					else if(request.getParameter("gen") != null && request.getParameter("gen").equals("F"))
					{
					%>
						<input type="radio" name="p" value="F" id="F"  onchange="call(this)" checked>Female
					<%
					}
					else
					{
					%>
					<input type="radio" name="p" value="F" id="F" onchange="call(this)">Female
					<%
					}
					}
					catch(Exception e){}
						gen=request.getParameter("gen");
						
							try {
								ResultSet rs;
								ResultSet rs1;

								response.setContentType("text/html");

								DBManager.loadDriver();
								
						%>
						<br><br>
						Pool Name 
						<select	name="pname" required>
						<%
							if((!request.getParameter("pname").equals("false")))
							{
									int j = Integer.parseInt(request.getParameter("pname"));
									if(j < Integer.parseInt(request.getParameter("name")))
									{ j = j+1;
						%>
						<option value="<%=j %>">POOL &#<%=64 + j %></option>
							<%
									}
							}
								int pool = Integer.parseInt(request.getParameter("name"));
									
									int i = 1;
									if (pool==1 || pool == 4 ||pool == 2 || pool == 8 || pool == 12) {
										for (i = 1; i <= pool; i++) {
							%>
							<option value="<%=i%>">POOL &#<%=64 + i%></option>
							<%
								}
									} else {
							%>
							<script type="text/javascript">
								
								alert('Pool cannot be create');
								
							</script>
							<%
								System.out.println("Pool cannot create");
									}
							%>
						</select>

		<br><br>Teams :-<br> 
						
		<%
				 i=0;
				//rs = DBManager.fetchQuery("select tId,(select tName from team t where t.tId=tt.tId) as tname from tourTeam tt where tt.tId not in(select ttId from tourPool) and tt.ttGender='"+gen+"' and tourId="+tourId+";");
				//System.out.println("select ttId,(select tName from team t where t.tId = tt.tId) as tname from tourTeam tt where tourId="+tourId+" and ttGender ='"+gen+"' order by tname asc;");
				rs = DBManager.fetchQuery("select ttId,(select tName from team t where t.tId = tt.tId) as tname from tourTeam tt where tourId="+tourId+" and ttGender ='"+gen+"' and ttId not in(select ttId from tourPool) order by tname asc;");
				//rs=DBManager.fetchQuery("select ttId,(select tName from team t where t.tId=tt.tId) as tname from tourTeam tt where tt.tId not in(select ttId from tourPool where tourId="+tourId+" and tpgender='"+gen+"') and tt.ttGender='"+gen+"' and tourId="+tourId+" order by tname asc;");
				while(rs.next())
				{
		%>
		<input type="checkbox" name="team" value="<%=rs.getString("ttId") %>"><%=rs.getString("tname") %><br>
		<%
				i++;
				}
		
		%>					
			<input type="submit" value="Add Pool" >
						
							<%
				
				} catch (Exception e) {
					out.println(e);
				}
			%>
			
		</form>
		
		<%
		try
		{

			DBManager.loadDriver();
			
			DBManager DB = new DBManager();
			String teams[] = request.getParameterValues("team");
			//String g=request.getParameter("gen");
			String g="M";
			if(teams != null)
			{
				for(int i = 0;i < teams.length;i++)
				{
					int poolId = DBManager.getMaxId("tourPool","poolId");
					DB.insert("insert into tourPool values('"+poolId+"','"+request.getParameter("pname")+"','"+teams[i]+"','"+g+"',"+tourId+");");
					//System.out.println("insert into tourPool values('"+poolId+"','"+request.getParameter("pname")+"','"+teams[i]+"','"+request.getParameter("gen")+"',"+tourId+");");
					System.out.println(teams[i]);
				}
			}
		}
		catch (Exception e)
		{
			out.println("Error in tourPool.jsp"+e);
		}
		%>
		

	<script language="javascript" type="text/javascript">
	function getParameter(variable)
	{
	       var query = window.location.search.substring(1);
	       var vars = query.split("&");
	       for (var i=0;i<vars.length;i++) {
	               var pair = vars[i].split("=");
	               if(pair[0] == variable){return pair[1];}
	       }
	       return(false);
	}
	
	function call(p)
	{
		var no_pool = document.getElementById("no_pool").value;
		var pname = getParameter("pname");
			var gen = p.value;
			if(no_pool && gen)
			window.location.replace("tourPool.jsp?name="+ no_pool+"&gen="+gen+"&pname="+pname);
	}
	function call1()
	{
		var gen = getParameter("p");
		var no_pool = getParameter("no_pool");
		var pname = getParameter("pname");
		if(no_pool && gen)
			window.location.replace("tourPool.jsp?name="+ no_pool+"&gen="+gen+"&pname="+pname);
	}
	</script>
	<br><br>
<a href="wclots.jsp">Generate Lots Here</a>
</body>
</html>
