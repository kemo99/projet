<!DOCTYPE HTML>
<html>

   <head>
    <title>Ajout d'une Entreprise</title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css">
  </head>

<body>
<div id="bloc_page">
 <header class="header">
    	        <a class="logo" href="http://www.desentec.fr/"><img src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png"> </a>
    	       
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
        <%@ page import= "java.util.List"%>
		
		
        <%! String login,password;
        
        %>
        
  
        <%
           		login =request.getParameter("login");
           		password=request.getParameter("password");
           		
           		InitialContext ctx = new InitialContext();
    			Object obj = ctx.lookup("ejb:pfeprojet/pfeprojetSessions/"+ "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
    			ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
    			try{
    			 List<Integer> liste = service.verificationCompte(login, password);
    			 //out.println("<center>Ajout effectué avec succès <br>");
     			
         		 //out.println("<a href=\"index.html\">retour à la page d'accueil</a></center>");
         		 session = request.getSession();
         		 if(liste.get(1) == 2){ // connexion client
         		    
         		    session.setAttribute("numPersonne",liste.get(0));
         		    session.setAttribute("statut",liste.get(1));
         			out.println("<meta http-equiv=\"refresh\" content=\"1; URL=client.jsp\"");
         		 }else if (liste.get(1) == 1){  // connexion technicien
         			 session.setAttribute("numPersonne",liste.get(0));
         			 session.setAttribute("statut",liste.get(1));
         			 out.println("<meta http-equiv=\"refresh\" content=\"1; URL=technicien.html\"");
         		 }else{  // admin general
         			//session.setAttribute("numPersonne",liste.get(0));
         			session.setAttribute("statut",liste.get(1));
         			out.println("<meta http-equiv=\"refresh\" content=\"1; URL=administrateur.html\"");
         		 }
         		 
    			}catch(CompteInconnuException e){
    				//out.println("<center><strong>compte innexistant</strong></center>");
    				// renvoie sur la page d'accueil
    				out.println("<meta http-equiv=\"refresh\" content=\"1; URL=index.jsp?result=compte inexistant\"");
    			}
    			
        %>
		         
		
</div>
</body>
</html>






