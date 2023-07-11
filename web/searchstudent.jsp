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
			Admin Home
		</title>
<script>
var request;
function sendInfo()
{
var branch=document.myform.select.value;
var v=document.myform.findName.value;
var url="searchstudent1.jsp?val="+v+"&branch="+branch;
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
document.getElementById('location').innerHTML=val;
}
}

function viewAll(name)
{
var v=name;
var url="aviewall.jsp?val="+v;

if(window.XMLHttpRequest){
request=new XMLHttpRequest();
}
else if(window.ActiveXObject){
request=new ActiveXObject("Microsoft.XMLHTTP");
}

try
{
request.onreadystatechange=getAllInfo;
request.open("GET",url,true);
request.send();
}
catch(e){alert("Unable to connect to server");}
}
function getAllInfo(){
if(request.readyState==4){
var val=request.responseText;
document.getElementById('bottom').innerHTML=val;
}
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
						<li class="first">
							<a href="searchstudent.jsp">Search Student Detail</a>
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


<h3 style="color: navy;" align="center"><B>HIM</B></h3>
<div id="box">
<%
if(request.getAttribute("msg")!=null){
String msg=(String)request.getAttribute("msg");
out.print("<font style='color: navy'><B>");
out.print(msg);
out.print("</B></font>");
}
%>
<form name="myform" >

    <table><tr><td><font style="color: navy;">Branch:</font></td><td><select name="findName" onfocusout="sendInfo()"  name="branch" id="select">
					<option>Select a Branch</option>
					<option>Ghaziabad</option>
					<option>Noida</option>
					<option>Delhi</option>
					<option>Sonipat</option>
					</select></td></tr>
					<tr><td><br></td></tr>
                                        <tr></tr></table>
<div id="right" align="right">
    

<!--    <a href="create.jsp"><font style="color: navy;"><B>Create New Accountant</B></font></a><br>
<a href="newadmin.jsp"><font style="color: navy;"><B>Create New Admin</B></font></a>-->
</div>

<div id="location" align="left"></div>
</form>

<div id="bottom" align="justify"></div>
<div id="getgeninfo" align="justify"></div>
</div>

</div>

</body>


<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>
