<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import = "java.io.*,java.util.*,java.text.*" %>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();

PharmacyDAO pdao = new PharmacyDAO();

AdministratorDAO adao = new AdministratorDAO();

MessageDAO mdao = new MessageDAO();

LocationDAO ldao= new LocationDAO();

%>	

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Pharmacy profil</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/landing-page.min.css" rel="stylesheet">
    <link href="css/full-width-pics.css" rel="stylesheet">
	<link href="css/profil.css" rel="stylesheet">
	
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
	
	<link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>

  </head>

  <body>

<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:#14141f">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top" id="title"></i> Hapi4u</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  Menu
			  <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			 <ul class="navbar-nav text-uppercase ml-auto">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span><%User user = (User) session.getAttribute("user_object");%> <%=user.getEmail()%> <span class="caret"></span></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>	Logout</a></li>
					</ul>
				</li>				
		    </ul>
			</div>
		</div>
	</nav>
    <!-- Header - set the background image for the header in the line below -->
    <%if (user.getIfPharmacy().equals("0")){
		Administrator admin = adao.findAdminByUserId(user.getUserId());%>
		
		<header>
     <img class="img-fluid d-block mx-auto"  style="width:30%; margin-top:30px;" src=<%=admin.getImage()%> 	alt="">
    </header>

    <!-- Content section -->
    <section class="py-5">
      <div class="container">
        <h1><%=admin.getName()%></h1>
      </div>
    </section>
	
		<div class="containerM">
<h3 class=" text-center">Μηνύματα</h3>
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Πρόσφατα</h4>
            </div>
          </div>
	
          <div class="inbox_chat">
		  <%
		   List<Message> messages = new ArrayList<Message>(); 
		   messages = mdao.getMessagesByAdminId(admin.getId());
		   for (int i=(messages.size()-1); i>=0; i--){
		  %>
            <div class="chat_list" >
              <div class="chat_people">
                <form class="chat_ib" method="post" action="messageDelete.jsp">
				
                  <h5><b>Email:</b><%=messages.get(i).getEmail()%></i><span class="chat_date"><%=messages.get(i).getDate()%></span></h5>
				  <h5><b>Ονοματεπώνυμο:</b> <%=messages.get(i).getName()%></h5>
                  <h5><b>Τίτλος:</b> <%=messages.get(i).getTitle()%></h5>
				  <br>
				  <%=messages.get(i).getMessage()%>
				  <input type="hidden" name="message_id" value="<%=messages.get(i).getMessageId()%>" />
				  <div class="delete">
				  <button class="btn btn-lg btn-block" type="submit">Διαγραφή</button>
				  </div>
                </form>
	
              </div>
            </div>
			<%}	%>

          </div>
		
      </div>
     	
		
	<%}else{
		Pharmacy pharmacy = pdao.findPharmacyByUserId(user.getUserId());%>
	
    <header>
     <img class="img-fluid d-block mx-auto"  style="width:30%; margin-top:30px;" src=<%=pharmacy.getImage()%> alt="">
    </header>

    <!-- Content section -->
    <section class="py-5">
      <div class="container">
		<h1><%=pharmacy.getName()%></h1>
        <p class="lead"><%=pharmacy.getAddress()%>, <%=(ldao.getLocationByID(pharmacy.getLocationId())) . getArea()%>, <%=(ldao.getLocationByID(pharmacy.getLocationId())) . getCity()%>, <%=(ldao.getLocationByID(pharmacy.getLocationId())) . getRegion()%></p>
      </div>
    </section>
	
	
	<div class="containerM">
		<h3 class=" text-center">Μηνύματα</h3>
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Πρόσφατα</h4>
            </div>
          </div>
	
          <div class="inbox_chat">
		  <%List<Message> messages = new ArrayList<Message>(); 
		   messages = mdao.getMessagesByPharmacyId(pharmacy.getId());
		   
		   if(request.getAttribute("message") != null) { 	%>
			<h5><b><%=(String)request.getAttribute("message")%></h5>
		   <%}%>
		   
		   <%for (int i=(messages.size()-1); i>=0; i--){%>
            <div class="chat_list" >
              <div class="chat_people">
                <form class="chat_ib" method="post" action="messageDelete.jsp">
				
                  <h5><b>Email:</b><%=messages.get(i).getEmail()%></i><span class="chat_date"><%=messages.get(i).getDate()%></span></h5>
				  <h5><b>Ονοματεπώνυμο:</b> <%=messages.get(i).getName()%></h5>
                  <h5><b>Τίτλος:</b> <%=messages.get(i).getTitle()%></h5>
				  <br>
				  <%=messages.get(i).getMessage()%>
				  <input type="hidden" name="message_id" value="<%=messages.get(i).getMessageId()%>" />
				  <div class="delete">
				  <button class="btn btn-lg btn-block" type="submit">Διαγραφή</button>
				  </div>
                </form>
	
              </div>
            </div>
			<%}	%>

          </div>
		
      </div>
     	
		
		<%}	%>
		

    <!-- Footer -->
    <footer class="py-5 bg-dark">
      <div class="container">
        <p class="m-0 text-center text-white">Copyright &copy; Your Website 2018</p>
      </div>
      <!-- /.container -->
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>

		$(".chosen-select").chosen({
  no_results_text: "Oops, nothing found!"
})
	</script>
  </body>

</html>
