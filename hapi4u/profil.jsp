<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import = "java.io.*,java.util.*,java.text.*" %>
<%@ page import="hapi4u_javafiles.*" %>

<%
	if( session.getAttribute("user_object") == null ) {
		request.setAttribute("message", "Δεν έχετε πρόσβαση σε αυτήν την σελίδα. Παρακαλούμε συνδεθείτε.");

%>
		<jsp:forward page="login.jsp"/>
<%	}  %>
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
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Profil</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
    <link href="css/landing-page.min.css" rel="stylesheet">
	<link href="css/profil.css" rel="stylesheet">


	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">


	<link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

  </head>

  <body>
		<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:#14141f">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top" id="title"></i> <i class='fa fa-ambulance'></i> Hapi4u</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  Menu
			  <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			 <ul class="navbar-nav text-uppercase ml-auto">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user"></i><%User user = (User) session.getAttribute("user_object");%> <%=user.getEmail()%> <i class="caret"></i></a>
					<ul class="dropdown-menu">
						<li><a href="logout.jsp"><i class="fa fa-sign-out"></i>	Logout</a></li>
					</ul>
				</li>				
		    </ul>
			</div>
		</div>
	</nav>
    <!-- Header - set the background image for the header in the line below -->
    <%if (user.getIfPharmacy().equals("0")){ %>

		<header>
     <img class="img-fluid mx-auto d-block w-50 p-3" src="img/administrators.jpg"	alt="">
    </header>

    <!-- Content section -->
    <section class="py-5">
      <div class="container">
        <h1>Διαχειριστές</h1>
      </div>
    </section>

		<div class="container">
		 <h3 class=" text-center">Μηνύματα</h3>
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Πρόσφατα</h4>
            </div>
          </div>

          <div class="inbox_chat">
		  <%
		   List<Message> messages = new ArrayList<Message>();
		   messages = mdao.getMessagesByUserId(user.getUserId());
		   for (int i=(messages.size()-1); i>=0; i--){
		  %>
            <div class="chat_list" >
              <div class="chat_people">
                  <h5><b>Email:</b><%=messages.get(i).getEmail()%></i><span class="chat_date"><%=messages.get(i).getDate()%></span></h5>
				  <h5><b>Ονοματεπώνυμο:</b> <%=messages.get(i).getName()%></h5>
                  <h5><b>Τίτλος:</b> <%=messages.get(i).getTitle()%></h5>
				  <br>
				  <%=messages.get(i).getMessage()%>
				  <button type="button" class="btn btn-lg  pull-right" data-toggle="modal" data-target="#myModal"> Διαργαφή </button>
				  
				    <div class="modal fade" id="myModal" role="dialog">
						<div class="modal-dialog">
    
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>
									<div class="modal-body">
									<p>Είστε σίγουροι ότι θέλετε να διαγράψετε το μήνυμα;</p>
									</div>
									<div class="modal-footer">
										<form class="chat_ib" method="post" action="messageDelete.jsp">

										<input type="hidden" name="message_id" value="<%=messages.get(i).getMessageId()%>" />
										<button class="btn btn-default col-md-2 offset-md-7" type="submit" >Ναι</button>
										<button type="button" class="btn btn-default col-md-2" data-dismiss="modal">Όχι</button>
										
										</form>
									</div>

								
							</div>
						</div>
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
     <img class="img-fluid mx-auto d-block w-50 p-3"  src=<%=pharmacy.getImage()%> alt="">
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
		   messages = mdao.getMessagesByUserId(user.getUserId());

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

				  <button class="btn btn-lg  pull-right" type="submit" >Διαγραφή</button>

                </form>

              </div>
            </div>
			<%}	%>

          </div>

      </div>


		<%}	%>


	<footer class="page-footer">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">© 2018 Copyright hapi4u</div>
		<!-- Copyright -->

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
