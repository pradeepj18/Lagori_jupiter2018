package lagori_cls;


import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class addtourMatchRefree
 */
@WebServlet("/addtourMatchRefree")
public class addtourMatchRefree extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addtourMatchRefree() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try
		{
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			String mid = request.getParameter("mid");
			String mref = "0";//request.getParameter("mref");
			String tourId = request.getParameter("tourId");
			String tmr1 = request.getParameter("tmr1");
			String tmr2 = request.getParameter("tmr2");
			String tmo1 = request.getParameter("tmo1");
			String tmo2 = request.getParameter("tmo2");
			String tourRefree = request.getParameter("tourRefree");
			int tmro = DBManager.getMaxId("tourmatchrefoff", "tmro", tourId);
			//System.out.println("insert into tourmatchrefoff values("+tmro+","+mid+",'"+gen+"',"+tourId+","+tmr1+","+tmr2+","+tmo1+","+tmo2+","+tourRefree+");");
			DB.insert("insert into tourMatchOfficial values("+mid+","+tmr1+","+tmr2+","+tmo1+","+tmo2+","+mref+","+tourRefree+","+tourId+");");
		}
		catch(Exception e){
			System.out.println("addtourMatchRefree.jva "+e);
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
