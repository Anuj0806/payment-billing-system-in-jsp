<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%
String id=request.getParameter("id");
String username=request.getParameter("username");
String userpass=request.getParameter("userpass");
String dateofbirth=request.getParameter("dob");
String dateofjoining=request.getParameter("doj");
String salary=request.getParameter("salary");
String special=request.getParameter("special");
String branch=request.getParameter("branch");


try{



Class.forName("com.mysql.cj.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");
PreparedStatement ps=con.prepareStatement("insert into payregister(id,username,userpass,branch,Specialization,dateofjoining,dateofbirth,salary) values(?,?,?,?,?,?,?,?)");

//ps.setInt(1,2);
ps.setString(1,id);
ps.setString(2,username);
ps.setString(3,userpass);
ps.setString(4,branch);
ps.setString(5,special);
ps.setString(6,dateofjoining);
ps.setString(7,dateofbirth);
ps.setString(8,salary);

int s=ps.executeUpdate();



}
catch(Exception e){
out.println("<script type=\"text/javascript\">");
        out.println("alert('UserId is already exist ');");
       out.println("location='ahome.jsp';");
        out.println("</script>");

}

try{
Class.forName("com.mysql.cj.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");
PreparedStatement pts=conn.prepareStatement("insert into sal(id,name,branch,Specialization,doj,salary) values(?,?,?,?,?,?)");

pts.setString(1,id);
pts.setString(2,username);
pts.setString(3,branch);
pts.setString(4,special);
pts.setString(5,dateofjoining);
pts.setString(6,salary);

pts.executeUpdate();
 out.println("<script type=\"text/javascript\">");
        out.println("alert('Your data is suceesfully Stored');");
        out.println("location='ahome.jsp';");
        out.println("</script>");
    }
    catch(Exception e)
    {
    out.println("<script type=\"text/javascript\">");
        out.println("alert('UserId is already exist ');");
       out.println("location='ahome.jsp';");
        out.println("</script>");
    }
%>

