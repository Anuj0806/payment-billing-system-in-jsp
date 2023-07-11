<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>

<%@ page import="java.sql.*" %>

<%
    String n = request.getParameter("val");
    String branch = request.getParameter("branch");
    String match = "Select a Branch";
//out.print(branch);
    if (branch.equals(match)) {
        out.print("Please Select the branch");
    } else {
//end of if
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");

            PreparedStatement ps = con.prepareStatement("select * from payregister where id like '%" + n + "%'  AND branch like '%" + branch + "%' ");
//ps.setString(1,n);
            out.print("<br>");
            ResultSet rs = ps.executeQuery();

            out.print("<table border='5' cellspacing=5 cellpadding=2 id='myTable'>");
            out.print("<tr><td><B>UserID</B></a></td><td><B>UserName</B></td><td><B>UserPass</B></td><td><B>Branch</B></td><td><B>Specialization</B></td><td><B>Date Of Joining</B></td><td><B>Date Of Birth</B></td><td><B>Salary</B></td></tr>");
            while (rs.next()) {
                String id = rs.getString(1);

                out.print("<td>" + rs.getString(1) + "</td>");
                out.print("<td>" + rs.getString(2) + "</td>");
                out.print("<td>" + rs.getString(3) + "</td>");
                out.print("<td>" + rs.getString(4) + "</td>");
                out.print("<td>" + rs.getString(5) + "</td>");
                out.print("<td>" + rs.getString(6) + "</td>");
                out.print("<td>" + rs.getString(7) + "</td>");
                out.print("<td>" + rs.getString(8) + "</td>");
                out.print("<td><a  href=remove.jsp?email=" + id + ">Delete Data</a></td>");
                out.print("</tr>");
            }
            out.print("</table>");
            con.close();
        } catch (Exception e) {
            out.print("invalid caracter is type");
        }

    }
%>

