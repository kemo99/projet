<html>

   <head>
    <title>Intervention -- Choix de l'intervention </title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css">
  </head>
<body>
<div  id="bloc_page">
 <header class="header">
    	        <a class="logo" href="http://www.desentec.fr/"><img src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png"> </a>
    	       
 </header>
  <%!
  	String numBatiment;
  %>
  
  
  <%
  		numBatiment =request.getParameter("numBatiment");
  		session.setAttribute("num",numBatiment);
  %>
  
  
  
  
  <br>
  <center><h2>  Choix d'une intervention sur les organes de sécurité </h2></center> 
  <br>

 <FORM action="intervention.jsp">
 <fieldset>
    <legend><b>Type de l'intervention</b></legend> <br />
           
	<INPUT id="installation" type= "radio" name="choixinterv" value="installation"/> 
	<label for="installation">Installation</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="verification" type= "radio" name="choixinterv" value="verification"/>
	<label for="verification">Vérification</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="maintenanceprev" type= "radio" name="choixinterv" value="maintenanceprev"/> 
	<label for="maintenanceprev">Maintenance Préventive</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="maintenancecorr" type= "radio" name="choixinterv" value="maintenancecorr"/> 
	<label for="maintenancecorr">Maintenance Corrective</label> 

 </fieldset>
 
<br><br>
<fieldset>
    <legend><b>Type de l'organe de sécurité </b></legend> 
   
	<br><INPUT id="extincteur" type= "radio" name="choixorg" value="extincteur">
	<label for="extincteur">Extincteur</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="eclairage" type= "radio" name="choixorg" value="eclairage"> 
	<label for="eclairage">Eclairage</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="pharmacie" type= "radio" name="choixorg" value="pharmacie"> 
	<label for="pharmacie">Pharmacie</label> &nbsp;&nbsp;&nbsp;
	<INPUT id="signaletique" type= "radio" name="choixorg" value="signaletique"> 
	<label for="signaletique">Signalétique</label> 

</fieldset>	
	<br><br><center><input type="submit" value="Valider"></center>

</FORM>

</div>
 </body>
 </html>