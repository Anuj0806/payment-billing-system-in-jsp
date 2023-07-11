<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<%
String n=request.getParameter("val");
if(n.length()>0){
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("select * from payregister where username like '%"+n+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 id='myTable'>");
out.print("<tr><td><a href='#' name='ID' onmouseover='javascript:viewAllInfo(this.name)'><B>Username</B></a></td><td><B>UserPass</B></td><td><B>Branch</B></td><td><B>Date Of Joining</B></td><td><B>Date Of Birth</B></td><td><B>Salary</B></td></tr>");
while(rs.next()){
out.print("<tr><td><a href='#' name='"+rs.getString(1)+"' onmouseover='javascript:sendGenInfo(this.name)'>"+rs.getString(1)+"</a></td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("<td>"+rs.getString(5)+"</td>");
out.print("<td>"+rs.getString(6)+"</td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>

