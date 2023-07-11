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

<script>
var request;
function sendInfo()
{
var v=document.myform.findName.value;
var url="findname.jsp?val="+v;
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


</script>
</head>

<div id="outer">
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>






<body>
<h3 style="color: navy;" align="center"><B>Consultant:- HIM</B></h3>
<div id="box">

<form action="save.jsp" name="myform" id="hello" method="post">
<table width="100%">
<tr>
<td><table width="55%" align="left" style="table-layout: fixed;">
		<tr><td>


		
		</table>
<table align="right" width="100%" >
<tr>
<td><font style="color: navy;"><B>Search:</B></font><input type="text" name="findName" onkeyup="sendInfo()"></input></td>
</tr>
<tr><td><div id="hi"></div></td></tr>

</table>
</td>
</tr>

</table>


</form>


</div>
</body>






<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>