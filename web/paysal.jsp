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
            .button {
                background-color: #4CAF50; /* Green */
                border: none;
                color: white;
                padding: 15px 32px;
                text-align: center;
                text-decoration: none;
                display: inline-block;
                font-size: 16px;
                border-radius: 12px;
                margin-left: 40%;
                margin-top: 18px;
            }


        </style>

        <script>
            var request;
            function sendInfo()
            {
                var v = document.myform.findName.value;
                var url = "paysal1.jsp?val=" + v;
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try
                {
                    request.onreadystatechange = getInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('hi').innerHTML = val;
                }
            }

            function sendGenInfo(name)
            {
                var v = name;
                var url = "getgeninfoname.jsp?val=" + v;
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try
                {
                    request.onreadystatechange = getGenInfo;
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }
            }

            function getGenInfo() {
                if (request.readyState == 4) {
                    var val = request.responseText;
                    document.getElementById('hello').innerHTML = val;
                }
            }


        </script>
    </head>

    <div id="outer">
        <%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
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
                                        <td><font style="color: navy;"><B>Search:</B></font><input type="text" name="findName" onkeyup="sendInfo()"></td>
                                    </tr>
                                    <tr><td><div id="hi"></div></td></tr>

                                </table>
                            </td>
                        </tr>

                    </table>


                </form>


            </div>

            <form action="payallsal.jsp">
                <input type="submit" class="button" value="Pay Bill For All Accountant">
            </form>
        </body>






        <jsp:include page="footer.jsp"></jsp:include>
    </div>
</html>