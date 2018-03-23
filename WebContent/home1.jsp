<%@ page language="java" contentType="text/html; charset=UTF-8" import="lg_DBManager.DBManager,java.sql.*"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Lagori</title>
<meta name="viewport" content="width=device-width, initial-scale=1,user-scalable=no">
</head>
<style>
#tournamentCarousel {
	width: 100%;
	background-color:#2045a5;;
	background-size: cover;
	float: left;
	height: 170px;
	color: #fff;
	position: relative;
	overflow: hidden;
}
</style>

<body>
<%
	try
	{
		ResultSet rs = null; 
		String tourId = request.getParameter("tourId");
%>
 <div class="row">
   
   <div class="col-md-12 col-xs-12 col-sm-12">
   <!-- FIRST ROW -->
     <div class="row">
     <!-- FIRST COLUMN -->
        <div class="col-md-6 col-xs-12 col-sm-6">
           <div id="tournamentCarousel" class="carousel-slide" data-ride="carousel">
              <ol class="carousel-indicators tournament-indicator">
                <li data-target="#tournamentCarousel" data-slide-to="0" class="active"></li>
              </ol>
              
              <div class="carousel-inner">
                 <div class="item active ">
                  <!--  GROUND PLACE --> <span ><img src="images/extra/home_carousel.jpg" style="width: 100%;height: 170px;"></span> 
                 </div>
              </div>
           </div>
          
        </div>
        <!-- SECOND COLUMN -->
        <div class="col-md-3 col-xs-12 col-sm-6">
        
            <div id="totalhitmissgolden" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#totalhitmissgolden" data-slide-to="0" class="active"></li>
              <li data-target="#totalhitmissgolden" data-slide-to="1"></li>
              <li data-target="#totalhitmissgolden" data-slide-to="2"></li>
           </ol>
           
            <div class="carousel-inner totalhitmissgolden">
                <div class="item active totalhit">
                <span class="carousel-title">
                  Total Hit
                </span>
                <span class="carousel-data">
                <%
                rs = DBManager.fetchQuery("select tourId,tourVenue,max(tourEDate) from tournament where tourId="+tourId+";");
          
                String venue = "";
                if(rs.next())
                {
               	
               	 venue = rs.getString("tourVenue");
                }
              	 rs = null;
                 rs = DBManager.fetchQuery("select count(hno) as hit from tourHit where tourId="+tourId);
                 if(rs.next()){
                %>
                <%=rs.getInt("hit") %>
                <%}else{ %>0<%} %>
                </span>
                </div>
                <div class="item  totalmiss">
                <span class="carousel-title">
               Total Miss
                </span>
                <span class="carousel-data">
                <%rs = null;
                  rs = DBManager.fetchQuery("select count(mno) as miss from tourMiss where tourId="+tourId);
                  if(rs.next()){
                %>
                <%=rs.getInt("miss") %>
                <%}else{ %>0<%} %>
                </span>
                </div>
                <div class="item totalgolder">
               <span class="carousel-title">
               Total Golden
                </span>
                <span class="carousel-data">
                 <%rs = null;
                 rs = DBManager.fetchQuery("select count(rno) as golden from tourRestore where rtype='6' and tourId="+tourId);
                 if(rs.next()){
               %><%=rs.getInt("golden") %>
               <%}else {%>0<%} %>
                </span>
                </div>
             </div>
          </div>
        </div>
        <!-- THIRD COLUMN -->
        <div class="col-md-3 col-xs-12 col-sm-6">
          <div id="totalteamplayerofficial" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#totalteamplayerofficial" data-slide-to="0" class="active"></li>
              <li data-target="#totalteamplayerofficial" data-slide-to="1"></li>
              <li data-target="#totalteamplayerofficial" data-slide-to="2"></li>
           </ol>
           
            <div class="carousel-inner totalteamplayerofficial">
                <div class="item active totalteam">
              <span class="carousel-title">
                Total Team
              </span>
              <span class="carousel-data">
              <%rs = null;
                rs = DBManager.fetchQuery("select count(ttId) as team from tourTeam where tourId="+tourId);
                if(rs.next()){
              %>
                <%=rs.getInt("team") %>
               <%}else{ %>0<%} %>
              </span>
              </div>
              <div class="item totalplayer">
              <span class="carousel-title">
               Total Player 
              </span>
              <span class="carousel-data">
              <%rs = null;
                rs = DBManager.fetchQuery("select count(tpId) as player from tourPlayer where tourId="+tourId);
                if(rs.next()){
              %>
              <%=rs.getInt("player") %>
              <%}else{ %>0<%} %>
              </span>
              </div>
              <div class="item totalofficial">
              <span class="carousel-title">
              Total Official
              </span>
              <span class="carousel-data">
               <%rs = null;
                 rs = DBManager.fetchQuery("select count(toId) as tourofficial from tourOfficial where  tourId="+tourId);
                 if(rs.next()){
               %><%=rs.getInt("tourOfficial") %>
               <%}else {%>0<%} %>
              
              </span>
              </div>
            </div>
             </div>
        </div>
     </div>
   
<!--    SECOND ROW -->
   <div class="row">
      <!-- FIRST COLUMN -->
      <div class="col-md-3 col-xs-12 col-sm-6">
        <div id="totalmatchscorewicket" class="carousel slide" data-ride="carousel">
           <ol class="carousel-indicators totalmatchscorewicket-indicators">
              <li data-target="#totalmatchscorewicket" data-slide-to="0" class="active"></li>
              <li data-target="#totalmatchscorewicket" data-slide-to="1"></li>
              <li data-target="#totalmatchscorewicket" data-slide-to="2"></li>
           </ol>
           
           <div class="carousel-inner totalmatchscorewicket">
              <div class="item  totalmatch">
              <span class="carousel-title">
              Total Match
              </span>
              <span class="carousel-data">
               <%rs = null;
                 rs = DBManager.fetchQuery("select count(mid) as mid from wmatch where  tourId="+tourId);
                 if(rs.next()){%>
               <%=rs.getInt("mid") %> 	 
                 <%}else{ %>0<%} %>
              
              </span>
              </div>
              <div class="item active totalscore">
              <span class="carousel-title">
              Total Score
              </span>
              <span class="carousel-data">
               <%rs = null;
                 rs = DBManager.fetchQuery("select sum(score) as score from tourRestore where  tourId="+tourId);
                 if(rs.next()){%>
                 <%=rs.getInt("score") %>
                 <%}else{ %>0<%} %>
             
              </span>
              </div>
              <div class="item totalwicket">
              <span class="carousel-title">
              Total Wicket
              </span>
              <span class="carousel-data">
               <%rs = null;
                 rs = DBManager.fetchQuery("select count(wno) as wicket from tourWicket where  tourId="+tourId);
                 if(rs.next()){%>
                 <%=rs.getInt("wicket") %>
                 <%}else{ %>0<%} %>
              </span>
              </div>
           </div>
        </div>
      </div>
      <!-- SECOND COLUMN -->
       <div class="col-md-3 col-xs-12 col-sm-6">
        <div id="highestscore" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators highestscore-indicators">
              <li data-target="#highestscore" data-slide-to="0" class="active"></li>
              <li data-target="#highestscore" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner highestscore">
             <div class="item active highestteam">
             <span class="carousel-title">
               Highest Team Score
              </span>
              <span class="carousel-data">
              <%
              rs = null;
                rs = DBManager.fetchQuery("select tr.ttId,(select tName from team t,tourTeam tt where t.tId = tt.tId and tr.ttId=tt.ttId and tourId="+request.getParameter("tourId")+") as name,sum(score) as score from tourRestore tr,tourTeam tt where tr.ttId = tt.ttId and tt.ttGender='F' and tt.tourId= tr.tourId and tr.tourId="+request.getParameter("tourId")+" group by tr.ttId order by score desc limit 1;");
                if(rs.next())
                {
              %>
              <%=rs.getInt("score") %>
              <span style="font-size:15px;"><%=rs.getString("name") %>&nbsp;[F]</span>
              <%}else{ %>0<%} %>
              </span>
             </div>
             <div class="item highestindividual">
             <span class="carousel-title">
             Highest Individual Score
             </span>
             <span class="carousel-data">
             <%
             	rs = null;
             	rs = DBManager.fetchQuery("select (select ucase(fName) as fName from member m where m.barcodeId=tr.barcodeId) as name,sum(score) as score from tourRestore tr,tourTeam tt where tt.ttId=tr.ttId and tt.ttGender='F' and tr.tourId="+tourId+" group by barcodeId;");
             	if(rs.next()){
             %>
             	<%=rs.getString("score") %>
             	<span style="font-size:15px;"><%=rs.getString("name") %></span>
             	<%} %>
             </span>
             </div>
           </div>
        </div>
      </div>
   <!-- THIRD COLUMN-->
      <div class="col-md-3 col-xs-12 col-sm-6">
        <div id="bestplayer" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#bestplayer" data-slide-to="0" class="active"></li>
              <li data-target="#bestplayer" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner bestplayer">
             <div class="item  besthitter">
              <span class="carousel-title">
               Best Lagori Breaker
               </span>
               <span class="carousel-data">
               <%
               		rs = null;
               		rs = DBManager.fetchQuery("select (select fName from member m where m.barcodeId= th.barcodeId) as name,count(barcodeId) as hit from tourHit th,print_match w where th.mid=w.mid and w.gender='F' and th.tourId="+tourId+"  group by barcodeId order by hit desc limit 1;");
               		if(rs.next()){
               %>
               <%=rs.getInt("hit") %>
               <span style="font-size:15px;"><%=rs.getString("name") %></span>
               <%} %>
               </span>
             </div>
             <!-- <div class="item active besthit">
              <span class="carousel-title">
               Best Hitter
              </span>
              <span class="carousel-data">
              Apurva
              </span>
             </div> -->
           </div>
        </div>
      </div>
     <!--  FOURTH COLUMN -->
      <div class="col-md-3 col-xs-12 col-sm-6">
      <div id="girlsteamwinner" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#girlsteamwinner" data-slide-to="0" class="active"></li>
              <li data-target="#girlsteamwinner" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner girlsteamwinner">
             
             <div class="item girlsteamname">
              <!-- WINNER NAME -->
              <span class="carousel-title">
                Winner[F]
              </span>
               <span class="carousel-data">
              <%
              rs = null;
                rs = DBManager.fetchQuery("select mid,(select SUBSTRING_INDEX(tFlag,'/',-2) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as photo1,tid1,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as tname1,(select SUBSTRING_INDEX(tFlag,'/',-2) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as photo2,tid2,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as tname2 from print_match pm where mtype='final' and gender='F' and tourId="+tourId+";");
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

					
					String won = null;
					if (setwonA > setwonB) {
						won = rs.getString("tname1");
					} else if (setwonA < setwonB) {
						won = rs.getString("tname2");
					} else {
						if (golden1 > golden2) {
							won = rs.getString("tname1");
						} else if (golden1 < golden2) {
							won = rs.getString("tname2");
						} else {
							won = "DRAW";
						}
					}
	%>

	
		<%=won%>	
              
              <%}else{ %>Not Found<%} %>
              </span>
             </div>
           </div>
        </div>
      </div>
   </div>
