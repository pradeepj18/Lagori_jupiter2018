package m_lagori;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class m_addtourMatch
 */
@WebServlet("/m_addtourMatch")
public class m_addtourMatch extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_addtourMatch() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			String[] id = request.getParameterValues("teamvalues[]");
			int len = 0;
			len = id.length;
			String tourId = id[len-1];
			String gen = id[len-2];
			String  poolname= id[len-3];
			for(int i = 0;i < len-3;i++){
				int poolId = DBManager.getMaxId("tourPool","poolId",tourId);
				DB.insert("insert into tourPool values("+poolId+",'"+poolname+"','"+id[i]+"','"+gen+"','"+tourId+"')");
			}
		}
		catch(Exception e){
		//	System.out.println("Exception in addtourMatch.java"+e);
			e.printStackTrace();
			e.getMessage();
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
