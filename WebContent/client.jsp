<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page import="java.io.*, java.net.*" %>
<HTML>
    <HEAD>
        <TITLE>Creating Client/Server Applications</TITLE>
    </HEAD>

    <BODY>
        <H1>Creating Client/Server Applications</H1>
        <% 
        try{
            int character;
            Socket socket = new Socket("127.0.0.1", 8771);

            InputStream inSocket = socket.getInputStream();
            OutputStream outSocket = socket.getOutputStream();

            String str = "Hello Appu this is client Server and i m connected with u!\n";
            byte buffer[] = str.getBytes();
            outSocket.write(buffer);
       
	        while ((character = inSocket.read()) != -1)
	        {
	          out.print((char) character);
	               // out.print("\n"+i);
	        }
	        
            socket.close();
        }
        catch(java.net.ConnectException e){
        %>
            You must first start the server application 
            (YourServer.java) at the command prompt.
        <%
        }
        %>
    </BODY>
</HTML>