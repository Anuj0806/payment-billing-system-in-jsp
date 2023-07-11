<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link href="print_style.css" rel="stylesheet">
    <meta charset="utf-8">

    <!-- Load paper.css for happy printing -->
    <link rel="stylesheet" href="paper.css">
    <link rel="stylesheet" href="normalize.css">

    <!-- Set page size here: A5, A4 or A3 -->
    <!-- Set also "landscape" if you need -->
    
    <script>
       function myFunction() {
           var printButton = document.getElementById("printpagebutton");
       var printButton1 = document.getElementById("printbutton");
        printButton.style.visibility = 'hidden';
        printButton1.style.visibility = 'hidden';
          window.print(); 
           printButton.style.visibility = 'visible';
           printButton1.style.visibility = 'visible';
       }
        function goToInfo(){
       window.location = 'Showbill.jsp';
   }
    </script>
    
    <style>@page {
        size: A4 portrait;
        margin-top: 8px;
        margin-bottom: 10px;
        margin-left: 20px;
    }</style>
    <style>
        #box_data.box-body{
            padding: 6px 10px 60px 10px;
        }
        /* Three image containers (use 25% for four, and 50% for two, etc) */
        .column {
            float: left;
            padding: 5px;
        }

        /* Clear floats after image containers */
        .row::after {
            content: "";
            clear: both;
            display: table;
        }

        table tbody tr td {
            padding: 2px !important;
            line-height: 1.35 !important;
        }

        @media print {
            .box-body {
                margin-top: 10px !important;
                margin-bottom: 10px;
            }
        }
    </style>

    <script>
        /*window.onload = function () {
          window.print();
           window.top.close();
        }*/
    </script>
    <style>
        .center-me {
            font-size: 15px;
            margin: auto;
            height: 10px;
            max-width: 500px;
            margin: 75px auto 40px auto;
            display: flex;
        }
    </style>
</head>
<!-- Set "A5", "A4" or "A3" for class name -->
<!-- Set also "landscape" if you need -->
<body class="A4 portrait">

<!-- Each sheet element should have the class "sheet" -->
<!-- "padding-**mm" is optional: you can set 10, 15, 20 or 25 -->
<section class="sheet" id="content-print">
    <style>
        table {
            /*border-collapse: unset !important;*/
        }
    </style>
    <%!
    String name;
    String course;
    String gtotal;
    String balance;
    String fee;
    String paid;
    int ammount;
    
    %>
<%
String id=request.getParameter("val");
 name=request.getParameter("name");
 paid=request.getParameter("paid");
 fee=request.getParameter("fee");
 balance=request.getParameter("balance");
 gtotal=request.getParameter("gtotal");

///////////////////////////////////////////////////////////////////////////////////
try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");
String sql="SELECT course FROM student2 where id like '%"+id+"%'";
PreparedStatement ps=con.prepareStatement(sql);


ResultSet rs=ps.executeQuery();
while(rs.next()){
course=rs.getString(1);
//out.print(course);
    }
con.close();
}catch(Exception e)
{
out.print(e);
}

ammount= Integer.valueOf(gtotal)-Integer.valueOf(paid);

%>
    <div class="box-body" id="box_data" style="display: flex;padding: 6px 10px 60px 10px;;margin-bottom: -21px; background-color: aliceblue;">
        <div style="width: 100%;padding-right: 10px;" class="col-md-12">
            <div class="row">
                <div class="col-lg-4" style="width: 70%;padding-left: 20px;">
                    <h4>INVOICE</h4>
                </div>
                
            </div>
            
            <br>

            <table width="100%" border="1">
                <tr style="background: rgba(217,225,242,1.0)">
                    <th class="text-center" colspan="2" style="width: 25%;">Payment Bill</th>
                </tr>
                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">Student ID</th>
                    <th><%=id%></th>
                </tr>
                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">Student Name</th>
                    <th><%=name%></th>
                </tr>
                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">Course</th>
                    <th><%=course%></th>
                </tr>
<!--                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">City State ZIp</th>
                    <th></th>
                </tr>
                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">Phone</th>
                    <th></th>
                </tr>
                <tr>
                    <th style="width: 5%;font-size: 12px;background: rgba(217,225,242,1.0)">Email Address</th>
                    <th></th>
                </tr>-->
            </table>
            <br>
            <table width="100%" border="1px">
                <tr style="background: rgba(217,225,242,1.0);">
                   
                    <th class="text-center" colspan="3">
                        Paid
                    </th>
                    <th class="text-center">
                       Fee
                    </th>
                    <th class="text-center">
                        Balance
                    </th>
                    <th class="text-center">
                        Grand Total
                    </th>
                </tr>
                <tbody>
                    <tr ><td colspan="3" style="text-align: center;"><%=paid%></td><td style="text-align: center;"><%=fee%></td><td style="text-align: center;"><%=balance%></td><td style="text-align: center;"><%=gtotal%></td></tr>
<!--                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>
                <tr><td>1</td><td colspan="3">iPhone xs Plus</td><td>20000</td><td>1</td><td>20000</td></tr>-->
                </tbody>
               
            </table>
            <table>
                
               
                <tr style="background: rgba(217,225,242,1.0); margin-top: 68px;">

                    <pre>Remaining Amount        <%=ammount%></pre>
                </tr>
             
            </table>
            <br>
            <input style="margin-left: 35%"  id="printpagebutton" type="button" onclick="myFunction()" value="Print">
<input type="button"  id="printbutton" onclick="goToInfo()" value="Cancel">
        </div>

    </div>

</section>

</body>
</html>