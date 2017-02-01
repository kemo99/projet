<html>

<head>
<title>Fiche : entreprise</title>
<meta charset="UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css">
<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.0/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <link rel="stylesheet" type="text/css" href="datatables.css" />
    <script type="text/javascript" src="jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.css"/>
 
    <script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.12/datatables.min.js"></script>

    <script type="text/javascript" charset="utf-8">


     $(document).ready(function(){
     $('#datatables').dataTable();
    
     })

    </script>
</head>
<body>
<div  id="bloc_page">
	<header class="header">
		<a class="logo" href="http://www.desentec.fr/"><img
			src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png">
		</a>
		
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
	<%@ page import="java.util.List"%>



	<%!String numEntreprise;
	Entreprise E;
	int num, i;
	String numeroE;
	List<Batiment> batiment;
	%>
	<!--  
<div style="padding:5px; width:300px; margin:auto; border:8px solid #67ab9f;  -moz-border-radius:20px; -khtml-border-radius:20px; -webkit-border-radius:20px; border-radius:20px;">
<strong>Cadre peu large</strong>: Pour personnaliser la largeur de ce cadre, il faut modifier la valeur présent après le "width". La valeur actuel est de 300 pixels.<br />
Pour utiliser le cadre, il faut recoper le code présent juste en dessous.
</div>
-->
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
		out.print("<br><br><center>");
		out.print("<h2>Fiche du Client</h2><hr>");
		
		E = service.rechercheEntreprisenum(num);
		batiment = service.getBatimentEntreprise(num);
		out.println("<b><font size=\"5\">" + E.getNom() + "</b><br><i>" + E.getAdresse()
			+ "</i><br><b>Tel: </b><i>" + E.getTel()+"</i></font><br>");
	/*
		out.println("<label for=\"nomClient\"><i>Nom du Client </i></label>");
		out.println(E.getNom() + "<br />");
		out.println("<label for=\"AdresseClient\"><i>Adresse du Client </i></label>");
		out.println(E.getAdresse() + "<br />");
		out.println("<label for=\"Telephone\"><i>Telephone </i></label>");
		out.println(E.getTel() + "<br />");
		out.print("</center></fieldset>");
	*/
		//out.println("Nom de l'entreprise : " + E.getNom() + "<br><br> Adresse de l'entreprise : " + E.getAdresse()
		//		+ "<br><br> Numéro de téléphone de l'entreprise : " + E.getTel());
		out.print("<br><br> <table id=\"datatables\" class=\"display\" >"); 
		out.print("<thead><tr><th> Nom du batiment </th><th> Adresse du batiment </th><th> Fiche batiment </th></tr>");
		out.print("</thead><tbody>");
		for (i=0; i< batiment.size();i++){
			out.print(" <tr><td> " + batiment.get(i).getNom()
					+ "</td><td <td>" + batiment.get(i).getAdresse()
					+ "</td><td> <form action=\"fichebatiment\" method=\"GET\" ><input type=\"hidden\" id=\"idfichebat\" name=\"numBatiment\" value="
					+ batiment.get(i).getNumero()
					+ "> <input type=\"submit\" name=\" Consulter la fiche \" value=\" Consulter la fiche \" /></form></td></tr>");
		
		}
		
		
		
		/*
		for (i = 0; i < E.getBatiments().size(); i++) {
			out.print(" <tr><td align=\"center\"> " + E.getBatiments().get(i).getNom()
					+ "</td><td <td align=\"center\">" + E.getBatiments().get(i).getAdresse()
					+ "</td><td align=\"center\"> <form action=\"fichebatiment\" method=\"GET\" ><input type=\"hidden\" id=\"idfichebat\" name=\"numBatiment\" value="
					+ E.getBatiments().get(i).getNumero()
					+ "> <input type=\"submit\" name=\" Consulter la fiche \" value=\" Consulter la fiche \" /></form></td></tr>");
		}
		*/
		out.print("</tbody></table>");
	%>

</div>
</body>
</html>