package lagori_cls;


import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import lg_DBManager.DBManager;

import java.sql.*;
import java.util.Iterator;
import java.util.List;
/**
 * Servlet implementation class addTournament
 */
@WebServlet("/addTournament")
public class addTournament extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addTournament() {
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
	FileItem item=null;
	String str[]=new String[100];//for form values
	int cnt=0;
	String str1[]=new String[100];//for browse values
	int cnt1=0;
	String f=null;
	DBManager.loadDriver();
	DBManager DB=new DBManager();
	int tourId=DBManager.getMaxId("tournament", "tourId");
	String ImageFile="";
	String itemName = "";

	
	boolean isMultipart = ServletFileUpload.isMultipartContent(request);
	if (!isMultipart)
	{
	}
	else
	{
	FileItemFactory factory = new DiskFileItemFactory();
	ServletFileUpload upload = new ServletFileUpload(factory);
	List items = null;
	try
	{
	items = upload.parseRequest(request);
	}
	catch (FileUploadException e)
	{
	e.getMessage();
	}

	Iterator itr = items.iterator();
	while (itr.hasNext())
	{
	item = (FileItem) itr.next();
	if (item.isFormField())
	{
	String name = item.getFieldName();
	String value = item.getString();
	str[cnt++]=value;
	if(name.equals("tflag"))
	{
	ImageFile=value;
	}
	
	}
	else
	{
	try
	{

		int ii=0;//for extension
	 str1[cnt1] = item.getName();
	// System.out.println("*****"+str1[cnt1]);
	 String s2[]=str1[cnt1].split("\\.");
	
	 String s[]=str[0].split(" ");
	 String s1="";
	 for(int i=0;i<s.length;i++)
		 s1+=s[i];
			f="/home/pradeep/Documents/MyTown/Final_Lagori/WebContent/images/tournament_logo/"+tourId+"."+s2[s2.length-1]+"";
	System.out.println(f);
			cnt1++;
	}
	catch (Exception e)
	{
	System.out.println("Error :- "+e.getMessage());
	e.printStackTrace();
	}
	}
	}
	
try
{
	
	String title="";
	
	
	//String d1=str[5];//request.getParameter("touredate");
	//System.out.print("++"+request.getParameter("toursdate")+"  "+request.getParameter("tourage"));
	String d2[]=str[4].split("/");//request.getParameter("toursdate").split("/");
	String d22[]=str[5].split("/");//request.getParameter("touredate").split("/");
	//if(Integer.parseInt(d2[0])>=Integer.parseInt(d22[0]))
	{
		//PrintWriter out = response.getWriter();
		//out.println("<script type='text/javascript'>alert('Invalid Tournament Date');window.location.replace('addTournament.jsp');</script>");

	}
boolean flag=true;
ResultSet rs=null;
rs=DBManager.fetchQuery("select * from tournament;");
while(rs.next())
{
	if(str[0].equalsIgnoreCase(rs.getString("tourName")) || str[1].equalsIgnoreCase("tourTitle"))
	flag=false;
}
if(flag)
{

//String d[]=str[1].split("/");

if(str[1]==null)
	 title="";
int r=DB.insert("insert into tournament values("+tourId+",'"+str[0].toUpperCase()+"','"+title+"','"+str[2].toUpperCase()+"','"+str[3].toUpperCase()+"','"+str[4]+"','"+str[5]+"','"+str[6]+"','"+f+"','0')");
//System.out.print("insert into tournament values("+DBManager.getMaxId("tournament", "tourId")+",'"+str[0].toUpperCase()+"','"+title+"','"+str[2].toUpperCase()+"','"+str[3].toUpperCase()+"','"+str[4]+"','"+str[5]+"','"+str[6]+"','"+f+"')");
//System.out.println("insert into team values("+tId+",'"+str[0].toUpperCase()+"','"+d[2]+"/"+d[1]+"/"+d[0]+"','"+str[2]+"','"+f+"','')");
if(r>0)
{
File savedFile = new File(f);
item.write(savedFile);

PrintWriter out = response.getWriter();
out.println("<script type='text/javascript'>alert('Tournament Added Successfully.');window.location.replace('home.jsp');</script>");
}
}
else
{
	PrintWriter out = response.getWriter();
	out.println("<script type='text/javascript'>alert('Tournament Already Added..!');window.location.replace('addTournament.jsp');</script>");

	/*response.setContentType("text/html");
	out.println("<script type=text/javascript>");
	out.println("alert('Team Already Added..!');");
	out.println("</script>");

	RequestDispatcher rd =request.getRequestDispatcher("addTeam.jsp");
	rd.forward(request, response);
*/	
}
}
catch(Exception e)
{
PrintWriter out = response.getWriter();
out.println("<script type='text/javascript'>alert('"+e.getMessage()+"');window.location.replace('addTournament.jsp');</script>");

}
finally
{
DBManager.close();	
}
	
	
	}
}

catch(Exception e)
{
	System.out.println("Error in servlet addTournamet.."+e);
	DBManager.close();
}
finally
{
	DBManager.close();
}
}
	
	
}
