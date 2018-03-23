package m_lagori;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

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

/**
 * Servlet implementation class m_addMember
 */
@WebServlet("/m_addMember")
public class m_addMember extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public m_addMember() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		try {
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			String ImageFile = "";
			String itemName = "";

			String imagepath1 = getmyPath.getmember_Path();
			String imagepath = getmyPath.getmember_Path() + "member";
			File file = new File(imagepath);
			if (!new File(imagepath1).exists()) {
				System.out.println("images with tournament");
				Runtime.getRuntime().exec("mkdir " + imagepath1);
				Runtime.getRuntime().exec("mkdir " + imagepath);
			} else {
				System.out.println("only tournament");
				if (!file.exists())
					Runtime.getRuntime().exec("mkdir " + imagepath);
			}
			
			 String date=String.valueOf((new Date().getYear()+1900));
				String year[]=date.split("20");
				
			 int b1=DBManager.getMaxId("member", "barcodeId");
			 String b=null;
			 if(b1==1)
				b = "" + year[1] + 1001;
			 else
				 b = "" + b1;
			FileItem item = null;
			String Fvalues[] = new String[100];// for form values
			int cnt = 0;
			String Bvalues[] = new String[10];// for browse values
			int cnt1 = 0;
			String f = null;
			String ext = "";

			boolean isMultipart = ServletFileUpload.isMultipartContent(request);
			if (!isMultipart) {
			} else {
				FileItemFactory factory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(factory);
				List items = null;
				try {
					items = upload.parseRequest(request);
				} catch (FileUploadException e) {
					e.getMessage();
				}

				Iterator itr = items.iterator();
				while (itr.hasNext()) {
					item = (FileItem) itr.next();
					if (item.isFormField()) {
						String name = item.getFieldName();
						String value = item.getString();
						Fvalues[cnt++] = value;
						if (name.equals("tflag")) {
							ImageFile = value;
						}

					} else {
						try {
							if (file.exists()) {
								if (file.isDirectory()) {
									Bvalues[cnt1] = item.getName();
									if(Bvalues[cnt1].lastIndexOf(".")==-1)
										ext="";
										else
									ext = Bvalues[cnt1].substring(Bvalues[cnt1].lastIndexOf("."));
									f = imagepath + "/" + Fvalues[0].toUpperCase()+"_"+Fvalues[2].toUpperCase() + ext;
									// File savedFile = new File(f);
									// item.write(savedFile);
									// System.out.println("-------------------file
									// not FOund");
								}
							}

							cnt1++;

						} catch (Exception e) {
							System.out.println("Error :- " + e.getMessage());
							e.printStackTrace();
						}
					}
				}

			}
			try {
				
				if(Fvalues[1]==null)
				Fvalues[1]="";
				if(Fvalues[3].equalsIgnoreCase("") || Fvalues[3]==null)
				Fvalues[3]="0000-00-00";
				
			int r= DB.insert("insert into member values("+Integer.parseInt(b)+",'"+Fvalues[0]+"','"+Fvalues[1]+"','"+Fvalues[2]+"','"+Fvalues[3]+"','"+Fvalues[4]+"','"+f+"','','Player')");
			if(r>0)
			{
				File savedFile = new File(f);
				item.write(savedFile);
			
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Data Added Successfully.');window.location.replace('lagori_mobile/m_addMember.jsp');</script>");
				
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("<script type='text/javascript'>alert('Data Cannot Added');window.location.replace('lagori_mobile/m_addMember.jsp');</script>");
				
			}
			} catch (Exception e) {
				System.out.println("Error in servlet isert addTournamet.." + e);
				DBManager.close();
			}

		}

		catch (Exception e) {
			System.out.println("Error in servlet addTournamet.." + e);
			DBManager.close();
		} 
	}

}
