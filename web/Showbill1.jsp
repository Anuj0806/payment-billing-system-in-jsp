<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page isELIgnored="true" %>

<%
String n=request.getParameter("val");

if(n.length()>0){
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("SELECT * FROM pay where id like '%"+n+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 width='100%' id='myTable'>");
out.print("<tr><td><B>ID</B></td><td><B>Name</B></td><td><B>Date Of Submission</B></td><td><B>Paid</B></td><td><B>Fee</B></td><td><B>Balance</B></td>><td><B>Grand Total</B></td></tr>");
while(rs.next()){

out.print("<td>"+rs.getString(1)+"</td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
out.print("<td>"+rs.getString(4)+"</td>");
out.print("<td>"+rs.getString(5)+"</td>");
out.print("<td>"+rs.getString(6)+"</td>");
out.print("<td>"+rs.getString(7)+"</td>");
out.print("<td><a href='printbill.jsp?val="+rs.getString(1)+"&name="+rs.getString(2)+"&paid="+rs.getString(4)+"&fee="+rs.getString(5)+"&balance="+rs.getString(6)+"&gtotal="+rs.getString(7)+"'>Print Bill</a></td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
