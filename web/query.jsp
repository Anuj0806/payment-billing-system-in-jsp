<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%//try{
//String query=request.getParameter("query");
//String email=request.getParameter("email");
//Class.forName("com.mysql.cj.jdbc.Driver");
//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","root");
//PreparedStatement ps=con.prepareStatement("insert into query values(?,?)");
//ps.setString(1,query);
//ps.setString(2,email);
//int s=ps.executeUpdate();
out.println("<script type=\"text/javascript\">");
        out.println("alert('Meesage Sent sucessfully');");
        out.println("location='contactus.jsp';");
        out.println("</script>");
//}catch(Exception e){e.printStackTrace();}
%>
//