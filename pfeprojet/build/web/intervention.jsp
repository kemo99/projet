<html>
<%@ page import="java.net.URL"%>
<%@ page import="java.net.URLConnection"%>
<%@ page import="java.io.* "%>
<%@ page import="ejb.sessions.*"%>
<%@ page import="ejb.entites.* "%>
<%@ page import="java.util.Collection"%>
<%@ page import="java.util.Set"%>
<%@ page import="javax.naming.InitialContext"%>
<%@ page import="javax.naming.NamingException"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.text.DateFormat"%>
<head>
<title></title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div  id="bloc_page">
	<header class="header">
		<a class="logo" href="http://www.desentec.fr/"><img
			src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png">
		</a>
		
	</header>
<%!String typeinterv, typeorg, numeroB;%>
<%
	typeinterv = request.getParameter("choixinterv");

	typeorg = request.getParameter("choixorg");

	numeroB = String.valueOf(session.getAttribute("num"));
	session.setAttribute("num", numeroB);

	if (typeinterv.compareTo("installation") == 0 && typeorg.compareTo("extincteur") == 0) {
		out.println("<meta http-equiv=\"refresh\" content=\"1; URL=installationextincteur.jsp\">");
	}
	if (typeinterv.compareTo("verification") == 0 && typeorg.compareTo("extincteur") == 0) {
		out.println("<meta http-equiv=\"refresh\" content=\"1; URL=verificationextincteur.jsp\">");
	}
%>
</div>
</body>
</html>