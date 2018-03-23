package lagori_cls;


import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class Addmember1
 */
@WebServlet("/Addmember1")
public class Addmember1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Addmember1() {
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
			DBManager.loadDriver();
			DBManager DB=new DBManager();
			
			//	DB.insert("insert into tourPlayer(toId,jerseyNo,tourId,ttId,barcodeId) values("+DBManager.getMaxId("tourPlayer", "toId")+",)");
		
			String tourid=request.getParameter("selectteam");
			String fname[]=request.getParameterValues("fname");
			String mname[]=request.getParameterValues("mname");
			String lname[]=request.getParameterValues("lname");
			String dob[]=request.getParameterValues("dob");
			//String gen[]=request.getParameterValues("gen");
			int r1=0;
			System.out.println(tourid);
			
			if(tourid.equals("Select_Team"))
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Select Tournament Name');window.location.replace('member1.jsp');</script>");
				
			}
			
			for(int i=0;i<fname.length;i++)
			{
			
				if(mname[i].equals("") || dob[i].equals(""))
				{
					mname[i]="";
					dob[i]="0000-00-00";
				}
				int bid=DBManager.getMaxId("member", "barcodeId");
				
				int r=DB.insert("insert into member(barcodeId,fName,mName,lName,dob,gender) values("+bid+",'"+fname[i]+"','"+mname[i]+"','"+lname[i]+"','"+dob[i]+"','"+request.getParameter("gen"+i+"")+"')");
				if(r>0)
					{
						r1=DB.insert("insert into tourPlayer(tpId,jerseyNo,tourId,ttId,barcodeId) values("+DBManager.getMaxId("tourPlayer", "tpId")+","+(i+1)+",'1','"+tourid+"','"+bid+"')");
					}
				}
			if(r1>0)
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Data Added');window.location.replace('member1.jsp');</script>");
				
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Error');window.location.replace('member1.jsp');</script>");
				
			}
		
		}
		catch(Exception e)
		{
			System.out.println("add member java"+e);
		}
		finally
		{
			DBManager.close();
		}
	
	}

}
