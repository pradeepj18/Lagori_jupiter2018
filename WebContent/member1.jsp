<%@ page language="java" import="java.sql.*"
	import="lg_DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Member</title>
</head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>


<link class="jsbin" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1/themes/base/jquery-ui.css" rel="stylesheet" type="text/css" />
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script class="jsbin" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.0/jquery-ui.min.js"></script>
<script type="text/javascript" src="js/jquery-1.11.1.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <script src="js/jquery-1.12.4.js"></script>
  <script src="js/jquery-ui.js"></script>
  
<script type="text/javascript">
$( function() {
    $( "#datepicker" ).datepicker();
  } );
function readURL(input) {
    if (input.files && input.files[0]) {
        var reader = new FileReader();

        reader.onload = function (e) {
            $('#blah')
                .attr('src', e.target.result)
                .width(80)
                .height(50);
        };

        reader.readAsDataURL(input.files[0]);
    }
}

    $(document).ready(function() {
    	
        var max_fields      = 20; //maximum input boxes allowed
        var wrapper         = $(".input_fields_wrap"); //Fields wrapper
        var add_button      = $(".add_field_button"); //Add button ID
       
        var x = 1; //initlal text box count
        $(add_button).click(function(e){ //on add input button click
            e.preventDefault();
            if(x < max_fields){ //max input box allowed
                 //text box increment
                /* $(wrapper).append('</div><a href="#" class="remove_field">Remove</a></div>'); //add input box */
            	$(wrapper).append('<div class="add-container"><div class="row"><br><br><div class="col-md-3 col-xs-6" id="first1"><div class="form-group"><label for="fname"><font size="2">First Name</font></label><input type="text" class="form-control" name="fname" id="fname"  placeholder="First Name" style="width:125%;" required autofocus></div></div><div class="col-md-3 col-xs-6" id="middle1"><div class="form-group"><label for="mname"><font size="2">Middle Name</font></label><input type="text" class="form-control" id="mname" name="mname" placeholder="Middle Name" style="width:125%;"></div></div><div class="col-md-3 col-xs-6" id="last1"><div class="form-group"><label for="lname"><font size="2">Last Name:</font></label><input type="text" class="form-control" name="lname" id="lname" placeholder="Last Name" style="width:125%;" required></div></div><div class="col-md-3 col-xs-6" id="date1"><div class="form-group"><label for="dob"><font size="2">DOB:</font></label><input type="text" class="form-control" id="datepicker" name="dob" placeholder="DOB" style="width:125%;"></div></div><div class="col-md-3 col-xs-12" id="gender1"><div class="form-group row"><label for="gender"><font size="2">Gender:</font></label><br><label class="radio-inline"><input type="radio" name="gen'+x+'" value="M" id="male" required>Male</label><label class="radio-inline"><input type="radio" name="gen'+x+'" value="F" id="female" required>Female</label></div></div><div class="col-md-3 col-xs-6" id="photo1"><div class="form-group"><label for="photo"><font size="2">Photo:</font></label><input type="file" class="form-control" style="width:125%;" name="photo" onchange="readURL(this);" size="5" placeholder="select photo" autofocus id="year"></div></div><div class="col-md-2 col-xs-6" id="showphoto1"><div class="form-group"><label for="team_name"><font size="2">Ur Photo</font></label><img id="blah" src="#" width="1" height="5" style="boder-radius:50px;" /></div></div></div><a href="#" class="remove_field"><button class="btn btn-warning" id="remove1"><b>-</b></button></a></div>');
            	x++;
            
            }
        });
       
        $(wrapper).on("click",".remove_field", function(e){ //user click on remove text
            e.preventDefault(); $(this).parent('div').remove(); x--;
        })
    });
  
  
</script>
<style>
#aa 
{
	text-transform: uppercase;
}
body
{
	background:url("images/bg-footer.jpg");
	background-color: #333;
	background-position: center -100px;
	background-repeat: x-repeat;
	background-size: cover;
	overflow-x:hidden;
	width: 100%;
	height: auto;
	max-width:100%;
	clear:both;
}
.navbar-default {
    background-color: #f8f8f8;
    border-color:#030825;
}
#logo
	{
		float:left;
		margin-left:-5%;
		width:76%;
	}
/* LAPTOP */

