<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.time.LocalDate"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.awt.HeadlessException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%!
    String prize;
    
%>

<%
 

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");

       PreparedStatement ps = con.prepareStatement("select doj from sal where id like '%" + 1 + "%'");
//ps.setString(1,n);

        ResultSet rs = ps.executeQuery();
        while (rs.next()) {
            prize = rs.getString(1);
        }

    } catch (Exception e) {
out.print(e);
    }
  
  
    
     String current_date = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
//out.print(current_date);
    LocalDate fday = LocalDate.parse(prize);
    LocalDate tday = LocalDate.parse(current_date);

    Long day_gap = ChronoUnit.DAYS.between(tday, fday);
//            out.print(day_gap);
  if(day_gap<30){
   out.println("<script type=\"text/javascript\">");
        out.println("alert('date gap is less than 30');");
        out.println("location='paysal.jsp';");
        out.println("</script>");
    }
    else{
     try {
    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        String sql="update sal set doj='"+current_date+"'";
                        PreparedStatement ps = con.prepareStatement(sql);                                          
                       ps.executeUpdate();
 out.println("<script type=\"text/javascript\">");
        out.println("alert('Salary Paid Suceessfully');");
        out.println("location='paysal.jsp';");
        out.println("</script>");
                    } catch (Exception e)
                    {
                      out.print(e);
    }
//    
//    
    }
   
////////////////////////////////////    

    

%>