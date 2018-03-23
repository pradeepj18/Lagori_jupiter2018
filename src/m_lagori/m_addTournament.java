package m_lagori;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class m_addTournament
 */
@WebServlet("/m_addTournament")
public class m_addTournament extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public m_addTournament() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html");
		try {
			DBManager.loadDriver();
			DBManager DB = new DBManager();
			int tourId = DBManager.getMaxId("tournament", "tourId");
			String ImageFile = "";
			String itemName = "";

			String imagepath1 = getmyPath.gettour_logoPath();
			String imagepath = getmyPath.gettour_logoPath() + "tournament" + tourId;
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
									f = imagepath + "/" + "tourlogo" + tourId + ext;
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
				String title = "";
				if (Fvalues[1] == null)
					title = "";
				int r = DB.insert("insert into tournament values(" + tourId + ",'" + Fvalues[0].toUpperCase() + "','"
						+ title + "','" + Fvalues[2].toUpperCase() + "','" + Fvalues[3].toUpperCase() + "','"
						+ Fvalues[4] + "','" + Fvalues[5] + "','" + Fvalues[6] + "','" + f + "','0')");
				if (r > 0) {
					File savedFile = new File(f);
					item.write(savedFile);

					PrintWriter out = response.getWriter();
					out.println(
							"<script type='text/javascript'>alert('Tournament Added Successfully.');window.location.replace('lagori_mobile/m_home.jsp');</script>");
				}
				PrintWriter out = response.getWriter();
				out.println(
						"<script type='text/javascript'>alert('Tournament Already Added..!');window.location.replace('lagori_mobile/m_addTournament.jsp');</script>");
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
