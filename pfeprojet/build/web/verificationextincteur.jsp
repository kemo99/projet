<html>
<head>
<title>Verification d'un Extincteur</title>
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
	<%@ page import="java.util.List"%>
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="javax.naming.InitialContext"%>
	<%@ page import="javax.naming.NamingException"%>

	<%!String numBat,conclusion, observation;
	int num,i;
	List<Extincteur> E = new ArrayList<Extincteur>();
	%>
	<%
		session = request.getSession();
		InitialContext ctx = new InitialContext();
		Object obj = ctx.lookup(
				"ejb:pfeprojet/pfeprojetSessions/" + "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
		ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
		numBat = String.valueOf(session.getAttribute("num"));
		session.setAttribute("num", numBat);
		num=Integer.parseInt(numBat);
		
		E.clear();
		E=service.rechercheExtincteurBatiment(num);
		out.println("<br><center><h2>Verification des extincteurs</h2></center><br>");
		// Tableau
		out.println("<br><form action=\"verificationextincteurvalidee.jsp\">");
		out.print("<br> <table id=\"datatables\" class=\"display\" >");
		out.print("<thead><tr><th> N� Extincteur </th><th> Emplacement </th><th> Type extincteur </th><th>  Marque </th><th>Annee </th><th>Observation</th></tr>");
		out.print("</thead><tbody>");
	      
		for(i=0;i<E.size();i++){
					observation=service.rechercheObservationVerification(E.get(i).getNumero());
					conclusion=service.rechercheConclusionVerification(E.get(i).getNumero());
					out.println(" <tr><td > " + E.get(i).getNumero()+
						"</td> <td>" + E.get(i).getEmplacement()+
						"</td> <td >" + E.get(i).getType().getNom()+
						"</td> <td >" + E.get(i).getMarque().getNom()+
						"</td> <td >" + E.get(i).getAnnee()+
						"</td> <td> <input type=\"text\" name="+i+" value="+observation+"></td></tr>"
						);
		}
		out.println("</tbody></table><br><br>"); 
		out.println("<center><table><tr><td>Conclusion</td> <td></td> <td><textarea name=\"Conclusion\" rows=\"5\" cols=\"47\" required>"+conclusion+"</textarea></td></tr></table>");
		out.println("<br><input type=\"submit\" value=\"Valider\"></center></form>");
		session.setAttribute("Extincteurs",E);
	%>
	</div>
</body>
</html>