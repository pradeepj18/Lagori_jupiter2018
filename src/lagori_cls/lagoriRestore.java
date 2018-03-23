package lagori_cls;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

import java.io.PrintWriter;
import java.sql.*;
/**
 * Servlet implementation class lagoriRestore
 */
@WebServlet("/lagoriRestore")
public class lagoriRestore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lagoriRestore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			DBManager DB = new DBManager();
			DBManager.loadDriver();
			ResultSet rs=null;
			String tourId = request.getParameter("tourId");		
			int score  = Integer.parseInt(request.getParameter("score"));	
			String time= "00:"+request.getParameter("time");			
			String set = request.getParameter("set");			
			int Hjno = Integer.parseInt(request.getParameter("Hjno"));			
			int mid = Integer.parseInt(request.getParameter("mid"));			
			int ttId = Integer.parseInt(request.getParameter("tid"));
			int rno = DBManager.getMaxId("tourRestore", "rno",tourId);
			
			rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Hjno+" and tourId="+tourId+" and ttId="+ttId+";");
			if(rs.next())
			{
				/*System.out.println("insert into lagoriRestore values("+rno+",'"+time+"','"+rs.getString("barcodeId")+"',"+tourId+","+mid+","+ttId+","+score+",'"+set+"');");*/
				DB.insert("insert into tourRestore values("+rno+",'"+time+"','"+rs.getString("barcodeId")+"',"+tourId+","+mid+","+ttId+","+score+",'"+set+"');");
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Check Jersry No');</script>");
			}
			
		}
		catch(Exception e)
		{
			System.out.println("LagroiRestore Servlet"+e);
		}		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
