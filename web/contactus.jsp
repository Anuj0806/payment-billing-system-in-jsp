
<div id="outer">
<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<jsp:include page="header.jsp"></jsp:include>
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
		</head>
		</html>>





<body>
<Font style="color: navy;" size="4">Contact Us:</Font>
<form method="post" name="myform" id="myform" action="query.jsp">
<table width="100%">
<tr>
<td>
<table width="55%" align="left" >
<tr><td><img src="images/pic01.jpg"/></td>
<td><Font style="color: navy;" size="3"><B>Your Query:</B></Font><br>

    <textarea name="query" required="" style="width: 600px; height:80px"></textarea><br>
<Font style="color: navy;" size="2"><B>Email:</B></Font><input type="text" required="" name="email" style="width: 180px; "/>
<input type="submit" value="submit" style="padding: 2px 2px" >
</td>
</tr>
</table>
</td>
<td>
<table align="right" >
<tr align="left"><td><Font style="color: navy;" size="3">Cont No.:1234567890</Font><br>
<Font style="color: navy;" size="3">Email id:gmail.com</Font><br>
<Font style="color: navy;" size="3">Contact Person: Sagar</Font>
</td></tr>
</table>
</td>
</tr>

</table>
</form>
</body>

<jsp:include page="footer.jsp"></jsp:include>
</div>
</html>