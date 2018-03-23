<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Server</title>
</head>
<body>
<%@ page import="java.net.*" %>
<%@ page import="java.io.*" %>
<%! void callserver()
{
	try
	{
		System.out.println("ASAA");
		ServerSocket socket = new ServerSocket(8771);
		
		Socket insocket = socket.accept();
		System.out.println("AZAD");
		BufferedReader in = new BufferedReader (new InputStreamReader(insocket.getInputStream()));
		PrintWriter myout = new PrintWriter (insocket.getOutputStream(),true);
		
		String instring = in.readLine();
		System.out.println("The server got this: " + instring);
		
		insocket.close();
		socket.close();
		callserver();
	}
	catch(Exception e)
	{
		System.out.println("Server "+e);
	}
}
%>
<input type="button" onclick="<%callserver(); %>">CLICK ON IT
</body>
</html>