package lagori_cls;

import java.io.IOException;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class addPlayer
 */
@WebServlet("/addPlayer")
public class addPlayer extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addPlayer() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		try
		{
			DBManager.loadDriver();
			String tName = request.getParameter("tName");
			String tDate = request.getParameter("tRegDate");
			String tFlag = request.getParameter("tFlag");
			int tId = DBManager.getMaxId("team", "tId");
			PreparedStatement ps;
			ps = (PreparedStatement)DBManager.con.prepareStatement("insert into team values(?,?,?,?,?)");
			ps.setInt(1,tId);
			ps.setString(2,tName);
			ps.setString(3,tDate);
			ps.setString(4,"active");
			ps.setString(5, tFlag);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally
		{
			
		}
	}

}
