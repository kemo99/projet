<!DOCTYPE HTML>
 <html>
  <head>
    <title>Identification</title>
    <meta charset="UTF-8" />
    <link href="style.css" rel="stylesheet" type="text/css">
    <%!
     String chaine;
    %>
    <% chaine =request.getParameter("result");
       if(chaine !=null){
    	   
      
    %>
     <SCRIPT LANGUAGE="JavaScript">
		alert('compte inexistant');
	</SCRIPT>
	<% } %>
  </head>

 <body>	
    
  <div id="bloc_page">
    <!-- HEADER -->
    <header>
    	        <a href="http://www.desentec.fr/"><img src="http://www.desentec.fr/wp-content/uploads/2015/06/logo-site.png"> </a>
    	       
   </header>
 
   <!-- CONTAINER -->
   
   
  <div id="logincontent">
  <div class="loginlogo">
   
  </div>

  <form action="verification" method="post">
    <center><h3>Merci de vous authentifier</h3><center/> <br/>
   <table>
   
    <tr>
     <td><i>Login <font color="#ff0000">*</font></i></td>
     <td>
      <input type="text" name="login" size="15" required onFocus='clear_field(this)'>
     </td>
    </tr>
    <tr>
     <td><i>Mot de passe <font color="#ff0000">*</font></i></td>
     <td >
      <input type="password" name="password" size="15" required onFocus='clear_field(this)'>
     </td>
    </tr><br/>
    <tr>
    </tr>
     <tr>
    </tr>
    <tr>
     <td colspan="2">
	 <div class="buttons">
      <button type="submit" name="submit"> Se connecter </button>
      
	 <button type="reset">
             
                        Effacer
                </button>
    </td>
	</tr>
   </table>
  </form>
 
  
  	
  </div>
    
  </body>
</html>
