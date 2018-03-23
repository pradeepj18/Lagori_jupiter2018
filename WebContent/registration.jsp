<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>

<body>
<form action="registration" method="get">
Name:
<input type="text" name="fname" placeholder="First Name" required>&nbsp;&nbsp;&nbsp;
<input type="text" name="lname" placeholder="Last Name" required>
<br>DOB:
<input type="date" name="dob" placeholder="DOB" required>
<br>Email Id:
<input type="email" name="emailid" placeholder="Email" required>
<br>Mobile No:
<input type="text" name="mobno" placeholder="Mobile No." minlenght="10" maxlength="10" required>
<br>
<input type="submit" name="submit" value="SUBMIT">
</form> 
</body>
</html>