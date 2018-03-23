package lagori_cls;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class addtourTeam1
 */
@WebServlet("/addtourTeam1")
public class addtourTeam1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtourTeam1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		try
		{
			String gen="F";
				DBManager DB = new DBManager();
					DBManager.loadDriver();
					ResultSet rs = null;
					String team[] = request.getParameterValues("team");
					String tourid = (request.getParameter("tourId"));
					int i = 0;
					if(team != null)
					{
						for(i = 0;i < team.length;i++)
						{
							boolean flag = true;
							rs = DBManager.fetchQuery("select * from tourTeam where ttGender='"+gen+"' and tourId="+tourid);
							//out.println(team[i]+"<br>");
							 while(rs.next())
							{
								if(team[i].equals(rs.getString("tId")))
								{
									flag = false;
									break;
								}
							} 
							if(flag)
							{
								int ttId=DBManager.getMaxId("tourTeam", "ttId",tourid);
								int r=DB.insert("insert into tourTeam values("+ttId+",'"+gen+"','"+tourid+"','"+team[i]+"')");
							//	out.println("insert into tourTeam values("+ttId+",'M','"+tourid+"','"+team[i]+"')");
								if(r>=0)
								{
									PrintWriter out=response.getWriter();
								out.println("<script type='text/javascript'>alert('Teams Added Successfully in Tournament.');window.location.replace('addtourTeam.jsp?tourId="+request.getParameter("tourId")+"');</script>");
								}
							}
						}
						
					
					 	//For Delete
						rs = DBManager.fetchQuery("select * from tourTeam where ttGender='"+gen+"' and  tourId="+tourid);
						rs.last();
					
						String rb[] = new String[rs.getRow()];
						int j = 0;
						rs.beforeFirst();
						while(rs.next())
						{
							rb[j++] = rs.getString("tId");
						}
						j = 0;
						while(j < rb.length)
						{
							boolean flag = true;
							for(i = 0;i < team.length;i++)
							{
								if(rb[j].equals(team[i]))
								{
									flag = false;
									break;
								}
							}
							if(flag)
							{
								System.out.println("Values is deleted is '"+rb[j]+"'");
								int r=DB.insert("delete from tourTeam where tId='"+rb[j]+"' and tourId="+tourid);
								if(r>=0)
								{
									PrintWriter out=response.getWriter();
								out.println("<script type='text/javascript'>alert('Teams Deleted Successfully from Tournament.');window.location.replace('addtourTeam.jsp?tourId="+request.getParameter("tourId")+"');</script>");
								}
							}
							j = j+1;
						}				
					}
			/* 		else
					{
						DB.insert("delete from tourTeam where tourId="+tourid);
					} */
		
			}
			catch(Exception e)
			{
				System.out.println(e);	
			}
		
	}

}
