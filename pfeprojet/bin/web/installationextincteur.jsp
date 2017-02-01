<html>
<head>
<title>Installation d'un Extincteur</title>
<meta charset="UTF-8" />
<link href="style.css" rel="stylesheet" type="text/css">
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

  <br><br><br>
  
	
		<form action="installationextincteurvalidee">
		 <fieldset>
		 <legend><b>Installation extincteur</b></legend>
				<br />
		<table>
		 <tr>
		  
			<td>
                <label for="annee"><i>Annee de fabrication de l'extincteur <font color="#ff0000">*</font></i></label>
                </td>	  
		   <td> <input type="text"
					name="annee" required placeholder="Annee..." size="40" class="taille_input_annee"/>
			    </td>
		</tr>
		<tr></tr>
		<tr>
			<td> <label for="emplacement"><i>Emplacement de l'extincteur <font color="#ff0000">*</font></i></label>
               
				
			</td> <td> 
					<textarea name="emplacement" rows="5" cols="47" required placeholder="emplacement extincteur..."></textarea> 
             
			</td>
	  </tr>
	  <tr></tr>
	  <tr> <td> <label for="observations"><i>Observations <font color="#ff0000">*</font></i></label>
               
				  
			</td> <td> 
					<textarea name="observations" rows="5" cols="47" required placeholder="observations......"></textarea> 
             
			</td>
	 </tr>
	 <tr></tr>
	 <tr><td> <label for="technicien"><i>Numero du Technicien <font color="#ff0000">*</font></i></label>
               
				  
		 </td> <td><input type="text" name="technicien" required
					placeholder="numero du technicien..." size="40" class="taille_input_annee"/>
			</td>
	 </tr>
	 <tr></tr>
	 <tr> <td> <label for="typeextincteur"><i>Type de l'extincteur <font color="#ff0000">*</font></i></label>
               
				 
			</td> <td> <select name="typeextincteur" class="class_select">
					<%!String numBat;
					int num, i;%>
					<%
						session = request.getSession();
						InitialContext ctx = new InitialContext();
						Object obj = ctx.lookup(
								"ejb:pfeprojet/pfeprojetSessions/" + "ServicepfeprojetBean!ejb.sessions.ServicepfeprojetRemote");
						ServicepfeprojetRemote service = (ServicepfeprojetRemote) obj;

						numBat = String.valueOf(session.getAttribute("num"));
						session.setAttribute("num", numBat);
						
						for (i = 0; i < service.touslesTypeExtincteur().size(); i++)
							out.println("<option value=" + service.touslesTypeExtincteur().get(i).getNumero() + ">"
									+ service.touslesTypeExtincteur().get(i).getNom() + "</option>");
					%>
				</select>
			</td>
		</tr>
      <tr></tr>
	  <tr> <td> <label for="marqueextincteur"><i>Marque de l'extincteur <font color="#ff0000">*</font></i></label>
               
				  
			</td> <td> <select name="marqueextincteur" class="class_select">
					<%
						for (i = 0; i < service.touteslesMarqueExtincteur().size(); i++)
							out.println("<option value=" + service.touteslesMarqueExtincteur().get(i).getNumero() + ">"
									+ service.touteslesMarqueExtincteur().get(i).getNom() + "</option>");
					%>
				</select>
			</td>
			</tr>
			
			</table> <br>
		<center>	<input type="submit" value="Valider"> </center>
			</fieldset>
		</form>
 
</div>
</body>
</html>