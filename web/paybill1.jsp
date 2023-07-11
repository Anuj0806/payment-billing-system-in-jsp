<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%!
    int paid1;
    String fee1;
    int grand;
    int total;
%>

<%

    String id = request.getParameter("id");
    String name = request.getParameter("name");
    String feesub = request.getParameter("feesub");
    String paid = request.getParameter("paid");
    String fee = request.getParameter("fee");
    String balance = request.getParameter("balance");

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
        PreparedStatement ps = con.prepareStatement("select * from student2 where id like '%" + id + "%'");
        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            paid1 = Integer.valueOf(rs.getString(6));
            fee1 = rs.getString(7);
            grand = Integer.valueOf(rs.getString(9));
        }
    } catch (Exception e) {

    }

    if (grand <= paid1) {
        out.println("<script type=\"text/javascript\">");
        out.println("alert('You Paid Your Full Payment');");
        out.println("location='paybill.jsp';");
        out.println("</script>");
    } else {
        total = Integer.valueOf(paid1) + Integer.valueOf(fee);
        int bal=grand-total;
        if (grand >= total) {
            // String current_date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());

           try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        PreparedStatement ps = con.prepareStatement("insert into pay values(?,?,?,?,?,?,?)");
                        ps.setString(1, id);
                        ps.setString(2, name);
                        ps.setString(3, feesub);
                        ps.setString(4, String.valueOf(total));
                        ps.setString(5, fee);
                        ps.setString(6, String.valueOf(bal));
                        ps.setString(7, String.valueOf(grand));
                        ps.executeUpdate();
                    } catch (SQLException e2)
                    {
                        e2.printStackTrace();
                    }
            ///////////////////////////////////////////////////////////////////////////////////////////////////////
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
//       
                PreparedStatement ptst = con.prepareStatement("update student2  set dos='" + feesub + "',paid='" + total + "',fee='" + fee + "',balance='" + bal + "'  where id= '" + id + "'");
//       
                ptst.executeUpdate();
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Your Payment is sucessfully done');");
                out.println("location='findbill.jsp';");
                out.println("</script>");

            } catch (Exception e) {

                out.print(e);
            }

        } else {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Paid value is greater than Grand Total');");
            out.println("location='paybill.jsp';");
            out.println("</script>");
        }

    }


%>