<!-- THIRD ROW -->
   <div class="row">
   	<!-- 	FIRST COLUMN -->
   		<div class="col-md-3 col-xs-12 col-sm-6">
        <div id="highestscoremale" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators highestscoremale-indicators">
              <li data-target="#highestscoremale" data-slide-to="0" class="active"></li>
              <li data-target="#highestscoremale" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner highestscoremale">
             <div class="item  highestteammale">
               <!-- HIGHEST TEAM SCORE(M) -->
               <span class="carousel-title">
                Highest Team Score
               </span>
               <span class="carousel-data">
               <%
              	rs = null;
                rs = DBManager.fetchQuery("select tr.ttId,(select tName from team t,tourTeam tt where t.tId = tt.tId and tr.ttId=tt.ttId and tourId="+request.getParameter("tourId")+") as name,sum(score) as score from tourRestore tr,tourTeam tt where tr.ttId = tt.ttId and tt.ttGender='M' and tt.tourId= tr.tourId and tr.tourId="+request.getParameter("tourId")+" group by tr.ttId order by score desc limit 1;");
                if(rs.next())
                {
              %>
              <%=rs.getInt("score") %>
              <span style="font-size:15px;"><%=rs.getString("name") %>&nbsp;[M]</span>
              <%}else{ %>0<%} %>
               </span>
             </div>
             <div class="item active highestindividualmale">
             <!-- HIGHEST INDIVDUAL(M) -->
             <span class="carousel-title">
               Highest Individual
             </span>
             <span class="carousel-data">
               <%
             	rs = null;
             	rs = DBManager.fetchQuery("select (select ucase(fName) as fName from member m where m.barcodeId=tr.barcodeId) as name,sum(score) as score from tourRestore tr,tourTeam tt where tt.ttId=tr.ttId and tt.ttGender='M' and tr.tourId="+tourId+" group by barcodeId;");
             	if(rs.next()){
             %>
             	<%=rs.getString("score") %>
             	<span style="font-size:15px;"><%=rs.getString("name") %></span>
             	<%} %>
             </span>
             </div>
           </div>
        </div>
      </div>
   		<!-- SECOND COLUMN -->
   		<div class="col-md-3 col-xs-12 col-sm-6">
        <div id="bestplayermale" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators bestplayermale-indicators">
              <li data-target="#bestplayermale" data-slide-to="0" class="active"></li>
              <li data-target="#bestplayermale" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner bestplayermale">
             <div class="item active besthittermale">
              <!--  BEST HITTER MALE -->
              <span class="carousel-title">
              Best Lagori Breaker
              </span>
              <span class="carousel-data">
              <%
               		rs = null;
               		rs = DBManager.fetchQuery("select (select fName from member m where m.barcodeId= th.barcodeId) as name,count(barcodeId) as hit from tourHit th,wmatch w where th.mid=w.mid and w.gender='M' and th.tourId="+tourId+"  group by barcodeId order by hit desc limit 1;");
               		if(rs.next()){
               %>
               <%=rs.getInt("hit") %>
               <span style="font-size:11px;"><%=rs.getString("name") %></span>
               <%} %>
              </span>
             </div>
             <div class="item besthitmale">
              <!--  BEST HIT MALE -->
              <span class="carousel-title">
              Best Hitter
              </span>
              <span class="carousel-data">
              89
              </span>
             </div>
           </div>
        </div>
      </div>
   	<!-- 	THIRD COLUMN -->
   		<div class="col-md-3 col-xs-12 col-sm-6">
        <div id="boysteamwinner" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#boysteamwinner" data-slide-to="0" class="active"></li>
              <li data-target="#boysteamwinner" data-slide-to="1"></li>
           </ol>
           
           <div class="carousel-inner boysteamwinner">
             <div class="item active boysphoto">
               <!-- MALE WINNER PHOTO -->
             <img src="Flags/BOLTS.png" class="img-responsive" style="display: block; height:170px">
             </div>
             <div class="item boyssteamname">
             <!--  MALE WINNER NAME -->
             <span class="carousel-title">
             Winner [M]
             </span>
           <span class="carousel-data">
              <%
              rs = null;
                rs = DBManager.fetchQuery("select mid,(select SUBSTRING_INDEX(tFlag,'/',-2) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as photo1,tid1,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid1)) as tname1,(select SUBSTRING_INDEX(tFlag,'/',-2) from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as photo2,tid2,(select tName from team t where t.tId in(select tId from tourTeam tt where tt.ttId=pm.tid2)) as tname2 from print_match pm where mtype='final' and gender='M' and tourId="+tourId+";");
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

					
					String won = null;
					if (setwonA > setwonB) {
						won = rs.getString("tname1");
					} else if (setwonA < setwonB) {
						won = rs.getString("tname2");
					} else {
						if (golden1 > golden2) {
							won = rs.getString("tname1");
						} else if (golden1 < golden2) {
							won = rs.getString("tname2");
						} else {
							won = "DRAW";
						}
					}
	%>

	
		<%=won%>	
              
              <%}else{ %>Not Found<%} %>
              </span>
             </div>
           </div>
        </div>
      </div>
   	 <!-- FOURTH COLUMN -->
   		<div class="col-md-3 col-xs-12 col-sm-6">
        <div id="maletotalmatchwicket" class="carousel slide" data-ride = "carousel">
           <ol class="carousel-indicators bestplayer-indicators">
              <li data-target="#maletotalmatchwicket" data-slide-to="0"></li>
              <li data-target="#maletotalmatchwicket" data-slide-to="1" class="active"></li>
           </ol>
           
           <div class="carousel-inner maletotalmatchwicket">
             <div class="item  maletotalmatch">
               <!-- MALE TOTAL MATCH -->
               <span class="carousel-title">
               Total Matches [M]
               </span>
               <span class="carousel-data">
              <%
              rs=null;
              rs=DBManager.fetchQuery("select count(mid) as t from wmatch where gender='M' and tourId="+tourId+";");
              if(rs.next())
              {
            	
              %><%=  rs.getInt("t") %>
              <%}else{%>0<%} %>
               </span>
             </div>
             <div class="item active maletotalwicket">
              <!-- MALE TOTAL WICKET -->
              <span class="carousel-title">
              Total Matches [F]
              </span>
              <span class="carousel-data">
              <%
              rs=null;
              rs=DBManager.fetchQuery("select count(mid) as t from wmatch where gender='F' and tourId="+tourId+";");
              if(rs.next())
              {
            	
              %><%=  rs.getInt("t") %>
              <%}else{%>0<%} %>
              </span>
             </div>
           </div>
        </div>
      </div>
   		
   	</div>	
   </div>
   <!-- TABLE -->

   <%-- <div class="col-md-4" style="margin-left: 45px;width:29%;">
   <%
     rs = null;
     
   	 ResultSet rs1= null;
     rs = DBManager.fetchQuery("select mid,tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId and tourId="+request.getParameter("tourId")+") as tname2,gender,ucase(DATE_FORMAT(mdate,'%W %d %b.%y')) as mdate,TIME_FORMAT(mtime,'%H:%i') as time,ucase(mtype) as mtype from print_match pm where tourId="+tourId+" order by srno desc limit 6");
     while(rs.next())
     {	
    	 
         rs1 = null;
    	 rs1 = DBManager.fetchQuery("select (select sum(score) from tourRestore tt1 where tourId="+tourId+" and tt1.ttId="+rs.getInt("tid1")+" and mid="+rs.getInt("mid")+") as sum1,(select sum(score) from tourRestore tt2 where tourId="+tourId+" and tt2.ttId="+rs.getInt("tid2")+" and mid="+rs.getInt("mid")+") as sum2 from print_match pm where mid="+rs.getInt("mid")+" and tid1="+rs.getInt("tid1")+" and tid2="+rs.getInt("tid2")+" and tourId="+tourId+";");
    	 
    	 if(rs1.next()){
   %>
   		
     <div class="row">
	   <div class="col-xs-12 result-head">
	     <span class="result-date" ><%=rs.getString("mdate") %>&nbsp;</span><span style="color:#000;"></span>
	     <span class="result-place" style="float:right;"><%=rs.getString("mtype")%></span>
	   </div>
	 </div>
	 <div class="row">
	   <div class="col-xs-5 result-teams">
	     <span class="result-team1" style="white-space:nowrap;float:left;"><%=rs.getString("tname1")%></span>
	    </div>
	    <div class="col-xs-2 result-teams">
	     <span class="score" style="float: left;margin-left: 0px;"><%=rs1.getInt("sum1") %>&nbsp;-&nbsp;<%=rs1.getInt("sum2") %>&nbsp;<span>[<%=rs.getString("gender") %>]</span> </span>
	    </div>
	    <div class="col-xs-5 result-teams">
	     <span class="result-team2" style="float:right;white-space:nowrap;"><%=rs.getString("tname2") %></span>
	    </div>
	 </div>
	<%
	    }
    }
   %>
 </div> --%>
 <br>
   <br><br>
</div>
<hr style="margin-top: 34px; margin-bottom: 26px; border-width: 1px 0px 0px; border-style: solid none none; border-color: rgb(41, 32, 32) -moz-use-text-color -moz-use-text-color; -moz-border-top-colors: none; -moz-border-right-colors: none; -moz-border-bottom-colors: none; -moz-border-left-colors: none; border-image: none; width: 89%;"></hr>
<% }
   catch(Exception e){
   	System.out.println("Home1.jsp"+e);
   }%>
</body>
</html>