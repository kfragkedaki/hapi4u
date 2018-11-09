<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*,java.text.*" %>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>


<%
	User user = (User) session.getAttribute("user_object");

	if( session.getAttribute("user_object") == null ) {
		request.setAttribute("message", "You are not authorized to access this resource. Please login.");
	%>
		<jsp:forward page="login.jsp"/>
	<%	}

	int user_id = user.getUserId();

	DateFormat datef = new SimpleDateFormat("yyyy-MM-dd");
	DateFormat timef = new SimpleDateFormat("HH:mm");
	Date currentDate = new Date();

	String date = (datef.format(currentDate)).toString();
	String times = (timef.format(currentDate)).toString();
	int time = Integer.parseInt(times.replace(":",""));


	LocationDAO ldao = new LocationDAO();
	PharmacyDAO pdao = new PharmacyDAO();
	MyFavouritesDAO fdao = new MyFavouritesDAO();
	AvailabilityDAO adao = new AvailabilityDAO();

	List<Integer> pharmaciesId = new ArrayList<Integer>();
	List<Pharmacy> pharmacies = new ArrayList<Pharmacy>();
	List<Pharmacy> myFavouritePharmacies = new ArrayList<Pharmacy>();
	List<Pharmacy> greyFavourites = new ArrayList<Pharmacy>();

	pharmaciesId = fdao.getMyFavouritesByUserId( user_id);
	pharmacies = pdao.getPharmacies();

	for ( int i=0; i< pharmacies.size() ; i++) {
		for (int j=0; j< pharmaciesId.size(); j++) {
			if (pharmacies.get(i).getId() == pharmaciesId.get(j) ){
				myFavouritePharmacies.add(pharmacies.get(i));
			}
		}
	}

	int results = myFavouritePharmacies.size();

	if (adao.authenticateDate(date) == 1) {

	Availability availability = adao.getAvailability(date);
	int availability_id = 0;

	if (time > 2100 || time < 800 || availability.getSunday().equals("1")) {
		availability_id = adao.getAvailability(date).getAvailabilityId();

		for (int i=0; i<myFavouritePharmacies.size(); i++){
				int availablePharmacies = adao.findAvailablePharmacies(myFavouritePharmacies.get(i).getId(), availability_id);
				if ( availablePharmacies == 0) {
					greyFavourites.add(myFavouritePharmacies.get(i));
					myFavouritePharmacies.remove(myFavouritePharmacies.get(i));
				}
			}
	}
	if (time > 2100 || time < 800 ) {

		for (int i=0; i<myFavouritePharmacies.size(); i++){

					greyFavourites.add(myFavouritePharmacies.get(i));
					myFavouritePharmacies.remove(myFavouritePharmacies.get(i));
			}
	}
}

%>

