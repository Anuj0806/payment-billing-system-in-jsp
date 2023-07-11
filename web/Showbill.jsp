<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<html>
<head>
<style>
#nav a:hover {
	text-decoration: none;
	text-transform: uppercase;
	color: yellow;
	font-size: 15px;
	background-color: navy blue;
	border: 2px;
	border-color: white;
}
</style>

<title>Search</title>
<script>
	var request;
	function sendInfo() {
		var v = document.myform.findName.value;
		var url = "Showbill1.jsp?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
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
			document.getElementById('location').innerHTML = val;
		}
	}

	function sendGenInfo(name) {
		var v = name;
		var url = "getgeninfo.jsp?val=" + v;
		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}
		try {
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
			document.getElementById('getgeninfo').innerHTML = val;
		}
	}

	function getAllInfo() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('bottom').innerHTML = val;
		}
	}

	function getAllRec() {
		if (request.readyState == 4) {
			var val = request.responseText;
			document.getElementById('right').innerHTML = val;
		}
	}

	function viewAll(name) {
		var v = name;
		var url = "viewall.jsp?val=" + v;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getAllInfo;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}

	function viewAllInfo(name) {
		var v = name;
		var url = "viewallinfo.jsp?val=" + v;

		if (window.XMLHttpRequest) {
			request = new XMLHttpRequest();
		} else if (window.ActiveXObject) {
			request = new ActiveXObject("Microsoft.XMLHTTP");
		}

		try {
			request.onreadystatechange = getAllRec;
			request.open("GET", url, true);
			request.send();
		} catch (e) {
			alert("Unable to connect to server");
		}
	}
</script>
</head>

<div id="outer">
	<jsp:include page="header.jsp"></jsp:include>


	


	<body width="100">

		<div id="main">


			<h3 style="color: navy;" align="center">
				<B>Find Payment Details</B>
			</h3>
			<div id="box">

				<form name="myform">
					<font style="color: navy;">Search Name:-</font> <input type="text"
						align="right" name="findName" onkeyup="sendInfo()"></input>
					<div id="right" align="right"></div>

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