@media (min-width:992px)
{
	#member-bar
	{
		background:#030825;
		width:99.7%;
		overflow-x:hidden;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#member-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:-3.3%;
		margin-left:45%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:75%;
	}
	.member-container
	{
		background:#fff;
		border-radius:7px;
		width:80%;
		float:left;
		margin-left:10%;
	}
	#first
	{
		float:left;
		margin-left:1%;
	}
	#middle
	{
		float:left;
		margin-left:-1%;
	}
	#last
	{
		float:left;
		margin-left:-1%;
	}
	#date
	{
		float:left;
		margin-left:-1%;
	}
	#gender
	{
		float:left;
		margin-left:2%;
	}
	#photo
	{
		float:left;
		margin-left:-2%;
	}
	#add
	{
		float:left;
		margin-left:12%;
		margin-top:1%;
	}
	.add-container
	{
		background:#fff;
		border-radius:7px;
		width:80%;
		float:left;
		margin-left:11%;
		
	}
	#first1
	{
		float:left;
		margin-left:-10.2%;
	}
	#middle1
	{
		float:left;
		margin-left:4%;
	}
	#last1
	{
		float:left;
		margin-left:4%;
	}
	#date1
	{
		float:left;
		margin-left:77%;
		margin-top:-8%;
	}
	#gender1
	{
		float:left;
		margin-left:-9%;
	}
	#photo1
	{
		float:left;
		margin-left:2.5%;
	}
	#showphoto1
	{
		float:left;
		margin-left:5.5%;
	}
	#remove1
	{
		float:right;
		margin-top:-6%;
	}
}
@media (max-width:767px) and (orientation: portrait)
{
	#member-bar
	{
		background:#030825;
		
		width:99.7%;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#member-text
	{
		float:left;
		font-size:16pt;
		color:#ffffff;
		margin-top:-2.3%;
		margin-left:40%;
	}
	#logo
	{
		float:left;
		margin-left:-5%;
		width:75%;
	}
	.member-container
	{
		background:#fff;
		border-radius:7px;
		width:100%;
	}
}
</style>
<body>
<form action="Addmember1" method="get">
<div class="container-fluid">
<div class="row">
<div class="col-sm-12 col-xs-12 col-md-12">
<br>
</div>
</div>
<div class="row">
		<nav class="navbar navbar-default" style="background-color:#2045a5;opacity:0.9;" >
			<div class="container-fluid" >
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#myHeader" aria-expanded="false">
						<span class="sr-only"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<img src="images/lagori.png" alt="LAGORI" id="logo">
				</div>
				 <!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="myHeader" >
				<ul class="nav navbar-nav">
					<li>
						<a  href="tournament.jsp" role="button"><font color="white">TOURNAMENT</font></a>
					</li>
					
					<li><a href="#"><font color="white">TEAMS</font></a></li>
					<li><a href="#"><font color="white">UPDATE</font></a></li>
					<li class="nav-item dropdown active"><a class="nav-link dropdown-toggle" data-toggle="dropdown" href="selectMatch.jsp">SELECT MATCH <span class="sr-only">(current)</span></a></li>
					<li><a href="#"><font color="white">MATCH SUMMARY</font></a></li>
					<li><a href="#"><font color="white">STATISTICS</font></a></li>
				</ul>
				<!-- <form class="navbar-form navbar-left">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="SEARCH">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						GO
						</button>
					</div>
				</form> -->
				</div>
			</div>
		</nav>
	</div>
	
	<div class="row">
		<div class="col-md-3">&nbsp;</div>
			<div class="col-md-6">
				SELECT TEAM
				<select name="selectteam" id="select-team" required>
					<option value="Select_Team">Select_Team</option>
					<%
					try
					{
						DBManager.loadDriver();
						ResultSet rs=null;
						rs=DBManager.fetchQuery("select tt.ttId,t.tName,tt.ttGender from team t,tourTeam tt where t.tId=tt.tId and tt.tourId=1 order by t.tName asc;");
						while(rs.next())
						{
					%>
							<option value=<%=rs.getInt("ttId")%>><%out.println(rs.getInt("ttId")+" "+rs.getString("tName") +"("+rs.getString("ttGender")+")"); %></option>
					<% 
						}
					}
					catch(Exception e)
					{
						System.out.println("Member select team"+e);
					}
					%>
				</select>
			</div>
		<div class="col-md-3">&nbsp;</div>
	</div>
	
	
	
<div class="member-container">
	<div class="row">
		<div class="col-md-12">
			<div class="row" id="member-bar">
				<div class="col-xs-12 col-md-12"><br><br></div>
			</div>
			<div id="member-text">
				<b>MEMBER</b>
			</div>	
		</div>
	</div>
	
	<div class="row">
		<div class="input_fields_wrap">
			<div class="col-md-3 col-xs-6" id="first">
				 <div class="form-group">
			   		  <label for="fname"><font size="2">First Name</font></label>
			    	  <input type="text" class="form-control" name="fname" id="fname" placeholder="First Name" autofocus required>
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="middle">
				 <div class="form-group">
			      <label for="mname"><font size="2">Middle Name</font></label>
			      <input type="hidden" class="form-control" id="mname" name="mname" placeholder="Middle Name">
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="last">
				 <div class="form-group">
			      <label for="lname"><font size="2">Last Name:</font></label>
			      <input type="text" class="form-control" id="lname" name="lname" placeholder="Last Name" required>
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="date">
				 <div class="form-group">
			      <label for="dob"><font size="2">DOB:</font></label>
			      <input type="hidden" class="form-control"  name="dob" placeholder="DOB">
			    </div>
			    
			</div>
			<div class="col-md-3 col-xs-12" id="gender">
				<div class="form-group row">
					<label for="gender"><font size="2">Gender:</font></label><br>
				      	<label class="radio-inline">
	    			    	<input type="radio" name="gen0" value="M" id="male" required>Male
	    				</label>
	    				<label class="radio-inline">
	   						<input type="radio" name="gen0" value="F" id="female" required>Female
	   					</label>	
				</div>
			</div>
			<div class="col-md-3 col-xs-6" id="photo">
				 <div class="form-group">
			      <label for="photo"><font size="2">Photo:</font></label>
			      <input type="file" class="form-control" name="photo" onchange="readURL(this);" size="5" placeholder="select photo" autofocus id="year">
			    </div>
			</div>
			
			<div class="col-md-2 col-xs-6" id="showphoto">
				 <div class="form-group">
					<label for="team_name"><font size="2">Ur Photo</font></label>
						 <img id="blah" src="#" width="1" height="5" style="boder-radius:50px;" />
				 </div>
			</div>
			</div>
		</div>
	</div>

<div class="row">
<div class="col-md-4 col-xs-6" id="add">
	<div class="form-group row">
					<button class="btn btn-danger add_field_button">+</button>
		<button type="submit" class="btn btn-primary">Submit</button>
	</div>
</div>

</div>
</div>
</form>
</body>
</html>