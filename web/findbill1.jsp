<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page isELIgnored="true" %>

<%
String n=request.getParameter("val");
Object bran=session.getAttribute("branch");
    String branch=String.valueOf(bran);

if(n.length()>0){
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("select * from student2 where id like '%"+n+"%' and branch like '%"+branch+"%'");
//ps.setString(1,n);
out.print("<br>");
ResultSet rs=ps.executeQuery();

out.print("<table border='5' cellspacing=5 cellpadding=2 width='100%' id='myTable'>");
out.print("<tr><td><B>ID</B></td><td><B>Name</B></td><td><B>Course</B></td><td><B>Date Of Submission</B></td><td><B>Paid</B></td><td><B>Fee</B></td><td><B>Balance</B></td>><td><B>Grand Total</B></td><td><B>Date Of Joining</B></td></tr>");
while(rs.next()){
String id=rs.getString(1);
out.print("<td>"+rs.getString(1)+"</td>");
out.print("<td>"+rs.getString(2)+"</td>");
out.print("<td>"+rs.getString(3)+"</td>");
//out.print("<td>"+rs.getString(4)+"</td>");
out.print("<td>"+rs.getString(5)+"</td>");
out.print("<td>"+rs.getString(6)+"</td>");
out.print("<td>"+rs.getString(7)+"</td>");
out.print("<td>"+rs.getString(8)+"</td>");
out.print("<td>"+rs.getString(9)+"</td>");
//out.print("<td>"+rs.getString(10)+"</td>");
//out.print("<td>"+rs.getString(11)+"</td>");
//out.print("<td>"+rs.getString(12)+"</td>");
//out.print("<td>"+rs.getString(13)+"</td>");
//out.print("<td>"+rs.getString(14)+"</td>");
out.print("<td>"+rs.getString(15)+"</td>");
//out.print("<td>"+rs.getString(16)+"</td>");
out.print("<td><a  href=paybill.jsp?email="+id+">Pay Bill</a></td>");
out.print("</tr>");
}
out.print("</table>");
con.close();
}catch(Exception e){e.printStackTrace();}
}//end of if
%>
