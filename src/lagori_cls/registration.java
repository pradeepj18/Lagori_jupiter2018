package lagori_cls;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.PreparedStatement;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class registration
 */
@WebServlet("/registration")
public class registration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public registration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		try {
			DBManager.loadDriver();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		DBManager DB = new DBManager();
		String fname = request.getParameter("fname");
		String lname = request.getParameter("lname");
		String dob = request.getParameter("dob");
		String emailid = request.getParameter("emailid");
		String mobno = request.getParameter("mobno");
		

		int regid = DBManager.getMaxId("registration", "regid");
		PreparedStatement ps;
		try
		{	
			ps=(PreparedStatement) DBManager.con.prepareStatement("insert into registration values(?,?,?,?,?,?)");
			
				ps.setInt(1,regid);
				ps.setString(2,fname);
				ps.setString(3,lname);
				ps.setString(4,dob);
				ps.setString(5,emailid);
				ps.setString(6,mobno);
				System.out.println("REGID" );
				ps.executeUpdate();
		} 
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
