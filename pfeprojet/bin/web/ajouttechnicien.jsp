<html>

<head>
<title>Ajout d'une Entreprise</title>
<meta charset="UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header class="header">
		<a class="logo" href="http://www.desentec.fr/"><img
			src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png">
		</a>
		<p class="head">
		
	</header>
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
	<%@ page import="java.util.HashSet"%>



	<%!String nomTechnicien, prenomTechnicien, adresseTechnicien, telTechnicien, emailTechnicien;
	int num,id;%>


	<%
		nomTechnicien = request.getParameter("nomTechnicien");
		prenomTechnicien = request.getParameter("prenomTechnicien");
		adresseTechnicien = request.getParameter("adresse");
		telTechnicien = request.getParameter("telTechnicien");
		emailTechnicien = request.getParameter("adresseemail");
		session = request.getSession();
		InitialContext ctx = new InitialContext();
		Object obj = ctx.lookup(
				"ejb:pfeprojet/pfeprojetSessions/" + "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
		ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
		
		service.ajouterTechnicien(nomTechnicien,prenomTechnicien,adresseTechnicien,telTechnicien,emailTechnicien);    			

		service.creercompteTechnicien(service.rechercheTechnicienemail(emailTechnicien).getNumero());
		
		out.println("<center>Ajout effectu� avec succ�s<br>");
		out.println("<a href=\"administrateur.html\">retour � la page d'accueil</a></center>");
	%>
</body>
</html>