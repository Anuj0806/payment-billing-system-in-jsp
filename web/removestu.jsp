<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>

<%
String email=request.getParameter("email");


try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("delete from student2 where id ='"+email+"'");
ps.executeUpdate();
con.close();
 
}catch(Exception e)
{
out.print(e);
    }
    
try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("delete from pay where id ='"+email+"'");
ps.executeUpdate();
con.close();
 out.println("<script type=\"text/javascript\">");
        out.println("alert('Your data is suceesfully deleted');");
        out.println("location='home.jsp';");
        out.println("</script>");
}catch(Exception e)
{
out.print(e);
    }


%>