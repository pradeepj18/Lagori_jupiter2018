<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
$(document).ready(function(){
	

$('#f_row_s_col').carousel({
	interval : 5000,
	pause : "false"
});

$('#f_row_t_col').carousel({
	interval : 3000,
	pause : "false"
});
$('#s_row_f_col').carousel({
	interval : 6000,
	pause : "false"
});
$('#s_row_s_col').carousel({
	interval : 5000,
	pause : "false"
});
$('#s_row_t_col').carousel({
	interval : 6000,
	pause : "false"
});
$('#s_row_fr_col').carousel({
	interval : 4000,
	pause : "false"
});
$('#t_row_f_col').carousel({
	interval : 5000,
	pause : "false"
});
$('#t_row_s_col').carousel({
	interval : 6000,
	pause : "false"
});
$('#t_row_t_col').carousel({
	interval : 3000,
	pause : "false"
});
$('#t_row_fr_col').carousel({
	interval : 7000,
	pause : "false"
});
});
</script>
</head>

<body>
	<%try{
		//System.out.println("m_home1");
	DBManager.loadDriver();
	int tourId=Integer.parseInt(request.getParameter("tourId"));
	ResultSet rs=null;
	%>
		<div class="row">
			<div class="col-xs-12 col-sm-12 col-md-12">
				<div class="row">
					<div class="col-xs-12 col-sm-12 col-md-6 first_row">
						<div id="f_row_f_col" class="carousel slide" data-ride="carousel">
							<div class="carousel-inner ci_col_first">
								<div class="item active">
								<%rs=null;
								rs=DBManager.fetchQuery("select tourName,tourVenue,ucase(DATE_FORMAT(tourSDate,'%d %b %y')) as sday,ucase(DATE_FORMAT(tourEDate,'%d %b %y')) as eday from tournament where tourId="+tourId+"");
								if(rs.next())
								{
									
								%>
									<img alt="imgage" src="../images/extra/home_carousel.jpg"
										style="width: 100%; height: 170px;opacity: 0.3;">
										<span class="carousel-title"><%if(rs.getString("tourName")==null || rs.getString("tourName").equalsIgnoreCase("")){%><%}else{%><%=rs.getString("tourName").toUpperCase() %>,<%} %><br>
										<span><%if(rs.getString("tourVenue")==null || rs.getString("tourVenue").equalsIgnoreCase("")){%><%}else{%><%=rs.getString("tourVenue").toUpperCase() %>,<%} %></span><br>
										<span ><%if(rs.getString("sday")==null && rs.getString("eday")==null){}else{%><%=rs.getString("sday").toUpperCase() %>&nbsp;to&nbsp;<%=rs.getString("eday").toUpperCase() %><%} %></span></span>
								<%}else{
									%>
									<img alt="imgage" src="../images/extra/home_carousel.jpg"
										style="width: 100%; height: 170px;opacity: 0.3;">
									<%
									
								} %>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="f_row_s_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#f_row_s_col" data-slide-to="0" class="active"></li>
								<li data-target="#f_row_s_col" data-slide-to="1"></li>
								<li data-target="#f_row_s_col" data-slide-to="2"></li>
							</ol>

							<div class="carousel-inner ci_col_sec">

								<div class="item active f_row_s_col_css">
									<span class="carousel-title"> Total Hit </span> <span
										class="carousel-data"> <%
                rs = DBManager.fetchQuery("select tourId,tourVenue,max(tourEDate) from tournament where tourId="+tourId+";");
          
                String venue = "";
                if(rs.next())
                {
               	
               	 venue = rs.getString("tourVenue");
                }
              	 rs = null;
                 rs = DBManager.fetchQuery("select count(hno) as hit from tourHit where tourId="+tourId);
                 if(rs.next()){
                %> <%=rs.getInt("hit") %> <%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item f_row_s_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> <%rs = null;
                  rs = DBManager.fetchQuery("select count(mno) as miss from tourMiss where tourId="+tourId);
                  if(rs.next()){
                %> <%=rs.getInt("miss") %> <%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item f_row_s_col_css">
									<span class="carousel-title"> Total Golden </span> <span
										class="carousel-data"> <%rs = null;
                 rs = DBManager.fetchQuery("select count(rno) as golden from tourRestore where rtype='6' and tourId="+tourId);
                 if(rs.next()){
               %><%=rs.getInt("golden") %> <%}else {%>0<%} %>
									</span>
								</div>

							</div>

						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="f_row_t_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#f_row_t_col" data-slide-to="0" class="active"></li>
								<li data-target="#f_row_t_col" data-slide-to="1"></li>
								<li data-target="#f_row_t_col" data-slide-to="2"></li>
							</ol>

							<div class="carousel-inner ci_col_third slide_r1c4">

								<div class="item active f_row_t_col_css">
									<span class="carousel-title"> Total Team </span> <span
										class="carousel-data"> <%rs = null;
                rs = DBManager.fetchQuery("select count(ttId) as team from tourTeam where tourId="+tourId);
                if(rs.next()){
              %> <%=rs.getInt("team") %> <%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item f_row_t_col_css">
									<span class="carousel-title"> Total Player </span> <span
										class="carousel-data"> <%rs = null;
                rs = DBManager.fetchQuery("select count(tpId) as player from tourPlayer where tourId="+tourId);
                if(rs.next()){
              %> <%=rs.getInt("player") %> <%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item f_row_t_col_css">
									<span class="carousel-title"> Total Official </span> <span
										class="carousel-data"> <%rs = null;
                 rs = DBManager.fetchQuery("select count(toId) as tourofficial from tourOfficial where  tourId="+tourId);
                 if(rs.next()){
               %><%=rs.getInt("tourOfficial") %> <%}else {%>0<%} %>

									</span>
								</div>
							</div>

						</div>
					</div>
				</div>
				<!-- ------------------SECOND ROW-------------------- -->
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="s_row_f_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#s_row_f_col" data-slide-to="0" class="active"></li>
								<li data-target="#s_row_f_col" data-slide-to="1"></li>
								<li data-target="#s_row_f_col" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner ci_col_first slide_r2c1">

								<div class="item active s_row_f_col_css">
									<span class="carousel-title"> Total Match </span> <span
										class="carousel-data"> <%rs = null;
                 rs = DBManager.fetchQuery("select count(mid) as mid from wmatch where  tourId="+tourId);
                 if(rs.next()){%> <%=rs.getInt("mid") %> <%}else{ %>0<%} %>

									</span>
								</div>
								<div class="item s_row_f_col_css">
									<span class="carousel-title"> Total Score </span> <span
										class="carousel-data"> <%rs = null;
                 rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where  tourId="+tourId);
                 if(rs.next()){%> <%=rs.getInt("score") %> <%}else{ %>0<%} %>

									</span>
								</div>
								<div class="item s_row_f_col_css">
									<span class="carousel-title"> Total Wicket </span> <span
										class="carousel-data"> <%rs = null;
                 rs = DBManager.fetchQuery("select count(wno) as wicket from tourWicket where  tourId="+tourId);
                 if(rs.next()){%> <%=rs.getInt("wicket") %> <%}else{ %>0<%} %>
									</span>
								</div>
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="s_row_s_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#s_row_s_col" data-slide-to="0" class="active"></li>
								<li data-target="#s_row_s_col" data-slide-to="1"></li>
								<!-- <li data-target="#s_row_s_col" data-slide-to="2"></li> -->
							</ol>

							<div class="carousel-inner ci_col_sec slide_r2c2">

								<div class="item active s_row_s_col_css">
									<span class="carousel-title"> Highest Team Score </span> <span
										class="carousel-data"> <%
              rs = null;
                rs = DBManager.fetchQuery("select tr.ttId,(select tName from team t,tourTeam tt where t.tId = tt.tId and tr.ttId=tt.ttId and tourId="+tourId+") as name,sum(score) as score from tourRestore tr,tourTeam tt where tr.ttId = tt.ttId and tt.ttGender='F' and tt.tourId= tr.tourId and tr.tourId="+tourId+" group by tr.ttId order by score desc limit 1;");
                if(rs.next())
                {
              %> <%=rs.getInt("score") %> <span style="font-size: 15px;"><%=rs.getString("name").toUpperCase() %>&nbsp;[F]</span>
										<%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item s_row_s_col_css">
									<span class="carousel-title"> Highest Individual Score </span>
									<span class="carousel-data"> <%
             	rs = null;
             	rs = DBManager.fetchQuery("select (select ucase(fName) as fName from member m where m.barcodeId=tr.barcodeId) as name,sum(score) as score from tourRestore tr,tourTeam tt where tt.ttId=tr.ttId and tt.ttGender='F' and tr.tourId="+tourId+" group by barcodeId;");
             	if(rs.next()){
             %> <%=rs.getString("score") %> <span
										style="font-size: 15px;"><%=rs.getString("name").toUpperCase() %></span> <%} %>
									</span>
								</div>
								<!-- <div class="item s_row_s_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div> 
								 -->
							</div>

						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="s_row_t_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#s_row_t_col" data-slide-to="0" class="active"></li>
								<!-- <li data-target="#s_row_t_col" data-slide-to="1"></li>
								<li data-target="#s_row_t_col" data-slide-to="2"></li> -->
							</ol>

							<div class="carousel-inner ci_col_third1 slide_r2c3">

								<div class="item active s_row_t_col_css">
									<span class="carousel-title"> Best Lagori Breaker </span> <span
										class="carousel-data"> <%
               		rs = null;
               		rs = DBManager.fetchQuery("select (select fName from member m where m.barcodeId= th.barcodeId) as name,count(barcodeId) as hit from tourHit th,print_match w where th.mid=w.mid and w.gender='F' and th.tourId="+tourId+"  group by barcodeId order by hit desc limit 1;");
               		if(rs.next()){
               %> <%=rs.getInt("hit") %> <span style="font-size: 15px;"><%=rs.getString("name").toUpperCase() %></span>
										<%} %>
									</span>
								</div>
								<!-- <div class="item s_row_t_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>
								<div class="item s_row_t_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  -->
							</div>

						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="s_row_fr_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#s_row_fr_col" data-slide-to="0" class="active"></li>
								<li data-target="#s_row_fr_col" data-slide-to="1"></li>
								<!-- <li data-target="#s_row_fr_col" data-slide-to="2"></li> -->
							</ol>

							<div class="carousel-inner ci_col_fourth slide_r2c4">

								<div class="item active s_row_fr_col_css">
									<span class="carousel-title"> Winner[F] </span> <span
										class="carousel-data"> <%
              rs = null;
										String won = "";
										String photo="";
                rs = DBManager.fetchQuery("select mid,(select SUBSTRING_INDEX(tFlag,'/',-3) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as photo1,tid1,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as tname1,(select SUBSTRING_INDEX(tFlag,'/',-3) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as photo2,tid2,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as tname2 from print_match pm where mtype='final' and gender='F' and tourId="+tourId+";");
                if(rs.next())
                {
                	ResultSet rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='1'");
					ResultSet rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='2'");
					ResultSet rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='3'");
					ResultSet rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='4'");
					ResultSet rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='5'");
					ResultSet rsscore6 = DBManager
							.fetchQuery("select count(rno) as score from tourRestore where mid=" + rs.getInt("mid")
									+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='6'");

					ResultSet rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='1'");
					ResultSet rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='2'");
					ResultSet rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='3'");
					ResultSet rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='4'");
					ResultSet rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='5'");

					int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

					for (int iii = 0; iii < 12; iii++) {
						if (rsscore1.next())
							count1 = count1 + rsscore1.getInt("score");
						if (rsscore2.next())
							count2 = count2 + rsscore2.getInt("score");
						if (rsscore3.next())
							count3 = count3 + rsscore3.getInt("score");
						if (rsscore4.next())
							count4 = count4 + rsscore4.getInt("score");
						if (rsscore5.next())
							count5 = count5 + rsscore5.getInt("score");

					}

					if (rswicket1.next()) {
						count1 = count1 - (rswicket1.getInt("count(wno)") * 5);
						if (count1 < 0) {
							count1 = 0;
						}
						rswicket1.beforeFirst();
					}
					if (rswicket2.next()) {
						count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
						if (count2 < 0) {
							count2 = 0;
						}
						rswicket2.beforeFirst();
					}
					if (rswicket3.next()) {
						count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
						if (count3 < 0) {
							count3 = 0;
						}
						rswicket3.beforeFirst();
					}
					if (rswicket4.next()) {
						count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
						if (count4 < 0) {
							count4 = 0;
						}
						rswicket4.beforeFirst();
					}
					if (rswicket5.next()) {
						count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
						if (count5 < 0) {
							count5 = 0;
						}
						rswicket5.beforeFirst();
					}
					int golden1 = 0;
					if (rsscore6.next()) {
						golden1 = rsscore6.getInt("score");
					}

					rsscore1 = null;
					rsscore2 = null;
					rsscore3 = null;
					rsscore4 = null;
					rsscore5 = null;
					rsscore6 = null;
					rswicket1 = null;
					rswicket2 = null;
					rswicket3 = null;
					rswicket4 = null;
					rswicket5 = null;
					rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='1'");
					rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='2'");
					rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='3'");
					rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='4'");
					rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='5'");
					rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='6'");

					rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='1'");
					rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='2'");
					rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='3'");
					rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='4'");
					rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='5'");

					int countB1 = 0, countB2 = 0, countB3 = 0, countB4 = 0, countB5 = 0;
					for (int ii = 0; ii < 12; ii++) {
						if (rsscore1.next()) {
							countB1 = countB1 + rsscore1.getInt("score");
						}
						if (rsscore2.next()) {
							countB2 = countB2 + rsscore2.getInt("score");
						}
						if (rsscore3.next()) {
							countB3 = countB3 + rsscore3.getInt("score");
						}
						if (rsscore4.next()) {
							countB4 = countB4 + rsscore4.getInt("score");
						}
						if (rsscore5.next()) {
							countB5 = countB5 + rsscore5.getInt("score");
						}
					}
					rsscore1.beforeFirst();
					rsscore2.beforeFirst();
					rsscore3.beforeFirst();
					rsscore4.beforeFirst();
					rsscore5.beforeFirst();
					if (rswicket1.next()) {
						countB1 = countB1 - (rswicket1.getInt("count(wno)") * 5);
						if (countB1 < 0) {
							countB1 = 0;
						}
						rswicket1.beforeFirst();
					}
					if (rswicket2.next()) {
						countB2 = countB2 - (rswicket2.getInt("count(wno)") * 5);
						if (countB2 < 0) {
							countB2 = 0;
						}
						rswicket2.beforeFirst();
					}
					if (rswicket3.next()) {
						countB3 = countB3 - (rswicket3.getInt("count(wno)") * 5);
						if (countB3 < 0) {
							countB3 = 0;
						}
						rswicket3.beforeFirst();
					}
					if (rswicket4.next()) {
						countB4 = countB4 - (rswicket4.getInt("count(wno)") * 5);
						if (countB4 < 0) {
							countB4 = 0;
						}
						rswicket4.beforeFirst();
					}
					if (rswicket5.next()) {
						countB5 = countB5 - (rswicket5.getInt("count(wno)") * 5);
						if (count5 < 0) {
							countB5 = 0;
						}
						rswicket5.beforeFirst();
					}
					int setwonA = 0, setwonB = 0;
					if (count1 > countB1) {
						setwonA = setwonA + 1;
					} else if (count1 < countB1) {
						setwonB = setwonB + 1;
					}
					if (count2 > countB2) {
						setwonA = setwonA + 1;
					} else if (count2 < countB2) {
						setwonB = setwonB + 1;
					}
					if (count3 > countB3) {
						setwonA = setwonA + 1;
					} else if (count3 < countB3) {
						setwonB = setwonB + 1;
					}
					if (count4 > countB4) {
						setwonA = setwonA + 1;
					} else if (count4 < countB4) {
						setwonB = setwonB + 1;
					}
					if (count5 > countB5) {
						setwonA = setwonA + 1;
					} else if (count5 < countB5) {
						setwonB = setwonB + 1;
					}

					//GOLDEN HIT FOR TEAM 2
					int golden2 = 0;
					if (rsscore6.next()) {
						golden2 = rsscore6.getInt("score");
					}

					
					
					if (setwonA > setwonB) {
						won = rs.getString("tname1");
						photo=rs.getString("photo1");
					} else if (setwonA < setwonB) {
						won = rs.getString("tname2");
						photo=rs.getString("photo2");
					} else {
						if (golden1 > golden2) {
							won = rs.getString("tname1");
							photo=rs.getString("photo1");
						} else if (golden1 < golden2) {
							won = rs.getString("tname2");
							photo=rs.getString("photo2");
						} else {
							won = "DRAW";
							photo="";
						}
					}
	%> <%=won%> <%}else{ %>Not Found<%} %>
									</span>
								</div>
								<div class="item s_row_fr_col_css">
									<img alt="<%=won.toUpperCase() %>" src="../<%=photo%>">	
								</div>
								<!-- <div class="item s_row_fr_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  --> 
							</div>

						</div>
					</div>
				</div>
				<!-- ---------------THRID ROW---------------------------- -->
				<%try{ %>
				<div class="row">
					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="t_row_f_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#t_row_f_col" data-slide-to="0" class="active"></li>
								<li data-target="#t_row_f_col" data-slide-to="1"></li>
								<!-- <li data-target="#t_row_f_col" data-slide-to="2"></li> -->
							</ol>
							<div class="carousel-inner ci_col_first slide_r3c1">

								<div class="item active s_row_s_col_css">
									<span class="carousel-title"> Highest Team Score </span> <span
										class="carousel-data"> <%
              	rs = null;
                rs = DBManager.fetchQuery("select tr.ttId,(select tName from team t,tourTeam tt where t.tId = tt.tId and tr.ttId=tt.ttId and tourId="+tourId+") as name,sum(score) as score from tourRestore tr,tourTeam tt where tr.ttId = tt.ttId and tt.ttGender='M' and tt.tourId= tr.tourId and tr.tourId="+tourId+" group by tr.ttId order by score desc limit 1;");
                if(rs.next())
                {
              %> <%=rs.getInt("score") %> <span style="font-size: 15px;"><%=rs.getString("name").toUpperCase() %>&nbsp;[M]</span>
										<%}else{ %>0<%} %>
									</span>
								</div>
								<div class="item s_row_s_col_css">
									<span class="carousel-title"> Highest Individual </span> <span
										class="carousel-data"> <%
             	rs = null;
             	rs = DBManager.fetchQuery("select (select ucase(fName) as fName from member m where m.barcodeId=tr.barcodeId) as name,sum(score) as score from tourRestore tr,tourTeam tt where tt.ttId=tr.ttId and tt.ttGender='M' and tr.tourId="+tourId+" group by barcodeId;");
             	if(rs.next()){
             %> <%=rs.getString("score") %> <span
										style="font-size: 15px;"><%=rs.getString("name").toUpperCase() %></span> <%} %>
									</span>
								</div>
								<!-- <div class="item s_row_s_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  -->
							</div>
						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="t_row_s_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#t_row_s_col" data-slide-to="0" class="active"></li>
								<li data-target="#t_row_s_col" data-slide-to="1"></li>
								<li data-target="#t_row_s_col" data-slide-to="2"></li>
							</ol>

							<div class="carousel-inner ci_col_sec slide_r3c2">

								<div class="item active s_row_f_col_css">
									<span class="carousel-title"> Best Lagori Breaker </span> <span
										class="carousel-data"> <%
               		rs = null;
               		rs = DBManager.fetchQuery("select (select fName from member m where m.barcodeId= th.barcodeId) as name,count(barcodeId) as hit from tourHit th,wmatch w where th.mid=w.mid and w.gender='M' and th.tourId="+tourId+"  group by barcodeId order by hit desc limit 1;");
               		if(rs.next()){
               %> <%=rs.getInt("hit") %> <span style="font-size: 11px;"><%=rs.getString("name").toUpperCase() %></span>
										<%} %>
									</span>
								</div>
								<!-- <div class="item s_row_f_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>
								<div class="item s_row_f_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  -->

							</div>

						</div>
					</div>

					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="t_row_t_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#t_row_t_col" data-slide-to="0" class="active"></li>
								 <li data-target="#t_row_t_col" data-slide-to="1"></li>
								<!--<li data-target="#t_row_t_col" data-slide-to="2"></li> -->
							</ol>

							<div class="carousel-inner ci_col_third1 slide_r3c3">

								<div class="item active f_row_t_col_css">
									<span class="carousel-title"> Winner [M] </span> <span
										class="carousel-data"> <%
            
				photo="";won="";				
				rs = null;
                rs = DBManager.fetchQuery("select mid,(select SUBSTRING_INDEX(tFlag,'/',-3) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as photo1,tid1,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as tname1,(select SUBSTRING_INDEX(tFlag,'/',-3) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as photo2,tid2,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as tname2 from print_match pm where mtype='final' and gender='M' and tourId="+tourId+";");
                if(rs.next())
                {
                	ResultSet rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='1'");
					ResultSet rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='2'");
					ResultSet rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='3'");
					ResultSet rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='4'");
					ResultSet rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='5'");
					ResultSet rsscore6 = DBManager
							.fetchQuery("select count(rno) as score from tourRestore where mid=" + rs.getInt("mid")
									+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid1") + " and rtype='6'");

					ResultSet rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='1'");
					ResultSet rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='2'");
					ResultSet rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='3'");
					ResultSet rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='4'");
					ResultSet rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and turn=" + rs.getInt("tid1") + " and wtype='5'");

					int count1 = 0, count2 = 0, count3 = 0, count4 = 0, count5 = 0;

					for (int iii = 0; iii < 12; iii++) {
						if (rsscore1.next())
							count1 = count1 + rsscore1.getInt("score");
						if (rsscore2.next())
							count2 = count2 + rsscore2.getInt("score");
						if (rsscore3.next())
							count3 = count3 + rsscore3.getInt("score");
						if (rsscore4.next())
							count4 = count4 + rsscore4.getInt("score");
						if (rsscore5.next())
							count5 = count5 + rsscore5.getInt("score");

					}

					if (rswicket1.next()) {
						count1 = count1 - (rswicket1.getInt("count(wno)") * 5);
						if (count1 < 0) {
							count1 = 0;
						}
						rswicket1.beforeFirst();
					}
					if (rswicket2.next()) {
						count2 = count2 - (rswicket2.getInt("count(wno)") * 5);
						if (count2 < 0) {
							count2 = 0;
						}
						rswicket2.beforeFirst();
					}
					if (rswicket3.next()) {
						count3 = count3 - (rswicket3.getInt("count(wno)") * 5);
						if (count3 < 0) {
							count3 = 0;
						}
						rswicket3.beforeFirst();
					}
					if (rswicket4.next()) {
						count4 = count4 - (rswicket4.getInt("count(wno)") * 5);
						if (count4 < 0) {
							count4 = 0;
						}
						rswicket4.beforeFirst();
					}
					if (rswicket5.next()) {
						count5 = count5 - (rswicket5.getInt("count(wno)") * 5);
						if (count5 < 0) {
							count5 = 0;
						}
						rswicket5.beforeFirst();
					}
					int golden1 = 0;
					if (rsscore6.next()) {
						golden1 = rsscore6.getInt("score");
					}

					rsscore1 = null;
					rsscore2 = null;
					rsscore3 = null;
					rsscore4 = null;
					rsscore5 = null;
					rsscore6 = null;
					rswicket1 = null;
					rswicket2 = null;
					rswicket3 = null;
					rswicket4 = null;
					rswicket5 = null;
					rsscore1 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='1'");
					rsscore2 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='2'");
					rsscore3 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='3'");
					rsscore4 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='4'");
					rsscore5 = DBManager.fetchQuery("select score from tourRestore where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='5'");
					rsscore6 = DBManager.fetchQuery("select count(rno) as score from tourRestore where mid="
							+ rs.getInt("mid") + " and tourId=" + tourId + " and ttId=" + rs.getInt("tid2") + " and rtype='6'");

					rswicket1 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='1'");
					rswicket2 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='2'");
					rswicket3 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='3'");
					rswicket4 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='4'");
					rswicket5 = DBManager.fetchQuery("select count(wno) from tourWicket where mid=" + rs.getInt("mid")
							+ " and tourId=" + tourId + " and turn=" + rs.getInt("tid2") + " and wtype='5'");

					int countB1 = 0, countB2 = 0, countB3 = 0, countB4 = 0, countB5 = 0;
					for (int ii = 0; ii < 12; ii++) {
						if (rsscore1.next()) {
							countB1 = countB1 + rsscore1.getInt("score");
						}
						if (rsscore2.next()) {
							countB2 = countB2 + rsscore2.getInt("score");
						}
						if (rsscore3.next()) {
							countB3 = countB3 + rsscore3.getInt("score");
						}
						if (rsscore4.next()) {
							countB4 = countB4 + rsscore4.getInt("score");
						}
						if (rsscore5.next()) {
							countB5 = countB5 + rsscore5.getInt("score");
						}
					}
					rsscore1.beforeFirst();
					rsscore2.beforeFirst();
					rsscore3.beforeFirst();
					rsscore4.beforeFirst();
					rsscore5.beforeFirst();
					if (rswicket1.next()) {
						countB1 = countB1 - (rswicket1.getInt("count(wno)") * 5);
						if (countB1 < 0) {
							countB1 = 0;
						}
						rswicket1.beforeFirst();
					}
					if (rswicket2.next()) {
						countB2 = countB2 - (rswicket2.getInt("count(wno)") * 5);
						if (countB2 < 0) {
							countB2 = 0;
						}
						rswicket2.beforeFirst();
					}
					if (rswicket3.next()) {
						countB3 = countB3 - (rswicket3.getInt("count(wno)") * 5);
						if (countB3 < 0) {
							countB3 = 0;
						}
						rswicket3.beforeFirst();
					}
					if (rswicket4.next()) {
						countB4 = countB4 - (rswicket4.getInt("count(wno)") * 5);
						if (countB4 < 0) {
							countB4 = 0;
						}
						rswicket4.beforeFirst();
					}
					if (rswicket5.next()) {
						countB5 = countB5 - (rswicket5.getInt("count(wno)") * 5);
						if (count5 < 0) {
							countB5 = 0;
						}
						rswicket5.beforeFirst();
					}
					int setwonA = 0, setwonB = 0;
					if (count1 > countB1) {
						setwonA = setwonA + 1;
					} else if (count1 < countB1) {
						setwonB = setwonB + 1;
					}
					if (count2 > countB2) {
						setwonA = setwonA + 1;
					} else if (count2 < countB2) {
						setwonB = setwonB + 1;
					}
					if (count3 > countB3) {
						setwonA = setwonA + 1;
					} else if (count3 < countB3) {
						setwonB = setwonB + 1;
					}
					if (count4 > countB4) {
						setwonA = setwonA + 1;
					} else if (count4 < countB4) {
						setwonB = setwonB + 1;
					}
					if (count5 > countB5) {
						setwonA = setwonA + 1;
					} else if (count5 < countB5) {
						setwonB = setwonB + 1;
					}

					//GOLDEN HIT FOR TEAM 2
					int golden2 = 0;
					if (rsscore6.next()) {
						golden2 = rsscore6.getInt("score");
					}

					
				
					if (setwonA > setwonB) {
						won = rs.getString("tname1");
						photo=rs.getString("photo1");
					} else if (setwonA < setwonB) {
						won = rs.getString("tname2");
						photo=rs.getString("photo2");
					} else {
						if (golden1 > golden2) {
							won = rs.getString("tname1");
							photo=rs.getString("photo1");
						} else if (golden1 < golden2) {
							won = rs.getString("tname2");
							photo=rs.getString("photo2");
						} else {
							won = "DRAW";
							photo="";
						}
					}
	%> <%=won%> <%}else{ %>Not Found<%} %>
									</span>
								</div>
								 <div class="item f_row_t_col_css">
									<div class="item s_row_fr_col_css">
									<img alt="<%=won.toUpperCase() %>" src="../<%=photo%>">	
								</div>
								</div>
								<!-- <div class="item f_row_t_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  -->
							</div>

						</div>
					</div>
					<div class="col-xs-12 col-sm-6 col-md-3 first_row">
						<div id="t_row_fr_col" class="carousel slide" data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#t_row_fr_col" data-slide-to="0" class="active"></li>
								<li data-target="#t_row_fr_col" data-slide-to="1"></li>
							<!-- 	<li data-target="#t_row_fr_col" data-slide-to="2"></li> -->
							</ol>

							<div class="carousel-inner ci_col_fourth slide_r3c4">

								<div class="item active s_row_s_col_css">
									<span class="carousel-title"> Total Matches [M] </span> <span
										class="carousel-data"> <%
              rs=null;
              rs=DBManager.fetchQuery("select count(mid) as t from wmatch where gender='M' and tourId="+tourId+";");
              if(rs.next())
              {
            	
              %><%=  rs.getInt("t") %> <%}else{%>0<%} %>
									</span>
								</div>
								<div class="item s_row_s_col_css">
									<span class="carousel-title"> Total Matches [F] </span> <span
										class="carousel-data"> <%
              rs=null;
              rs=DBManager.fetchQuery("select count(mid) as t from wmatch where gender='F' and tourId="+tourId+";");
              if(rs.next())
              {
            	
              %><%=  rs.getInt("t") %> <%}else{%>0<%} %>
									</span>
								</div>
								<!-- <div class="item s_row_s_col_css">
									<span class="carousel-title"> Total Miss </span> <span
										class="carousel-data"> 66464 </span>
								</div>  -->
							</div>

						</div>
					</div>
				</div>
<%}catch(Exception e){System.out.println("error : "+e);e.getMessage();} %>
			</div>
		</div>
	
	<% }catch(Exception e){e.getMessage();} %>
</body>
</html>