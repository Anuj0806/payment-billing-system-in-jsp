<%@page import="java.util.Calendar"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%!
    String prize;
    
%>
<%
    Object bran=session.getAttribute("branch");
    String branch=String.valueOf(bran);
//System.out.print(request.getParameter("name"));
    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String course = request.getParameter("course");
    String mobile = request.getParameter("mobile");
    String fathername = request.getParameter("fathername");
    String mothername = request.getParameter("mothername");
    String qualification = request.getParameter("qualification");
    String dateofbirth = request.getParameter("dateofbirth");
    String dateofjoining = request.getParameter("dateofjoining");
    String feesub = request.getParameter("feesub");
    //String paid = request.getParameter("paid");
    String fee = request.getParameter("fee");
    // String balance = request.getParameter("balance");
    String address = request.getParameter("address");
    String description = request.getParameter("description");
    String trainer = request.getParameter("trainer");

//int d=Integer.valueOf(dateofjoining);
//int dob=Integer.valueOf(dateofbirth);
//int sub=d-dob;
//out.print(sub);
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");

        PreparedStatement ps = con.prepareStatement("select charge from charge where language like '%" + course + "%'");
//ps.setString(1,n);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            prize = rs.getString(1);
        }

    } catch (Exception e) {
//out.print(e);
    }
    out.print(prize);
    int b = Integer.valueOf(prize);
    int f = Integer.valueOf(fee);
 String a=String.valueOf(b-f);
    String current_date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
//out.print(current_date);
    LocalDate fday = LocalDate.parse(dateofbirth);
    LocalDate tday = LocalDate.parse(dateofjoining);

    Long day_gap = ChronoUnit.YEARS.between(fday, tday);
//               out.print(day_gap);\

    if (day_gap > 18) {

        if (dateofjoining.compareTo(current_date) >= 0) {            
                if (b >= f) {
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        PreparedStatement ps = con.prepareStatement("insert into pay values(?,?,?,?,?,?,?,?)");
                        ps.setString(1, id);
                        ps.setString(2, name);
                        ps.setString(3, feesub);
                        ps.setString(4, fee);
                        ps.setString(5, fee);
                        ps.setString(6, a);
                        ps.setString(7, prize);
                        ps.setString(8, branch);                        
                        ps.executeUpdate();
                    } catch (SQLException e2)
                    {
                        e2.printStackTrace();
                    }
                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        PreparedStatement ps = con.prepareStatement("insert into student2 values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");

                        ps.setString(1, id);
                        ps.setString(2, name);
                        ps.setString(3, course);
                        ps.setString(4, mobile);
                        ps.setString(5, feesub);
                        ps.setString(6, fee);
                        ps.setString(7, fee);
                        ps.setString(8, a);
                        ps.setString(9, prize);
                        ps.setString(10, address);
                        ps.setString(11, fathername);
                        ps.setString(12, mothername);
                        ps.setString(13, dateofbirth);
                        ps.setString(14, qualification);
                        ps.setString(15, dateofjoining);
                        ps.setString(16, description);
                        ps.setString(17, trainer);
                        ps.setString(18, branch);
                        ps.executeUpdate();
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('Data store suceesfully');");
                        out.println("location='generalinfo.jsp';");
                        out.println("</script>");
                    } catch (SQLException e2) {

                        out.print(e2);
                        out.println("<script type=\"text/javascript\">");
                        out.println("alert('ID  is already exist');");
                        out.println("location='generalinfo.jsp';");
                        out.println("</script>");
                    }
                } else {
                    out.println("<script type=\"text/javascript\">");
                    out.println("alert('Fee value is greater than balance');");
                    out.println("location='generalinfo.jsp';");
                    out.println("</script>");
                }
           
        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Joining Date incorrect');");
            out.println("location='generalinfo.jsp';");
            out.println("</script>");
        }
    } else {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Age Must Be greater than 18');");
        out.println("location='generalinfo.jsp';");
        out.println("</script>");
    }


%>

