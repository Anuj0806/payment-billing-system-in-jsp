<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page isELIgnored="true" %>

<%
String n=request.getParameter("val");

if(n.length()>0){
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("select * from payregister where Specialization like '%"+n+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 width='100%' id='myTable'>");
out.print("<tr><td><B>ID</B></td><td><B>Name</B></td><td><B>Branch</B></td><td><B>Specialization</B></td><td><B>Date Of Joining</B></td><td><B>Salary</B></td></tr>");
while(rs.next()){
String id=rs.getString(1);
out.print("<td>"+rs.getString(1)+"</td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("<td>"+rs.getString(5)+"</td>");
out.print("<td>"+rs.getString(6)+"</td>");
out.print("<td>"+rs.getString(8)+"</td>");


out.print("<td><a  href=manualpay.jsp?email="+id+">Pay Bill</a></td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
