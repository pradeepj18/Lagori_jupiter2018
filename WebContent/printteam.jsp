<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="lg_DBManager.DBManager,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>printTeam</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/bootstrap.min.css">
<!-- <link href="//netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script> -->
<script src="js/jquery.min.js"></script>
<!-- <script src="//netdna.bootstrapcdn.com/bootstrap/3.3.2/js/jquery.min.js"></script> -->
<script src="js/bootstrap.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.6.3/css/font-awesome.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/css/bootstrap-select.min.css">

<!-- Latest compiled and minified JavaScript -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.11.2/js/bootstrap-select.min.js"></script>

<!-- FOR Redirecting -->
<script src="dist/sweetalert.min.js"></script>
<link rel="stylesheet" type="text/css" href="dist/sweetalert.css">
</head>
<script>
function showteam(id)
{
	var tourId = getParameter("tourId"); 
	/* var tourId = 1; */
	var gen = '';
	
	
	if(id == 1)
	{
		
		gen = 'M';
	}
	else if(id == 2)
	{
		gen = 'F';
	}

 	var xmlhttp = false;
 	if(window.XMLHttpRequest)
 	{
 		xmlhttp=new XMLHttpRequest();
 	}
 	if(xmlhttp)
	{
		xmlhttp.onreadystatechange = function()
		{
			if(xmlhttp.readyState == 4 && xmlhttp.status==200)
			{
				document.getElementById("teamlist").innerHTML=xmlhttp.responseText;
			
			}
			
		};
	}
 	xmlhttp.open("GET","printteam.jsp?tourId="+tourId+"&ttGender="+gen,true);
	xmlhttp.send(null);
}
function getParameter(variable)
{
	var query = window.location.search.substring(1);
	var vars = query.split("&");
	for(var i = 0;i < vars.length;i++)
	{
		var pair = vars[i].split("=");
		if(pair[0] == variable){return pair[1];}
	}
	return (false);
} 	
 	
	

</script>
<style>
.container
{
	float:left;
}

#male
{
	float:left;
	margin-left:35%;
	margin-top:5%;
}
#female
{
	float:left;
	margin-left:15%;
	margin-top:5%;
}
@media print
{
#male 
{
	display: none !important;
}
#female
{
	display: none !important;
}
}

</style>

<body>
<div class="container">
	<div class="row">
		<div class="col-md-4"></div>
		<div class="col-md-4">
			<button type="button" class="btn btn-default" id="male" name="gen" value="male" onclick="showteam(1)">MALE</button>
			<button type="button" class="btn btn-default"  id="female" name="gen" value="female" onclick="showteam(2)">FEMALE</button>
		
		</div>
		<div class="col-md-4"></div>
	</div>
	<br>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10" id="teamlist">
		
		</div>
		<div class="col-md-1"></div>
	</div>
	
	
</div>
</body>
</html>