<!DOCTYPE html>
<html lang="en">

	<head>

		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
		<meta name="description" content="">
		<meta name="author" content="">

		<title>Hapi4u</title>

		<!-- Bootstrap core CSS -->
		<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

		<!-- Custom fonts for this template -->
		<link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		<link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
		<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

		<!-- Custom styles for this template -->
		<link href="css/pharmacies.css" rel="stylesheet">
		<link href="css/landing-page.min.css" rel="stylesheet">

		<style type="text/css"> html, body { margin: 0; padding: 0; height: 100%; width: 100%; } </style>


	</head>

	<body>
	<style type="text/css"> html, body,div { margin: 0; padding: 0; height: 100%; width: 100%; } </style>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:#14141f">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="index.jsp#page-top" id="title"></i> Hapi4u</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  Menu
			  <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			  <ul class="navbar-nav text-uppercase ml-auto">
			  <li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="index.jsp#services"> Υπηρεσιες</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="index.jsp#about">Πως λειτουργει</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="index.jsp#developers">Η ομαδα μας</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="index.jsp#contact">Επικοινωνια</a>
				</li>
				<%
				if( session.getAttribute("user_object") == null ) {

				%>
							<li class="nav-item">
							  <a class="nav-link js-scroll-trigger" href="login.jsp"><b>Εισοδος</b></button></a>
							</li>
							<li class="nav-item">
							  <a class="nav-link js-scroll-trigger" href="register.jsp"><b>Εγγραφη</b></button></a>
							</li>
						 </ul>
						  <%
				}else{

				%>
							<li class="nav-item">
								<a class="nav-link js-scroll-trigger" href="myfavourites.jsp">Αγαπημενα</a>
							</li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown">
								<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span> <%=user.getEmail()%> <span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="logout.jsp"><span class="glyphicon glyphicon-log-out"></span>	Logout</a></li>
								</ul>
							</li>
						</ul>
				<%}
				%>
			</div>
		</div>
	</nav>

	<section id="pharmacies" class="features-icons bg-light text-center">
	<!-- Page Content -->
    <div class="container">

      <!-- Page Heading -->
	  <h2 class="section-heading">Tα αγαπημένα σου Φαρμακεία!</h2>
      <h5 class="section-subheading text-muted"><%=results%> Αποτελέσματα </h5>
	  <hr>

		<%
			for (int i=0; i < myFavouritePharmacies.size(); i++){
				Pharmacy pharmacy = myFavouritePharmacies.get(i); %>

				  <!-- Project -->
				  <div class="row">
					<div class="col-md-7">
					  <a href="#">
						<img class="img-fluid rounded mb-3 mb-md-0" src="<%=pharmacy.getImage()%>" alt="">
					  </a>
					</div>
					<div class="col-md-5" id="description">
					  <h4><%= pharmacy.getName()%></h4>

					  <p><%=pharmacy.getAddress()%>, <%=ldao.getLocationByID(pharmacy.getLocationId()).getArea()%>- <%=ldao.getLocationByID(pharmacy.getLocationId()).getCity()%>, <%=ldao.getLocationByID(pharmacy.getLocationId()).getPostalcode()%>, <br><%=ldao.getLocationByID(pharmacy.getLocationId()).getRegion()%></p>
						<% if (user_id != 0) {
							if (fdao.getMyFavouritesId( user_id, pharmacy.getId()) == 0) { %>

								<form class="favourites" method="post" action="saveFavouritesController.jsp">

									 <input type="hidden" name="user_id" value="<%=user_id%>" />
									 <input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
								   <button class="fa fa-heart-o" type="submit" style="color:#007bff;"> </button>

								</form>
							<% } else { %>

										<form class="favourites" method="post" action="deleteFavouritesController.jsp">

											 <input type="hidden" name="user_id" value="<%=user_id%>" />
											 <input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
											 <button class="fa fa-heart" type="submit" style="color:#007bff;"> </button>

										</form>

							<% }
					    } %>

					  <form class="chat_ib" method="post" action="messageForm.jsp">
					  <input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
					  <button class="fa fa-envelope" type="submit" aria-hidden="false" style="color:#007bff;"> </button>
					  </form>
					<!--  <a href="" data-toggle="modal" data-target="#communication"><i class="fa fa-envelope" aria-hidden="false" style="color:#007bff;"> </i></a>-->
					</div>
				  </div>
				  <!-- /.row -->

				  <hr>


		<%	} %>
		<div id="grayPharmacies" >
		<%
			for (int i=0; i < greyFavourites.size(); i++){
				Pharmacy pharmacy = greyFavourites.get(i); %>

					<!-- Project -->
					<div class="row">
					<div class="col-md-7">
						<a href="#">
						<img style="opacity:0.5;" class="img-fluid rounded mb-3 mb-md-0" src="<%=pharmacy.getImage()%>" alt="">
						</a>
					</div>
					<div class="col-md-5" id="description" >
						<h4><%= pharmacy.getName()%></h4>

						<p><%=pharmacy.getAddress()%>, <%=ldao.getLocationByID(pharmacy.getLocationId()).getArea()%>- <%=ldao.getLocationByID(pharmacy.getLocationId()).getCity()%>, <%=ldao.getLocationByID(pharmacy.getLocationId()).getPostalcode()%>, <br><%=ldao.getLocationByID(pharmacy.getLocationId()).getRegion()%></p>
						<% if (user_id != 0) {
							if (fdao.getMyFavouritesId( user_id, pharmacy.getId()) == 0) { %>

								<form class="favourites" method="post" action="saveFavouritesController.jsp">

									 <input type="hidden" name="user_id" value="<%=user_id%>" />
									 <input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
									 <button class="fa fa-heart-o" type="submit" style="color:#007bff;"> </button>

								</form>
							<% } else { %>

										<form class="favourites" method="post" action="deleteFavouritesController.jsp">

											 <input type="hidden" name="user_id" value="<%=user_id%>" />
											 <input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
											 <button class="fa fa-heart" type="submit" style="color:#007bff;"> </button>

										</form>

							<% }
						} %>

						<form class="chat_ib" method="post" action="messageForm.jsp">
						<input type="hidden" name="pharmacy_id" value="<%=pharmacy.getId()%>" />
						<button class="fa fa-envelope" type="submit" aria-hidden="false" style="color:#007bff;"> </button>
						</form>
					<!--  <a href="" data-toggle="modal" data-target="#communication"><i class="fa fa-envelope" aria-hidden="false" style="color:#007bff;"> </i></a>-->
					</div>
					</div>
					<!-- /.row -->

					<hr>


		<%	} %>



	</div>

      <!-- Pagination -->
      <ul class="pagination justify-content-center">
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Previous">
            <span aria-hidden="true">&laquo;</span>
            <span class="sr-only">Previous</span>
          </a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#">1</a>
        </li>
        <li class="page-item">
          <a class="page-link" href="#" aria-label="Next">
            <span aria-hidden="true">&raquo;</span>
            <span class="sr-only">Next</span>
          </a>
        </li>
      </ul>

    </div>
	</section>
    <!-- /.container -->

	<!-- Message-->
	<div class="modal fade" id="communication" role="dialog">
		<div class="modal-dialog modal-lg">
			<div class="modal-content" style="background: #ccdfcb;">

				<div class="modal-heading">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<br>
					<div class="form-signin-heading text-center container">
						<h5 class="text-center">Συμπλήρωσε την παρακάτω φόρμα <br>για να επικοινωνήσεις με το φαρμακείο!</i></h5>
					</div>
				</div>

				<div class="modal-body container-fluid">
					<div class="container" >
						<form name="sentMessage" id="contactForm" method="post" action="messageController.jsp">
							<div class="control-group form-group">
							  <div class="controls">
								<label>Title:</label>
								<input type="text" class="form-control" name="title" required>
							  </div>
							</div>
							<div class="control-group form-group">
							  <div class="controls">
								<label>Full Name:</label>
								<input type="text" class="form-control" id="name" name="name" required>
								<p class="help-block"></p>
							  </div>
							</div>
							<div class="control-group form-group">
							  <div class="controls">
								<label>Email Address:</label>
								<input type="email" class="form-control" id="email" name= "email" required>
							  </div>
							</div>
							<div class="control-group form-group">
							  <div class="controls">
								<label>Message:</label>
								<textarea rows="10" cols="100" class="form-control" id="message" name="message" maxlength="999" style="resize:none"required></textarea>
							  </div>
							</div>
							<div class="text-center">
								<%session.setAttribute("pharmacy_id_receiver", 0 );
								session.setAttribute("admin_id_receiver", 1 );%>
								<!-- For success/fail messages -->
								<button type="submit" class="btn btn-primary">Send Message</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- footer -->
	<footer class="page-footer">

		<!-- Copyright -->
		<div class="footer-copyright text-center py-3">© 2018 Copyright hapi4u</div>
		<!-- Copyright -->

	</footer>
	<!-- End footer -->

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>

</html>
