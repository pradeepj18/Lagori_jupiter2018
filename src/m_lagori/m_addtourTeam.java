package m_lagori;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class m_addtourTeam
 */
@WebServlet("/m_addtourTeam")
public class m_addtourTeam extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_addtourTeam() {
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
		try
		{
			System.out.println("+++++");
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			String[] id = request.getParameterValues("teamvalues[]");
			int len = id.length;
			String tourId = id[len-1];
			String gen = id[len-2];
			for(int i = 0;i < len-2;i++){
				int ttId = DBManager.getMaxId("tourTeam", "ttId",tourId);
				DB.insert("insert into tourTeam values("+ttId+",'"+gen+"','"+tourId+"','"+id[i]+"')");
			}
		}
		catch(Exception e)
		{
			System.out.println("m_addtourTeam.java "+e);	
		}
	}

}
