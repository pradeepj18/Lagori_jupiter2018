<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="lg_DBManager.DBManager,java.sql.*,java.lang.Object.*"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<style type="text/css">
.btn {
	border-radius: 0px;
}

.btn-primary {
	background-color: #45ABCD;
}

.input-cs {
	height: 35px;
	padding: 0px 10px;
}
</style>
<body>


	<%
		try {
			ResultSet rs = null, rs1 = null;
			String tourId = request.getParameter("tourId");
			String ttGender = request.getParameter("ttGender");
			String mid = request.getParameter("mid");
			String category = request.getParameter("memcategory");

			if (category.equals("1")) {
				String tname1 = "";
				String tname2 = "";
				int tid1 = 0;
				int tid2 = 0;
				String[] htype = new String[7];
				htype[1] = "SET A";
				htype[2] = "SET B";
				htype[3] = "SET C";
				htype[4] = "SET D";
				htype[5] = "SET E";
				htype[6] = "GOLDEN";

				rs = DBManager.fetchQuery(
						"select tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2 from print_match pm where tourId="
								+ tourId + " and mid=" + mid + " and gender='" + ttGender + "';");
				if (rs.next()) {
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
					tid1 = rs.getInt("tid1");
					tid2 = rs.getInt("tid2");
				}
	
		rs = null;
				rs = DBManager.fetchQuery(
						"select hno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = th.barcodeId and th.tourId=tp.tourId) as jerseyNo,htype from tourHit th where tourId="
								+ request.getParameter("tourId") + " and mid=" + mid + " and ttId=" + tid1
								+ " order by hno asc;");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid1 + ";");
				int i = 0;
				if(rs.next()){
					%>
					<div class="row">
						<div class="col-md-3 col-xs-6 col-sm-6">
							<h4>
								<b>LAGORI HIT </b>
							</h4>
						</div>
						<div class="col-md-3 col-xs-6 col-sm-6">
							<h4>
								<b>MATCH NO - <%=mid%></b>
							</h4>
						</div>
						<div class="col-md-6 col-xs-12 col-sm-12">
							<h4>
								<span><%=tname1%></span> <span>VS</span> <span><%=tname2%></span>
							</h4>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-12">
							<h3>
								<b><%=tname1%></b>
							</h3>
						</div>
					</div>
					<br>

					<%
					
					rs.beforeFirst();
				while (rs.next()) {
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-6 col-xs-7 col-sm-7">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid1%>><%=tname1%></option>
				<option value=<%=tid2%>><%=tname2%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("hno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid1%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("hno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
	%>
	<br>
	<div class="row">
		<div class="col-md-3 col-xs-12 col-sm-12">
			<h3>
				<b><%=tname2%></b>
			</h3>
		</div>
	</div>
	<%
		rs = null;
				rs1 = null;
				rs = DBManager.fetchQuery(
						"select hno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = th.barcodeId and th.tourId=tp.tourId) as jerseyNo,htype from tourHit th where tourId="
								+ request.getParameter("tourId") + " and mid=" + mid + " and ttId=" + tid2);
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid2 + ";");
				while (rs.next()) {
					/* out.println(rs.getInt("tid1")); */
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-6 col-xs-7 col-sm-7">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid2%>><%=tname2%></option>
				<option value=<%=tid1%>><%=tname1%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("hno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid2%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("hno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
				}
				else
				{
					%><h4>NOT FOUND</h4>
					<%
				}

			}

			else if (category.equals("2")) {
				int i = 0;
				String tname1 = "";
				String tname2 = "";
				int tid1 = 0;
				int tid2 = 0;
				String[] htype = new String[7];
				htype[1] = "SET A";
				htype[2] = "SET B";
				htype[3] = "SET C";
				htype[4] = "SET D";
				htype[5] = "SET E";
				htype[6] = "GOLDEN";

				rs = DBManager.fetchQuery(
						"select tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2 from print_match pm where tourId="
								+ tourId + " and mid=" + mid + " and gender='" + ttGender + "';");
				if (rs.next()) {
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
					tid1 = rs.getInt("tid1");
					tid2 = rs.getInt("tid2");
				}
	
		rs = null;
				rs = DBManager.fetchQuery(
						"select mno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tm.barcodeId and tm.tourId=tp.tourId) as jerseyNo,mtype as htype from tourMiss tm where tourId="
								+ request.getParameter("tourId") + " and mid=" + mid + " and ttId=" + tid1
								+ " order by mno asc");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid1 + ";");
				if(rs.next()){
					%>
					<div class="row">
						<div class="col-md-3 col-xs-6 col-sm-6">
							<h4>
								<b>LAGORI MISS </b>
							</h4>
						</div>
						<div class="col-md-3 col-xs-6 col-sm-6">
							<h4>
								<b>MATCH NO - <%=mid%></b>
							</h4>
						</div>
						<div class="col-md-6 col-xs-12 col-sm-12">
							<h4>
								<span><%=tname1%></span> <span>VS</span> <span><%=tname2%></span>
							</h4>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-12">
							<h3>
								<b><%=tname1%></b>
							</h3>
						</div>
					</div>
					<br>
					<%
				rs.beforeFirst();
				while (rs.next()) {
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-6 col-xs-7 col-sm-7">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid1%>><%=tname1%></option>
				<option value=<%=tid2%>><%=tname2%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("mno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid1%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("mno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
	%>
	<br>
	<div class="row">
		<div class="col-md-3 col-xs-12 col-sm-12">
			<h3>
				<b><%=tname2%></b>
			</h3>
		</div>
	</div>
	<%
		rs = null;
				rs1 = null;
				rs = DBManager.fetchQuery(
						"select mno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tm.barcodeId and tp.tourId=tm.tourId) as jerseyNo,mtype as htype from tourMiss tm where tourId="
								+ request.getParameter("tourId") + " and mid=" + mid + " and ttId=" + tid2);
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid2 + ";");
				while (rs.next()) {
					/* out.println(rs.getInt("tid1")); */
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-6 col-xs-7 col-sm-7">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid2%>><%=tname2%></option>
				<option value=<%=tid1%>><%=tname1%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("mno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid2%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("mno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
				}
				else
				{
					%><h4>NOT FOUND</h4>
					<%
				}
			}

			else if (category.equals("3")) {
				int i = 0;
				String tname1 = "";
				String tname2 = "";
				int tid1 = 0;
				int tid2 = 0;
				String[] htype = new String[7];
				htype[1] = "SET A";
				htype[2] = "SET B";
				htype[3] = "SET C";
				htype[4] = "SET D";
				htype[5] = "SET E";
				htype[6] = "GOLDEN";

				rs = DBManager.fetchQuery(
						"select tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2 from print_match pm where tourId="
								+ tourId + " and mid=" + mid + " and gender='" + ttGender + "';");
				if (rs.next()) {
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
					tid1 = rs.getInt("tid1");
					tid2 = rs.getInt("tid2");
				}

		rs = null;

				rs = DBManager.fetchQuery(
						"select rno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tr.barcodeId and tp.tourId=tr.tourId) as jerseyNo,rtype as htype,score from tourRestore tr where tourId="
								+ tourId + " and mid=" + mid + " and ttId=" + tid1 + ";");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid1 + ";");
				if(rs.next()){
					%>
					<div class="row">
						<div class="col-md-4 col-xs-6 col-sm-6">
							<h4>
								<b>RESTORE </b>
							</h4>
						</div>
						<div class="col-md-3 col-xs-6 col-sm-6">
							<h4>
								<b>MATCH NO - <%=mid%></b>
							</h4>
						</div>
						<div class="col-md-6 col-xs-12 col-sm-12">
							<h4>
								<span><%=tname1%></span> <span>VS</span> <span><%=tname2%></span>
							</h4>
						</div>
						<div class="col-md-3 col-xs-12 col-sm-12">
							<h3>
								<b><%=tname1%></b>
							</h3>
						</div>
					</div>
					<br>
					<%
					rs.beforeFirst();
				while (rs.next()) {
					/* out.println(rs.getInt("tid1")); */
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2">
			<select id="score<%=i%>" class="form-control">
				<option value="<%=rs.getInt("score")%>" selected=selected><%=rs.getInt("score")%></option>
				<%
					for (int j = 1; j <= 10; j++) {
				%>
				<option value="<%=j%>"><%=j%></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid1%>><%=tname1%></option>
				<option value=<%=tid2%>><%=tname2%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("rno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid1%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("rno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
	%>
	<br>
	<div class="row">
		<div class="col-md-3 col-xs-12 col-sm-12">
			<h3>
				<b><%=tname2%></b>
			</h3>
		</div>
	</div>
	<%
		rs = null;
				rs1 = null;
				int j = 0;
				rs = DBManager.fetchQuery(
						"select rno,barcodeId,mid,tourId,ttId,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tr.barcodeId and tp.tourId=tr.tourId) as jerseyNo,rtype as htype,score from tourRestore tr where tourId="
								+ tourId + " and mid=" + mid + " and ttId=" + tid2 + ";");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid2 + ";");
				while (rs.next()) {
					/* out.println(rs.getInt("tid1")); */
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId")%>" selected=selected><%=rs.getInt("jerseyNo")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2">
			<select id="score<%=i%>" class="form-control">
				<option value="<%=rs.getInt("score")%>" selected=selected><%=rs.getInt("score")%></option>
				<%
					for (j = 1; j <= 10; j++) {
				%>
				<option value="<%=j%>"><%=j%></option>
				<%
					}
				%>
			</select>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid2%>><%=tname2%></option>
				<option value=<%=tid1%>><%=tname1%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("rno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=tid2%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("rno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
			}
			else
			{
				%><h4>NOT FOUND</h4>
				<%
			}
			}

			else if (category.equals("4")) {
				String tname1 = "";
				String tname2 = "";
				int tid1 = 0;
				int tid2 = 0;
				String[] htype = new String[7];
				htype[1] = "SET A";
				htype[2] = "SET B";
				htype[3] = "SET C";
				htype[4] = "SET D";
				htype[5] = "SET E";
				htype[6] = "GOLDEN";
				rs = DBManager.fetchQuery(
						"select tid1,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid1 = tt.ttId  and tt.tourId=pm.tourId) as tname1,tid2,(select tName from team t,tourTeam tt where tt.tId = t.tId and pm.tid2 = tt.ttId  and tt.tourId=pm.tourId) as tname2 from print_match pm where tourId="
								+ tourId + " and mid=" + mid + " and gender='" + ttGender + "';");
				if (rs.next()) {
					tname1 = rs.getString("tname1");
					tname2 = rs.getString("tname2");
					tid1 = rs.getInt("tid1");
					tid2 = rs.getInt("tid2");
				}
	
		rs = null;
				rs1 = null;
				ResultSet rs2 = null;
				rs = DBManager.fetchQuery(
						"select wno,barcodeId1,barcodeId2,mid,tourId,ttId1,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tw.barcodeId1 and tp.tourId=tw.tourId) as jerseyNo1,ttId2,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tw.barcodeId2 and tp.tourId=tw.tourId) as jerseyNo2,wtype as htype,turn from tourWicket tw where tourId="
								+ tourId + " and mid=" + mid + " and tw.turn=" + tid1 + " order by wno asc;");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid1 + ";");
				rs2 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid2 + ";");
				int i = 0;
	%>

	<%
	if(rs.next()){
		%>
		<div class="row">
			<div class="col-md-3 col-xs-6 col-sm-6">
				<h4>
					<b>LAGORI WICKET </b>
				</h4>
			</div>
			<div class="col-md-3 col-xs-6 col-sm-6">
				<h4>
					<b>MATCH NO - <%=mid%></b>
				</h4>
			</div>
			<div class="col-md-6 col-xs-12 col-sm-12">
				<h4>
					<span><%=tname1%></span> <span>VS</span> <span><%=tname2%></span>
				</h4>
			</div>
			<div class="col-md-3 col-xs-12 col-sm-12">
				<h3>
					<b><%=tname1%></b>
				</h3>
			</div>
		</div>
		<br>
		<%
		rs.beforeFirst();
		while (rs.next()) {
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo1<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId1")%>" selected=selected><%=rs.getInt("jerseyNo1")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2">
			<select id="jerseyNo2<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId2")%>" selected=selected><%=rs.getInt("jerseyNo2")%></option>
				<%
					rs2.beforeFirst();
								while (rs2.next()) {
				%>
				<option value="<%=rs2.getInt("barcodeId")%>"><%=rs2.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid1%>><%=tname1%></option>
				<option value=<%=tid2%>><%=tname2%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("wno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=rs.getInt("turn")%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("wno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
	%>
	<br>
	<div class="row">
		<div class="col-md-3 col-xs-12 col-sm-12">
			<h3>
				<b><%=tname2%></b>
			</h3>
		</div>
	</div>
	<%
		rs = null;
				rs1 = null;
				rs2 = null;
				rs = DBManager.fetchQuery(
						"select wno,barcodeId1,barcodeId2,mid,tourId,ttId1,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tw.barcodeId1 and tp.tourId=tw.tourId) as jerseyNo1,ttId2,(select jerseyNo  from tourPlayer tp where tp.barcodeId = tw.barcodeId2 and tp.tourId=tw.tourId) as jerseyNo2,wtype as htype,turn from tourWicket tw where tourId="
								+ tourId + " and mid=" + mid + " and tw.turn=" + tid2 + " order by wno asc;");
				rs1 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid2 + ";");
				rs2 = DBManager.fetchQuery("select barcodeId,jerseyNo from tourPlayer where tourId=" + tourId
						+ " and ttId=" + tid1 + ";");
				while (rs.next()) {
					/* out.println(rs.getInt("tid1")); */
	%>

	<div class="row">
		<div class="col-md-2 col-xs-2 col-sm-2">

			<select id="jerseyNo1<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId1")%>" selected=selected><%=rs.getInt("jerseyNo1")%></option>
				<%
					rs1.beforeFirst();
								while (rs1.next()) {
				%>
				<option value="<%=rs1.getInt("barcodeId")%>"><%=rs1.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-2 col-xs-2 col-sm-2">
			<select id="jerseyNo2<%=i%>" class="form-control">
				<option value="<%=rs.getInt("barcodeId2")%>" selected=selected><%=rs.getInt("jerseyNo2")%></option>
				<%
					rs2.beforeFirst();
								while (rs2.next()) {
				%>
				<option value="<%=rs2.getInt("barcodeId")%>"><%=rs2.getInt("jerseyNo")%></option>


				<%
					}
				%>

			</select>
		</div>
		<div class="col-md-3 col-xs-3 col-sm-3">
			<select id="htype<%=i%>" class="form-control">
				<option value="<%=rs.getInt("htype")%>" selected=selected><%=htype[rs.getInt("htype")]%></option>
				<option value="1">SET A</option>
				<option value="2">SET B</option>
				<option value="3">SET C</option>
				<option value="4">SET D</option>
				<option value="5">SET E</option>
				<option value="6">GOLDEN HIT</option>
			</select>
		</div>
		<div class="col-md-5 col-xs-5 col-sm-5">
			<select id="tname<%=i%>" class="form-control">
				<option value=<%=tid2%>><%=tname2%></option>
				<option value=<%=tid1%>><%=tname1%></option>
			</select>
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-primary" value="UPDATE"
				onclick="updateConfirm(<%=rs.getInt("wno")%>,<%=mid%>,<%=category%>,<%=i%>,<%=rs.getInt("turn")%>)">
		</div>
		<div class="col-md-2 col-xs-3 col-sm-3">
			<input type="button" class="btn btn-danger" value="DELETE"
				onclick="deleteConfirm(<%=rs.getInt("wno")%>,<%=mid%>,<%=category%>,<%=i%>)">

		</div>
	</div>
	<%
		i = i + 1;
				}
			}
			else
			{
				%><h4>NOT FOUND</h4>
				<%
			}
			}

		} catch (Exception e) {
			System.out.println("updateHitMiss.jsp  " + e);
		}
	%>
	<!-- </div> -->
</body>
</html>