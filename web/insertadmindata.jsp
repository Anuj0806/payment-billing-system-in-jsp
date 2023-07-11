<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%try{

String username=request.getParameter("username");
String userpass=request.getParameter("userpass");

Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");
PreparedStatement ps=con.prepareStatement("insert into admin(uesr,password) values(?,?)");

//ps.setInt(1,2);
ps.setString(1,username);
ps.setString(2,userpass);


ps.executeUpdate();
out.println("<script type=\"text/javascript\">"); 
out.println("alert('new admin create sucessfully');"); 
out.println("location='ahome.jsp';"); 
out.println("</script>");
//System.out.print(s);
}
catch(SQLException e2){
out.print(e2);
}
%>

