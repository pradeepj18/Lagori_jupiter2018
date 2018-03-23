package lagori_cls;


import java.io.IOException;

import java.io.PrintWriter;
import java.util.Date;
import java.text.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lg_DBManager.DBManager;

import java.sql.*;
/**
 * Servlet implementation class wclots
 */
@WebServlet("/wclots")
public class wclots extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public wclots() {
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
		
		//int tourId=Integer.parseInt(request.getParameter("tourId"));
		
		final int MAX=500;
		int mcount=0;
		int mpool[]=new int[MAX];
		int mmid[]=new int[MAX];
		String mmdate[]=new String[MAX],mmtid1[]=new String[MAX],mmtid2[]=new String[MAX],mmtime[]=new String[MAX];

		
		try
		{
			int tourId = Integer.parseInt(request.getParameter("tourId"));
			String gen=request.getParameter("gen");
			
				DBManager.loadDriver();
				DBManager DB = new DBManager();
				ResultSet rs = null,rs1 = null;
				String pname[] = new String[10];
				//String gen = "M";
				String mtype="league";
				
				Date dnow=new Date();
				SimpleDateFormat yy=new SimpleDateFormat("yyyy-MM-dd");
				String mdate=yy.format(dnow);
				String mtime="00:00:00";
				int year=2020;
				int pcount[] = new int[64];
				int pcount1=0;
				int tid = DBManager.getMaxId("tourTeam","ttId");
				int mid = DBManager.getMaxId("wmatch1", "mid");
				int pid = DBManager.getMaxId("tourPool","poolId");
				boolean flag=true,lflag=false;
				ResultSet r=null;
				r=DBManager.fetchQuery("select tourId from wmatch1 where gender='"+gen+"' group by tourId;");
				while(r.next())
				{
					if(tourId==r.getInt("tourId"))
						flag=false;
				}
				if(flag)
				{
				//rs = DBManager.fetchQuery("select count(pname) as pcount,pname from tourPool tp,tourTeam tt where tp.ttid=tt.tId and tp.tpgender='"+gen+"' and tt.tourId="+tourId+" group by(pname);");
				rs=DBManager.fetchQuery("select count(pname) as pcount,pname from tourPool where tourId="+tourId+" and tpGender='"+gen+"' group by(pname);");
				while(rs.next())
				{
					pname[pcount1] = rs.getString("pname");
					pcount[pcount1] = rs.getInt("pcount");
					pcount1 = pcount1+1;	
				}
				
				int a[][] = new int[10][2];
				int i=0,j=0,k=0,dp,dp2=0,m=0;
				while(k < pcount1)
				{
					System.out.println(k+"---"+pcount[k]);
					if(pcount[k]%2 != 0)
					{
						int tid1 = DBManager.getMaxId("tourTeam","ttId",Integer.toString(tourId));
						int pid1 = DBManager.getMaxId("tourPool","poolId",Integer.toString(tourId));
						int tid2 = DBManager.getMaxId("team","tId");
						
						DB.insert("insert into team(tId,tName) values("+tid2+",'Dummy"+k+"')");
					//	System.out.println("insert into team(tId,tName) values("+tid2+",'Dummy"+k+"')");
						DB.insert("insert into tourTeam values("+tid1+",'"+gen+"',"+tourId+","+tid2+");");
					//	System.out.println("insert into tourTeam values("+tid1+",'"+gen+"',"+tourId+","+tid2+");");
						DB.insert("insert into tourPool values("+pid1+","+(k+1)+","+tid1+",'"+gen+"',"+tourId+")");
					//	System.out.println("insert into tourPool values("+pid1+","+(k+1)+","+tid1+",'"+gen+"',"+tourId+")");
						pcount[k] = pcount[k]+1;
						
					}
					//rs1 = DBManager.fetchQuery("select tt.tId from tourPool tp,tourTeam tt where tt.tId=tp.ttId and tp.pname="+pname[k]+" and tp.tpgender='"+gen+"' and tt.tourId="+tourId+";");
					rs1=DBManager.fetchQuery("select ttId from tourPool tp where tp.pname="+pname[k]+" and tp.tpgender='"+gen+"' and tourId="+tourId+";");
					for(i = 0;i < pcount[k];i++)
					{
						for(j = 0;j < 2;j++)
						{
							if(rs1.next())
							{
								a[i][j] = rs1.getInt(1);
							
							}
						}
					}
					for(i = 0;i < pcount[k]/2;i++)	
					{
						mid = DBManager.getMaxId("wmatch1", "mid",Integer.toString(tourId));
						DB.insert("insert into wmatch1 values('"+ mid + "','"+mdate+"','" + a[i][0] + "','"+ a[i][1] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
					}
					
					dp = a[0][1];
					m = pcount[k];
					for(int kk = 1;kk < pcount[k]-1;kk++)
					{
						for(i = 1;i < pcount[k];i++)
						{
							if(i < pcount[k]/2)
							{
								 dp2 = a[i][1];
	                             a[i][1] = dp;
	                             dp = dp2;

							}
							else if((m-i-1) > 0)
							{
								  dp2 = a[m-i-1][0];
	                              a[m-i-1][0] = dp;
	                              dp = dp2;
							}
							else
							{
								 a[0][1] = dp;
							}
						}
						for(i = 0;i < (pcount[k]/2);i++)
						{
							mid = DBManager.getMaxId("wmatch1", "mid",Integer.toString(tourId));
							DB.insert("insert into wmatch1 values('"+ mid + "','"+mdate+"','" + a[i][0] + "','"+ a[i][1] + "','" + (k+1) + "','"+mtime+"','"+gen+"','"+mtype+"',"+tourId+");");
						}
					}
					
					DB.insert("delete from team where tName like '%Dummy%';");
					k++;
					lflag=true;
				}
				//PrintWriter out = response.getWriter();
				//out.println("<script type='text/javascript'>alert('Lots Generated');window.location.replace('wclots.jsp');</script>");
					
				}
				else
				{
					PrintWriter out = response.getWriter();
					out.println("<script type='text/javascript'>alert('Lots Already Generated');window.location.replace('wclots.jsp');</script>");
						
				}
				rs=null;
				rs=DBManager.fetchQuery("select * from wmatch where tourId="+tourId+" and gender='"+gen+"'");
				if(rs.next())
					lflag=false;
				else
					lflag=true;
		if(lflag)
		{
			System.out.println("++++++");
		rs=null;
		int poolCount = 0;
		int teamCount=0;
		int pcnt[]=new int[MAX];
		
		rs = DBManager.fetchQuery("select count(pool),pool from wmatch1 where tourId="+tourId+" and gender='"+gen+"' group by pool;");
		while(rs.next())
		{
			teamCount+=rs.getInt("count(pool)");
			pcnt[poolCount]=rs.getInt("pool");
			poolCount++;
		}
		rs=DBManager.fetchQuery("select day(mdate),monthname(mdate),year(mdate) from wmatch1 where gender='"+gen+"' and tourId="+tourId+";");
		ResultSet[] rss=new ResultSet[poolCount];
		//ResultSet[] rss1=new ResultSet[poolCount];
		for(int i=0;i<poolCount;i++)
		{
		//	rss[i]=DBManager.fetchQuery("select mid,(select tname from team where tid=tid1) as tid1,(select tname from team where tid=tid2) as tid2,mtime,mtype,(select tgender from team where tid=tid1) as gender,pool,tid1,tid2,mdate,gender from wmatch1 where pool="+pcnt[i]+" and gender='"+gen+"'");
			rss[i]=DBManager.fetchQuery("select * from wmatch1 where pool="+pcnt[i]+" and tourId="+tourId+" and gender='"+gen+"';");
		}
		int k=0,r1=0;
		for(int i=0;i<teamCount;i++)
		{
			for(int j=0;j<poolCount;j++)
			{
				if(rss[j].next() )
				{ 
			//		out.println("<tr><td><center><div class='t'>"+(k+1)+"</td><td><center><div class='t'><a title='Click to see Player list' href=teamdetail.jsp?tid="+rss[j].getInt(8)+" style='text-decoration:none;' target='blank'>"+rss[j].getString(2)+"</a></div></center></td><td><center><div class='t'><a title='Click to see Player list' href=teamdetail.jsp?tid="+rss[j].getInt(9)+" style='text-decoration:none;' target='blank'>"+rss[j].getString(3)+"</a></div></center></td><td>"+rss[j].getString(4)+"</td><td align=center>"+rss[j].getString(5)+"</td><td align=center>"+rss[j].getString(6)+"</td></tr></div></center>");
				//	add1( k ,rss[j].getString("mdate"), rss[j].getString(8) , rss[j].getString(9) ,(j+1) ,rss[j].getString("mtime"),rss[j].getString("mtype"),rss[j].getString("gender"));	

				//r1=DB.insert("insert into wmatch values('"+ (k+1) + "','"+rss[j].getString("mdate")+"','" + rss[j].getString("tid1") + "','"+ rss[j].getString("tid2") + "','" + (j+1) + "','"+rss[j].getString("mtime")+"','"+rss[j].getString("gender")+"','"+rss[j].getString("mtype")+"',"+tourId+");");
					mmid[mcount]=(k+1);
					mmdate[mcount]=rss[j].getString("mdate");
					mmtid1[mcount]=rss[j].getString("tid1");
					mmtid2[mcount]=rss[j].getString("tid2");
					mpool[mcount]=(j+1);
					mmtime[mcount]=rss[j].getString("mtime");
					mcount++;
					k=k+1;
				}
			}
		}
		int tcount=0;
		rs=DBManager.fetchQuery("select count(*) as tcount from wmatch1 where tourId="+tourId+" and gender='"+gen+"';");
		if(rs.next())
			tcount=rs.getInt("tcount");
		for(int i=0;i<tcount;i++)
		{
			r1=DB.insert("insert into wmatch values('"+ (i+1) + "','"+mmdate[i]+"','" + mmtid1[i] + "','"+ mmtid2[i] + "','" + mpool[i] + "','"+mmtime[i]+"','"+gen+"','league',"+tourId+",'0');");
		}
		System.out.println(r1+"+++"+tcount);
		if(r1>0)
		{
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('Match Schedule Generated');window.location.replace('wclots.jsp');</script>");
		}
		else
		{
		//	DB.insert("delete from wmatch where tourId="+tourId+" and gender='"+gen+"'");
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('MatchSchedule Can't Generated');window.location.replace('wclots.jsp');</script>");
		}
		}
		else
		{
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('Lots Can't Generated');window.location.replace('wclots.jsp');</script>");
				
		}
		}
		catch(Exception e)
		{
			PrintWriter out = response.getWriter();
			out.println("<script type='text/javascript'>alert('Error : '"+e+");window.location.replace('wclots.jsp');</script>");
			
		}
	
	}

}
