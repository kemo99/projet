<!DOCTYPE HTML>
<html>

   <head>
    <title>Ajout d'une Entreprise</title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css">
  </head>

<body>
 <header class="header">
    	        <a class="logo" href="http://www.desentec.fr/"><img src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png"> </a>
    	       <p class="head"><center><strong>Desentec - Protection incendie</strong></center></p>
 </header>
  <br><br><br><br><br><br><br>

	 
	 
		<%@ page import="java.net.URL" %>
        <%@ page import="java.net.URLConnection" %>
        <%@ page import="java.io.* " %>
		<%@ page import= "ejb.sessions.*"%>
		<%@ page import= "ejb.entites.* "%>
		<%@ page import= "java.util.Collection"%>
		<%@ page import= "java.util.Set"%>
		<%@ page import= "javax.naming.InitialContext"%>
		<%@ page import= "javax.naming.NamingException"%>
		<%@ page import= "java.util.Date"%>
		<%@ page import= "java.text.SimpleDateFormat"%>
		<%@ page import= "java.text.DateFormat"%>
		<%@ page import= "java.util.HashSet"%>

		
		
        <%! String nomEntreprise,adresseEntreprise,telEntreprise;
        
        %>
        
  
        <%
           		nomEntreprise =request.getParameter("nomEntreprise");
           		adresseEntreprise=request.getParameter("adresse");
           		telEntreprise=request.getParameter("telEntreprise");
           		
           		InitialContext ctx = new InitialContext();
    			Object obj = ctx.lookup("ejb:pfeprojet/pfeprojetSessions/"+ "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
    			ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
    			service.ajouterEntreprise(nomEntreprise,adresseEntreprise,telEntreprise);
    			
    			service.creercompteClient(service.getlisteEntreprises().get(service.getlisteEntreprises().size()-1).getNumero());
    			// afficher le mot de passe et le login
    			
    			out.println("<center>Ajout effectu� avec succ�s <br>");
    			
        		out.println("<a href=\"administrateur.html\">retour � la page d'accueil</a></center>");
        %>
		         
		

</body>
</html>






