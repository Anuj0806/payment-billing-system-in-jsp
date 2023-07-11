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
    String paid = request.getParameter("paid");
    String fee = request.getParameter("fee");
    String balance = request.getParameter("balance");
    String address = request.getParameter("address");
    String description = request.getParameter("description");
    String trainer = request.getParameter("trainer");

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
    int b=Integer.valueOf(prize)-Integer.valueOf(paid);
    int p=Integer.valueOf(paid);
    int a=Integer.valueOf(prize);
//    int bal= a-p;
    
    
    
    if(p>=a){
    
    
    try {
    int bal=0;
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
//       
        PreparedStatement ptst = con.prepareStatement("update student2 set name='"+name+"',course='"+course+"',mobile='"+mobile+"',addr='"+address+"',trainer='"+trainer+"',description='"+description+"',dob='"+dateofbirth+"',doj='"+dateofjoining+"',qualification='"+qualification+"',dos='"+feesub+"',fee='"+fee+"',paid='"+prize+"',balance='"+bal+"',grandtotal='"+prize+"',fathername='"+fathername+"',mothername='"+mothername+"'  where id= '"+id+"'");
//       
        ptst.executeUpdate();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your data is suceesfully updated');");
        out.println("location='modify.jsp';");
        out.println("</script>");

    } catch (Exception e) {
        
//        out.print(e);
    }
    ///////////////////////////////////////////////////////////////////////////////
    
    try {
    int bal=0;
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        String sql="insert into pay values(?,?,?,?,?,?,?)";
                        PreparedStatement ps = con.prepareStatement(sql);
                        ps.setString(1, id);
                        ps.setString(2, name);
                        ps.setString(3, feesub);
                        ps.setString(4, fee);
                        ps.setString(5, prize);
                        ps.setString(6, String.valueOf(bal));
                        ps.setString(7, prize);
                         ps.setString(8, id);
                        ps.executeUpdate();
                    } catch (Exception e)
                    {
                      out.print(e);
                    }
    
    
    }
    else{
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
//       
        PreparedStatement ptst = con.prepareStatement("update student2 set name='"+name+"',course='"+course+"',mobile='"+mobile+"',addr='"+address+"',trainer='"+trainer+"',description='"+description+"',dob='"+dateofbirth+"',doj='"+dateofjoining+"',qualification='"+qualification+"',dos='"+feesub+"',fee='"+fee+"',paid='"+paid+"',balance='"+b+"',grandtotal='"+prize+"',fathername='"+fathername+"',mothername='"+mothername+"'  where id= '"+id+"'");
//       
        ptst.executeUpdate();
        out.println("<script type=\"text/javascript\">");
        out.println("alert('Your data is suceesfully updated');");
        out.println("location='modify.jsp';");
        out.println("</script>");

    } catch (Exception e) {
        
        out.print(e);
    }
////////////////////////////////////    
try {
    
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/payment", "root", "Anuj0806$");
                        PreparedStatement ps = con.prepareStatement("insert into pay values(?,?,?,?,?,?,?)");
                        ps.setString(1, id);
                        ps.setString(2, name);
                        ps.setString(3, feesub);
                        ps.setString(4, paid);
                        ps.setString(5, fee);
                        ps.setString(6, String.valueOf(b));
                        ps.setString(7, prize);
                        ps.executeUpdate();
                    } catch (Exception e2)
                    {
                        out.print(e2);
                    }
    
    
    
    }

%>