
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
<jsp:include page="header.jsp"></jsp:include>

<%
String islogin=(String)session.getAttribute("islogin");
if(islogin==null){
request.setAttribute("notlogin_msg","Sorry,Please do Login first");
%>
<jsp:forward page="index.jsp"></jsp:forward>
<%
}
%>


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
    String course;
    String mobile;
    String dos;
    String paid;
    String fee;
    String balance;
    String grandt;
    String add;
    String father;
    String mother;
    String trai;
    String des;String doj;
    String quali;String dob;
public void data(String email){

try{
Class.forName("com.mysql.cj.jdbc.Driver");
 Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/payment","root","Anuj0806$");

PreparedStatement ps=con.prepareStatement("select * from student2 where id like '%"+email+"%'");
//ps.setString(1,n);

ResultSet rs=ps.executeQuery();


while(rs.next()){
 id=rs.getString(1);
 name=rs.getString(2);
course=rs.getString(3);
 mobile=rs.getString(4);
 dos=rs.getString(5);
 paid=rs.getString(6);
 fee=rs.getString(7);
 balance=rs.getString(8);
grandt=rs.getString(9);
 add=rs.getString(10);
 father=rs.getString(11);
 mother=rs.getString(12);
 dob=rs.getString(13);
 quali=rs.getString(14);
 doj=rs.getString(15);
 des=rs.getString(16);
 trai=rs.getString(17);

}

con.close();
}catch(Exception e){e.printStackTrace();}
//end of 
}
%>
<h3 style="color: navy;" align="center"><B>Update Data Form</B></h3>
<div id="box">

<form  action="save2.jsp"  name="myform" id="hello"  method="post">
<table width="100%">
<tr>
<td><table width="55%" align="left" style="table-layout: fixed;">
		<tr><td>
<table cellspacing=15 cellpadding=15">
<tr><td><font style="color:navy"><B>Student Detail:</B></font></td></tr>
<tr><td><B>ID:</B></td><td><input type="text" readonly="" value="<%=id%>" required="" name="id"></input></td></tr>
<tr><td><B>Name:</B></td><td><input type="text" value="<%=name%>"  required name="name" ></input></td></tr>
<tr><td><B>Course:</B></td><td><select  name="course" >
            <option ><%=course%></option>                                           
                                            <option>Full Stack Developer</option>
                                            <option>Python</option>
                                            <option>java</option>
                                        </select></td></tr>
<tr><td><B>Mobile:</B></td><td><input type="text" value="<%=mobile%>" required name="mobile"></input></td></tr>
<tr><td><B>Father's Name:</B></td><td><input type="text"  value="<%=father%>" required name="fathername"></input></td></tr>
<tr><td><B>Mother's Name:</B></td><td><input type="text"  required value="<%=mother%>" name="mothername"></input></td></tr>
<tr><td><B>Qualification:</B></td><td><input type="text"  required value="<%=quali%>" name="qualification"></input></td></tr>
<tr><td><B>Date of Birth:</B></td><td><input type="date" readonly="" value="<%=dob%>" required name="dateofbirth"></input></td></tr>
<tr><td><B>Date of Joining:</B></td><td><input type="date" readonly="" value="<%=doj%>" required name="dateofjoining" ></input></td></tr>
<tr><td><B>Date of Submission:</B></td><td><input type="date" readonly="" value="<%=dos%>" required name="feesub" ></input></td></tr>
<tr><td><B>Paid:</B></td><td><input type="text" required readonly="" value="<%=paid%>" name="paid" ></input></td></tr>
<tr><td><B>Fee:</B></td><td><input type="text" required readonly="" name="fee" value="<%=fee%>" ></input></td></tr>
<tr><td><B>Balance:</B></td><td><input type="text" required readonly="" name="balance" value="<%=balance%>" ></input></td></tr>
<tr><td><B>Grand Total:</B></td><td><input type="text" required readonly="" name="balance" value="<%=grandt%>" ></input></td></tr>
<tr><td><B>Address:</B></td><td><input type="text" required value="<%=add%>" name="address"></input></td></tr>
<tr><td><B>Description:</B></td><td><input type="text" value="<%=des%>" required name="description"></input></td></tr>
<tr><td><B>Trainer:</B></td><td><input type="text" required value="<%=trai%>" name="trainer"></input></td></tr>
<tr><td></td><td><input style="padding:3px 3px" value="Update Data" type="submit"></td></tr>
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