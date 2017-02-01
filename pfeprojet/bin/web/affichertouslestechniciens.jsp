
<html>

<head>
<title>Liste de tous les techniciens</title>
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


	<%!String nomEntreprise;
	List<Entreprise> E;
	int i;%>


	<%
	out.println("<center><h1>Fiche des Techniciens  </h1></center><br> ");

		session = request.getSession();
		InitialContext ctx = new InitialContext();
		Object obj = ctx.lookup(
				"ejb:pfeprojet/pfeprojetSessions/" + "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
		ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;

		
			//out.println("<a href=\"fichetechnicien.jsp\">"
			//		+ service.getlisteTechniciens().get(i).getNom().toString() + "</a><br>");
			out.print("<br> <br><table id=\"datatables\" class=\"display\" >");
			out.print("<thead><tr><th>Technicien</th><th> Adresse </th><th> Télephone </th><th>Mail</th></tr>");
			out.print("</thead><tbody>");
			for (i = 0; i < service.getlisteTechniciens().size(); i++) {
				out.print(" <tr><td > "+service.getlisteTechniciens().get(i).getNom()+" "+service.getlisteTechniciens().get(i).getPrenom()+"</td><td>"+
						service.getlisteTechniciens().get(i).getAdresse()+"</td><td>"+service.getlisteTechniciens().get(i).getTel()+"</td><td>"+service.getlisteTechniciens().get(i).getAdressemail()+"</td></tr>");
    			
			}
			out.print("</tbody></table>");
			/*session.setAttribute("techniciennom", service.getlisteTechniciens().get(i).getNom().toString());
			session.setAttribute("technicientel", service.getlisteTechniciens().get(i).getTel().toString());
			session.setAttribute("technicienadresse", service.getlisteTechniciens().get(i).getAdresse().toString());
           */
		   
	%>
	</div>
</body>	