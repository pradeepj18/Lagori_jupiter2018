package m_lagori;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class m_deleteTeam
 */
@WebServlet("/m_deleteTeam")
public class m_deleteTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_deleteTeam() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try
		{
		//	System.out.println("----------");
			DBManager DB = new DBManager();
			DBManager.loadDriver();
			String tourId=request.getParameter("tourId");
			String ttId=request.getParameter("ttId");
			String gen=request.getParameter("gen");
			DB.insert("delete from tourTeam where tourId="+tourId+" and ttId="+ttId+" and ttGender='"+gen+"';");
			System.out.println("deleted succesffully");
			
		}
		catch(Exception e)
		{
			System.out.println("in deleteTeam.java "+e);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
