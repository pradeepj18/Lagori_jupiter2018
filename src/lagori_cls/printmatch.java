/*package lagori_cls;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

import java.sql.*;

*//**
 * Servlet implementation class printmatch
 *//*
@WebServlet("/printmatch")
public class printmatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    *//**
     * @see HttpServlet#HttpServlet()
     *//*
    public printmatch() {
        super();
        // TODO Auto-generated constructor stub
    }

	*//**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			ResultSet rs = null,rs1 = null;
			rs = DBManager.fetchQuery("select TIME_FORMAT(now(),'%H:%i:%s') as time,DATE_FORMAT(now(),'%X-%m-%d') as mdate;");
			int mid = Integer.parseInt(request.getParameter("mid"));
			String tourid = request.getParameter("tourId");
			int court = Integer.parseInt(request.getParameter("court"));
			int twon = Integer.parseInt(request.getParameter("toss"));
			String gender=request.getParameter("gender");
			rs1 = DBManager.fetchQuery("select mid,m.tid1,m.tid2,m.mtype from wmatch m where m.tourId="+tourid+" and m.gender='"+gender+"' and m.mid="+mid+";");
			rs1.next();
			int tid1 = rs1.getInt("m.tid1");
			int tid2 = rs1.getInt("m.tid2");
			String mtype = rs1.getString("m.mtype");
			
			
			rs.next();
			int srno = DBManager.getMaxId("print_match", "mid", tourid);
			DB.insert("insert into print_match values("+mid+",'"+rs.getString("mdate")+"','"+rs.getString("time")+"',"+twon+","+court+","+tourid+",'"+gender+"',"+tid1+","+tid2+",'"+mtype+"',"+srno+");");
			
			}
		catch(Exception e)
		{
			System.out.println("PrintMatch "+e);
		}
		
	}

	*//**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 *//*
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
*/