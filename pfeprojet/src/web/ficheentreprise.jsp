<html>

<head>
<title>Fiche : entreprise</title>
<meta charset="UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
	<header class="header">
		<a class="logo" href="http://www.desentec.fr/"><img
			src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png">
		</a>
		<p class="head">
		<center>
			<strong>Desentec - Protection incendie</strong>
		</center>
		</p>
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



	<%!String numEntreprise;
	Entreprise E;
	int num, i;
	String numeroE;%>


	<%
		session = request.getSession();
		//numeroE = (String) session.getAttribute("numeroE");
		numEntreprise = request.getParameter("numEntreprise");
		if(numEntreprise==null){
			numeroE = (String) session.getAttribute("numeroE");
			num = Integer.parseInt(numeroE);
		}
		else 
			num=Integer.parseInt(numEntreprise);
		session.setAttribute("numeroE",String.valueOf(num));
		//out.println((String) session.getAttribute("numeroE"));
		InitialContext ctx = new InitialContext();
		Object obj = ctx.lookup(
				"ejb:pfeprojet/pfeprojetSessions/" + "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");

		ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
		out.println("Fiche de l'entreprise : <br> <br> ");
		E = service.rechercheEntreprisenum(num);
		out.println("Nom de l'entreprise : " + E.getNom() + "<br><br> Adresse de l'entreprise : " + E.getAdresse()
				+ "<br><br> Num�ro de t�l�phone de l'entreprise : " + E.getTel());
		out.print(
				"<br><br> <table border=\"1\" cellpadding=\"10\" cellspacing=\"1\" width=\"100%\"> <tr><th width=\"20%\" align=\"center\"> Nom du batiment </th><th width=\"60%\" align=\"center\"> Adresse du batiment </th><th width=\"20%\" align=\"center\">  </th></tr>");
		for (i = 0; i < E.getBatiments().size(); i++) {
			out.print(" <tr><td align=\"center\"> " + E.getBatiments().get(i).getNom()
					+ "</td><td <td align=\"center\">" + E.getBatiments().get(i).getAdresse()
					+ "</td><td align=\"center\"> <form action=\"fichebatiment\" method=\"GET\" ><input type=\"hidden\" id=\"idfichebat\" name=\"numBatiment\" value="
					+ E.getBatiments().get(i).getNumero()
					+ "> <input type=\"submit\" name=\" Consulter la fiche \" value=\" Consulter la fiche \" /></form></td></tr>");
		}
		out.print("</table>");
	%>


</body>
</html>