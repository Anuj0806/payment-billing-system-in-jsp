<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%
                String name=request.getParameter("username");  
	        String anuj=request.getParameter("userpass");  
         try{
            Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");
            String sql="select * from admin where uesr=? and password=?";
            PreparedStatement pst=con.prepareStatement(sql);
            pst.setString(1,name);
            pst.setString(2,anuj);
            ResultSet rs=pst.executeQuery();
            if(rs.next()){
                 
               out.println("<script type=\"text/javascript\">"); 
out.println("alert('Welcom Admin');"); 
out.println("location='ahome.jsp';"); 
out.println("</script>"); 
          
            }
            else{   
    
out.println("<script type=\"text/javascript\">"); 
out.println("alert('Email and Password not Matched');"); 
out.println("location='admin.jsp';"); 
out.println("</script>"); 
          
            }
            con.close();

        }catch(Exception e){
           out.print(e);
        }
        
        %>






