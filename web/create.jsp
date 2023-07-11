<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
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
		</html>
		
<div id="main">

<h3 style="color: navy;" align="center"><B>Consultant:- HIM</B></h3>
<div id="box">

<form name="myform" action="asave.jsp">
<table>
    <tr><td>UserID:  </td><td><input type="text" name="id"/></td></tr>
	<tr><td><br></td></tr>
<tr><td>Branch:</td><td><select name="branch">
					<option>Select a Branch</option>
					<option>Ghaziabad</option>
					<option>Noida</option>
					<option>Delhi</option>
					</select></td></tr>
					<tr><td><br></td></tr>
<tr><td>Username:  </td><td><input type="text" name="username"/></td></tr>
	<tr><td><br></td></tr>
	
<tr><td>Password:  </td><td><input type="password" name="userpass"/></td></tr>
	<tr><td><br></td></tr>
        <tr><td>Specialization </td><td><input type="text" name="special"/></td></tr>
	<tr><td><br></td></tr>
<tr><td>Date of Joining:</td><td><input type="date" name="doj"/></td></tr>
	<tr><td><br></td></tr>
<tr><td>Date of Birth:</td><td><input type="date" name="dob"/></td></tr>
	<tr><td><br></td></tr>
	<tr><td>Salary:</td><td><input type="text" name="salary"/></td></tr>
	<tr><td><br></td></tr>
		<tr><td></td><td><input type="submit" value="create" style="padding: 2"></td></tr>
	<tr><td><br></td></tr>
</table>
<div id="location" align="left"></div>
</form>

</div>

</div>




<jsp:include page="footer.jsp"></jsp:include>

</div>

</html>
