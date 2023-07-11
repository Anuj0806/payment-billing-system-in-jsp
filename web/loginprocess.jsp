<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%
    String username = request.getParameter("username");

    String userpass = request.getParameter("userpass");
    String branch = request.getParameter("branch");
session.setAttribute("branch", branch);
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
        PreparedStatement pst = con.prepareStatement("select * from payregister where username=? and userpass=? and branch=? ");
        pst.setString(1, username);
        pst.setString(2, userpass);
        pst.setString(3, branch);
        ResultSet rs = pst.executeQuery();
        if (rs.next()) {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Welcom Accountant');");
            out.println("location='home.jsp';");
            out.println("</script>");

        } else {

            out.println("<script type=\"text/javascript\">");
            out.println("alert('Detail Not Matched');");
            out.println("location='index.jsp';");
            out.println("</script>");

        }
        con.close();

    } catch (Exception e) {
        out.print(e);
    }
%>