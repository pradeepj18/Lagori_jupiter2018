<%@ page language="java" import="java.sql.*"
	import="DBManager.DBManager"
	contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
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


<script type="text/javascript">
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
    	
        var max_fields      = 10; //maximum input boxes allowed
        var wrapper         = $(".input_fields_wrap"); //Fields wrapper
        var add_button      = $(".add_field_button"); //Add button ID
       
        var x = 1; //initlal text box count
        $(add_button).click(function(e){ //on add input button click
            e.preventDefault();
            if(x < max_fields){ //max input box allowed
                 //text box increment
                /* $(wrapper).append('</div><a href="#" class="remove_field">Remove</a></div>'); //add input box */
            	$(wrapper).append('<div class="add-container"><div class="row"><div class="col-md-3 col-xs-6"><label for="fname" id="fnamelabel1"><font size="2">First Name</font></label> <input type="text" class="form-control" id="fname1" placeholder="First Name" size="1"></div><div class="col-md-3 col-xs-6" id="mname1"><label for="mname" id="mnamelabel1"><font size="2">Middle Name</font></label><input type="text" class="form-control" id="mname" placeholder="Middle Name"></div><div class="col-md-3 col-xs-6" id="lname1"> <label for="lname" id="lnamelabel1"><font size="2">Last Name:</font></label><input type="text" class="form-control" id="lname" placeholder="Last Name"></div><div class="col-md-3 col-xs-6" id="dob1"><label for="dob" id="doblabel1"><font size="2">DOB:</font></label> <input type="text" class="form-control" id="dob" placeholder="DOB"></div><div class="col-md-3 col-xs-12" id="gender1"><label for="gender" id="genderlabel1"><font size="2">Gender:</font></label><br><label class="radio-inline" id="male1"><input type="radio" name="gen">Male</label><label class="radio-inline" id="female1"><input type="radio" name="gen">Female</label></div><div class="col-md-3 col-xs-6" id="photo1"><label for="photo"><font size="2">Photo:</font></label><input type="file" class="form-control" name="photo" onchange="readURL(this);" size="5" placeholder="select photo" autofocus required id="year"></div><div class="col-md-2 col-xs-6" id="showphoto1"><label for="team_name" id="teamlabel1"><font size="2">Ur Photo</font></label><img id="blah" src="#" width="1" height="5" style="border-radius:50px;" /></div></div><a href="#" class="remove_field"><button class="btn btn-warning"><b>-</b></button></a><br></div>');
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
	width: 100%;
	height: auto;
	max-width:100%;
	overflow:hidden;
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
	.add-container
	{
		background:#fff;
		border-radius:7px;
		width:78%;
		float:left;
		margin-left:11%;
		
	}
	#fname1
	{
		float:left;
		margin-left:10%;
		margin-top:-1%;
		
	}
	#fnamelabel1
	{
		float:left;
		margin-left:25%;
		margin-top:10%;
	}
	#mname1
	{
		float:left;
		margin-left:4.3%;
		margin-top:2%;
	}
	#mnamelabel1
	{
		float:left;
	}
	#lname1
	{
		float:left;
		margin-top:2%;
		margin-left:-5.5%;
	}
	#lnamelabel1
	{
		float:left;
	}
	#dob1
	{
		float:left;
		margin-top:2%;
		margin-left:-2.3%;
	}
	#doblabel1
	{
		float:left;	
	}
	#gender1
	{
		float:left;
		margin-left:-21.4%;
	}
	#photo1
	{
		float:left;
		margin-left:-4%;
	}
	#showphoto1
	{
		float:left;	
	}
	#player-bar
	{
		background:#030825;
		
		width:99.7%;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#player-text
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
	.player-container
	{
		background:#fff;
		border-radius:7px;
		width:80%;
		float:left;
		margin-left:10%;
	}
	#teamlabel
	{
		float:left;
		margin-top:-10%;
		margin-left:-7%;
	}
	#fname
	{
		margin-top:1.7%;
		float:left;
		margin-left:-44%;

	}
	#fnamelabel
	{
		margin-top:-7%;
		float:left;
		margin-left:-2%
	}
	#mname
	{
		float:left;
		margin-left:-21%;
		
		
	}
	#lname
	{
		float:left;
		margin-left:-5.3%;
	}
	#add
	{
		position:fixed;
		margin-top:9%;
		float:left;
		margin-left:80%;
	}
	#dob
	{
		float:left;
		margin-left:-2.5%;
	}
	#gender
	{
		margin-top:0%;
		float:left;
		margin-left:3.5%;
	}
	
	#photo
	{
		float:left;
		margin-left:-3.6%;
	}
	#showphoto
	{
		margin-top:1.5%;
		float:left;
		margin-left:1%;
	}
	.remove_field
	{
		float:right;
		margin-right:15.5%;
		margin-top:-4%;
	}
}
/* MOBILE */
@media (max-width:767px) and (orientation: portrait)
{
	#player-bar
	{
		background:#030825;
		
		width:99.7%;
		float:left;
		border-radius:5px;
		margin-top:0.1%;
		margin-left:0.2%;
	}
	#player-text
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
	.player-container
	{
		background:#fff;
		border-radius:7px;
		width:100%;
	}
	#teamlabel
	{
		float:left;
		margin-top:2%;
	}
	#fname
	{
		float:left;
		margin-left:0.5%;
	}
	#mname
	{
		float:left;
		margin-left:-1.2%;
	}
	#lname
	{
		float:left;
		margin-left:-1.2%;
	}
	#add
	{
		margin-top:-3%;
		float:left;
		margin-left:18%;
	}
	#dob
	{
		float:left;
		margin-left:-1.2%;
	}
	#gender
	{
		margin-top:0%;
	}
	
	#photo
	{
		float:left;
		margin-left:-1%;
	}
}

</style>
<body>
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
	<div class="input_fields_wrap">
<div class="col-md-12">
			<div class="player-container">
				<div class="row" id="player-bar">
					<div class="col-xs-12 col-md-12"><br><br></div>
				</div>
				<div id="player-text">
					<b>Add Player</b>
				</div>
	
		<div class="row">
			<!-- <div class="col-md-2">
				 <div class="form-group">
			      <label for="fname"><font size="2"></font></label>
			      <input type="hidden" class="form-control" id="fname">
			    </div>
			</div>
			<div class="col-md-2">
				 <div class="form-group">
			      <label for="mname"><font size="2"></font></label>
			      <input type="hidden" class="form-control" id="mname">
			    </div>
			</div> -->
			<div class="col-md-3 col-xs-6" id="fname">
				 <div class="form-group">
			      <label for="fname" id="fnamelabel"><font size="2">First Name</font></label>
			      <input type="text" class="form-control" id="fname" placeholder="First Name" size="1">
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="mname">
				 <div class="form-group">
			      <label for="mname" id="mnamelabel"><font size="2">Middle Name</font></label>
			      <input type="text" class="form-control" id="mname" placeholder="Middle Name">
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="lname">
				 <div class="form-group">
			      <label for="lname"><font size="2">Last Name:</font></label>
			      <input type="text" class="form-control" id="lname" placeholder="Last Name">
			    </div>
			</div>
			<div class="col-md-3 col-xs-6" id="dob">
				 <div class="form-group">
			      <label for="dob"><font size="2">DOB:</font></label>
			      <input type="text" class="form-control" id="dob" placeholder="DOB">
			    </div>
			    
			</div>
			<div class="col-md-3 col-xs-12" id="gender">
					 <div class="form-group row">
					 	<label for="gender"><font size="2">Gender:</font></label><br>
				      	<label class="radio-inline" id="male">
	    			    	<input type="radio" name="gen">Male
	    				</label>
	    				<label class="radio-inline" id="female">
	      					<input type="radio" name="gen">Female
	    				</label>	
				    </div>
				</div>
		
			<div class="col-md-3 col-xs-6" id="photo">
				 <div class="form-group">
			      <label for="photo"><font size="2">Photo:</font></label>
			      <input type="file" class="form-control" name="photo" onchange="readURL(this);" size="5" placeholder="select photo" autofocus required id="year">
			    </div>
			</div>
			
			<div class="col-md-2 col-xs-6" id="showphoto">
				 <div class="form-group">
					<label for="team_name" id="teamlabel"><font size="2">Ur Photo</font></label>
						 <img id="blah" src="#" width="1" height="5" style="boder-radius:50px;" />
				 </div>
			</div>
			<div class="col-md-4 col-xs-6" id="add">
				<div class="form-group row">
					<button class="btn btn-danger add_field_button">+</button>
				</div>
			</div>
		</div>
	</div>
	</div>
	
	</div>
	</div>
</div>
</body>

</html>