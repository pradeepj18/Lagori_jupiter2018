package lagori_cls;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

import java.sql.*;
import java.io.PrintWriter;
/**
 * Servlet implementation class lagoriWicket
 */
@WebServlet("/lagoriWicket")
public class lagoriWicket extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public lagoriWicket() {
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
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			ResultSet rs = null;
			
			String tourId = request.getParameter("tourId");		
			String time= "00:"+request.getParameter("time");			
			String set = request.getParameter("set");			
			int Wjno = Integer.parseInt(request.getParameter("Wjno"));
			int Wcjno = Integer.parseInt(request.getParameter("Wcjno"));
			int mid = Integer.parseInt(request.getParameter("mid"));			
			int wno = DBManager.getMaxId("tourWicket","wno",tourId);
			int turn = Integer.parseInt(request.getParameter("turn"));
			rs = DBManager.fetchQuery("select tid1,tid2 from wmatch where mid="+mid);
			int tid1 = 0;
			int tid2 = 0;
			String barcodeId1 = null;
			String barcodeId2 = null;
			if(rs.next())
			{
				tid1 = rs.getInt("tid1");
				tid2 = rs.getInt("tid2");
			}
			rs = null;
			if(turn == tid1)
			{
			/*	System.out.println("FIRST TEAM");*/
				rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wcjno+" and ttId="+turn+" and tourId="+tourId);
				if(rs.next())
				{
					barcodeId1 = rs.getString("barcodeId");
				}
				rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wjno+" and ttId="+tid2+" and tourId="+tourId);
				if(rs.next())
				{
					barcodeId2 = rs.getString("barcodeId");
				}
			}
			else
			{
				/*System.out.println("SECOND TEAM"+turn);*/
				rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wcjno+" and ttId="+turn+" and tourId="+tourId);
				if(rs.next())
				{
					barcodeId2 = rs.getString("barcodeId");
				}
				rs = DBManager.fetchQuery("select barcodeId from tourPlayer where jerseyNo="+Wjno+" and ttId="+tid1+" and tourId="+tourId);
				if(rs.next())
				{
					barcodeId1 = rs.getString("barcodeId");
				}
			}
			DB.insert("insert into tourWicket values("+wno+",'"+time+"','"+barcodeId1+"','"+barcodeId2+"',"+tourId+","+mid+","+tid1+","+tid2+","+set+","+turn+");");
		}
		catch(Exception e)
		{
			System.out.println("Lagori Wicket"+e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
