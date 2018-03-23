package m_lagori;

import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

/**
 * Servlet implementation class m_addtourMember
 */
@WebServlet("/m_addtourMember")
public class m_addtourMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_addtourMember() {
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
			ResultSet rs = null;
			String[] id = request.getParameterValues("memvalues[]");
			int len = id.length;
			String gen = id[len-1];
			String tourId = id[len-2];
			String  category= id[len-3];
			String  ttId= id[len-4];
			
			/*
			 * PLAYER = 1
			 * COACH = 2
			 * MANAGER= 3
			 * OFFICIAL=4
			 */
			if(category.equals("1")){
				//PLAYER
				rs = null;
				int jerseyNo[] = new int[16];
				int i = 0;
				rs = DBManager.fetchQuery("select jerseyNo from tourPlayer where tourId="+tourId+" and ttId="+ttId+" order by jerseyNo asc");
				while(rs.next()){
					jerseyNo[i] = rs.getInt("jerseyNo");
					i = i+1;
				}
				int newjerseyNo[] = new int[(id.length)+14];
				int k = 0;
				for(int j = 1;j<14;j++){
					boolean flag = true;
					for(i = 0;i < jerseyNo.length;i++)
					{
						if(j == jerseyNo[i])
						{
							flag = false;break;
						}
						if(j < jerseyNo[i]){
							break;
						}
					}
					if(flag){
						newjerseyNo[k++] = j;
					}
				}
				for(int j = 0;j <= len-5;j++){
					int tpId = DBManager.getMaxId("tourPlayer", "tpId",tourId);
					DB.insert("insert into tourPlayer (tpId,jerseyNo,tourId,ttId,barcodeId) values('"+tpId+"',"+newjerseyNo[j]+",'"+tourId+"','"+ttId+"','"+id[j]+"');");
				}
			}
			else if(category.equals("2")){
				//COACH
				for(int j = 0;j <= len-5;j++){
					int tcId = DBManager.getMaxId("tourCoach", "tcId",tourId);
					DB.insert("insert into tourCoach (tcId,tourId,ttId,barcodeId) values('"+tcId+"','"+tourId+"','"+ttId+"','"+id[j]+"');");
				}
			}
			else if(category.equals("3")){
				//MANAGER
				for(int j = 0;j <= len-5;j++){
					int tmId = DBManager.getMaxId("tourManager", "tmId",tourId);
					DB.insert("insert into tourManager (tmId,tourId,ttId,barcodeId) values('"+tmId+"','"+tourId+"','"+ttId+"','"+id[j]+"');");
				}
				
			}
			else if(category.equals("4")){
				//OFFICIAL
				for(int j = 0;j <= len-5;j++){
					int toId = DBManager.getMaxId("tourOfficial", "toId",tourId);
					DB.insert("insert into tourOfficial (toId,tourId,barcodeId) values('"+toId+"','"+tourId+"','"+id[j]+"');");
				}
			}
		}
		catch(Exception e){
			System.out.println("Exception in addtourMember.java"+e);
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
