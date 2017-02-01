
<html>

   <head>
    <title>Liste de toutes les entreprises </title>
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
<body >
<div  id="bloc_page">
 <header class="header">
    	        <a class="logo" href="http://www.desentec.fr/"><img src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png"> </a>
    	       
 </header>
  <br><br><br>	
	 
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
		<%@ page import= "java.util.List" %>
		
		
        <%! String nomEntreprise;
        	List<Entreprise> E;
        	int i;
        %>
        
  
        <%
        		out.println("<center><h1>Liste de tous les Clients  </h1></center><br> ");
           		
        		//nomEntreprise =request.getParameter("nomEntreprise");
           		
        		InitialContext ctx = new InitialContext();
    			Object obj = ctx.lookup("ejb:pfeprojet/pfeprojetSessions/"+ "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
    			ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;
    			out.print("<br> <table id=\"datatables\" class=\"display\" >");
    			out.print("<thead><tr><th> Client </th><th> Adresse </th><th> Télephone </th><th> Mail </th><th>Interlocuteur </th><th>Fiche du client</th></tr>");
    			out.print("</thead><tbody>");
    			for(i=0;i<service.getlisteEntreprises().size();i++){
    				out.print(" <tr><td > "+service.getlisteEntreprises().get(i).getNom()+"</td><td>"+service.getlisteEntreprises().get(i).getAdresse()+"</td><td>"+service.getlisteEntreprises().get(i).getTel()+
    						"<td>"+service.getlisteEntreprises().get(i).getAdressemail()+"</td> "+"<td>"+service.getlisteEntreprises().get(i).getNominterlocuteur()+"</td> "+"</td><td> <form action=\"ficheentreprise\" method=\"POST\" ><input type=\"hidden\" id=\"thisField\" name=\"numEntreprise\" value="+service.getlisteEntreprises().get(i).getNumero()+"> <input type=\"submit\" name=\" Consulter la fiche \" value=\" Consulter la fiche \" /></form></td></tr>");
    			}
    			out.print("</tbody></table>");
    			
    			/*
    			for(i=0;i<service.getlisteEntreprises().size();i++){
    				out.print(service.getlisteEntreprises().get(i).getNom()+" "+service.getlisteEntreprises().get(i).getAdresse()+" "+service.getlisteEntreprises().get(i).getTel()+" "+service.getlisteEntreprises().get(i).getNumero());
    			}
    			*/
        %>
		         
		
</div>
</body>
</html>

