
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<style>
		#nav a:hover {
    text-decoration: none;
    text-transform: uppercase;
    color:yellow;
    font-size:15px;
    background-color: navy blue;
    border:2px;
    border-color: white;
}

		</style>
<title>
			New Registration
		</title>
<script>

var request;
function sendInfo()
{
var v=document.myform.findName.value;
var url="findname1.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('hi').innerHTML=val;
}
}

function sendGenInfo(name)
{
var v=name;
var url="getgeninfoname.jsp?val="+v;
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getGenInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getGenInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('hello').innerHTML=val;
}
}



function setForm()
{
var url="setform.jsp";
if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}
try
{
request.onreadystatechange=getForm;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}

function getForm(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('hello').innerHTML=val;
}
}

function get(obj) {
      var poststr = "id=" + encodeURI( document.getElementsByName("id").value );
                    "&name=" + encodeURI( document.getElementsByName("name").value );
                    "&course=" + encodeURI( document.getElementsByName("course").value );
                    "&mobile=" + encodeURI( document.getElementsByName("mobile").value );
                    "&fathername=" + encodeURI( document.getElementsByName("fathername").value );
                    "&mothername=" + encodeURI( document.getElementsByName("mothername").value );
                    "&qualification=" + encodeURI( document.getElementsByName("qualification").value );
                    "&dateofbirth=" + encodeURI( document.getElementsByName("dateofbirth").value );
                    "&dateofjoining=" + encodeURI( document.getElementsByName("dateofjoining").value );
                    "&feesub=" + encodeURI( document.getElementsByName("feesub").value );
                    "&paid=" + encodeURI( document.getElementsByName("paid").value );
                    "&fee=" + encodeURI( document.getElementsByName("fee").value );
                    "&balance=" + encodeURI( document.getElementsByName("balance").value );
                    "&address=" + encodeURI( document.getElementsByName("address").value );
                    "&description=" + encodeURI( document.getElementsByName("description").value );
                    "&trainer=" + encodeURI( document.getElementsByName("trainer").value );
                    
      makePOSTRequest("save1.jsp", poststr);
   }

function makePOSTRequest(url, parameters) {
      http_request=false;
      if (window.XMLHttpRequest) { // Mozilla, Safari,...
         http_request = new XMLHttpRequest();
         if (http_request.overrideMimeType) {
         	// set type accordingly to anticipated content type
            //http_request.overrideMimeType('text/xml');
            http_request.overrideMimeType('text/html');
         }
      } else if (window.ActiveXObject) { // IE
         try {
            http_request = new ActiveXObject("Msxml2.XMLHTTP");
         } catch (e) {
            try {
               http_request = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {}
         }
      }
      if (!http_request) {
         alert('Cannot create XMLHTTP instance');
         return false;
      }
      
		http_request.onreadystatechange = alertContents;
     	http_request.open('POST', url, true);
     	http_request.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
      http_request.setRequestHeader("Content-length", parameters.length);
      http_request.setRequestHeader("Connection", "close");
      http_request.send(parameters);
    
   }

</script>
</head>

<div id="outer">
<%--<jsp:include page="header.jsp"></jsp:include>--%>
<div id="header">
			
				<div id="logo">
					<h1> 
						
				
						Payment Billing System 
					</h1>
				</div>	
		</div>
			<div id="banner">
			<div class="captions">
					<h2><a href="logout.jsp"><font style="color: lime">Log out</a></h2>
				</div>
		<img src="images/banner.jpg" alt="" />
								
			
			</div>
			
			<div id="nav">
					<ul>
						<li class="first">
							<a href="ahome.jsp">Home</a>
						</li>
<!--						<li>
							<a href="generalinfo.jsp">New Registration</a>
						</li>-->
						<li>
							<a href="create.jsp">Create New Accountant</a>
						</li>

                                                <li>
							<a href="newadmin.jsp">Create New Admin</a>
						</li>
                                                <li>
							<a href="paysal.jsp">Pay Salary</a>
						</li>
<!--						<li>
							<a href="admin.jsp">Administrator</a>
						</li>-->
						<li>
							<a href="contactus.jsp">Contact us</a>
						</li>
					</ul><br class="clear" />
				</div>




<body width="100">

<div id="main">
    <%
        String email=request.getParameter("email");
        data(email);
//        out.print(name);
    %>
<%!
    String name;
    String id;
  
    String mobile;
    String dos;
    String paid;
   
   String sal;
public void data(String email){

try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("select * from sal where id like '%"+email+"%'");
//ps.setString(1,n);

ResultSet rs=ps.executeQuery();


while(rs.next()){
 id=rs.getString(1);
 name=rs.getString(2);
 mobile=rs.getString(3);
 dos=rs.getString(4);
 paid=rs.getString(5);
 sal=rs.getString(6); 

}

con.close();
}catch(Exception e){e.printStackTrace();}
//end of 
}
%>
<h3 style="color: navy;" align="center"><B>Update Data Form</B></h3>
<div id="box">

<form  action="manualpay1.jsp"  name="myform" id="hello"  method="post">
<table width="100%">
<tr>
<td><table width="55%" align="left" style="table-layout: fixed;">
		<tr><td>
<table cellspacing=15 cellpadding=15">
<tr><td><font style="color:navy"><B>Student Detail:</B></font></td></tr>
<tr><td><B>ID:</B></td><td><input type="text" readonly="" value="<%=id%>" required="" name="id"></input></td></tr>
<tr><td><B>Name:</B></td><td><input type="text" value="<%=name%>"  required name="name" ></input></td></tr>
<tr><td><B>Branch:</B></td><td><input type="text" value="<%=mobile%>" required name="mobile"></input></td></tr>
<tr><td><B>Specialization:</B></td><td><input type="text" readonly="" value="<%=dos%>" required name="feesub" ></input></td></tr>
<tr><td><B>Date of Joining:</B></td><td><input type="date" required readonly="" value="<%=paid%>" name="paid" ></input></td></tr>
<tr><td><B>Salary:</B></td><td><input type="text" required value="<%=sal%>" name="trainer"></input></td></tr>
<tr><td></td><td><input style="padding:3px 3px" value="Pay Bill" type="submit"></td></tr>
</table>

		
</table>

</td>
</tr>

</table>


</form>


</div>

</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>