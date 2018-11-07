<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.text.*" %>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%
	List<Integer> location_ids =  new ArrayList<Integer>();
	String[] l = request.getParameterValues("locations");
	for( int i=0; i< l.length; i++) {
		int location = Integer.parseInt(l[i]);
		location_ids.add(location);
	}

	String date = request.getParameter("date");
	String time = request.getParameter("time");

	User user = (User) session.getAttribute("user_object");
	int user_id = 0;

	if (session.getAttribute("user_object") != null) {
		user_id = user.getUserId();
	}

	LocationDAO ldao = new LocationDAO();
	PharmacyDAO pdao = new PharmacyDAO();
	MyFavouritesDAO fdao = new MyFavouritesDAO();
	List<Pharmacy> pharmacies = new ArrayList<Pharmacy>();
	List<Pharmacy> pharmacies2 = new ArrayList<Pharmacy>();

    if (pdao.authenticateDate(date) == 1) {

		Availability availability = pdao.getAvailability(date);
		int availability_id = 0;

		if ((Integer.parseInt(time.replace(":","")) > 2100 || Integer.parseInt(time.replace(":","")) < 800) || availability.getSunday().equals("1")) {
			availability_id = pdao.getAvailability(date).getAvailabilityId();

			for (int i=0; i<location_ids.size(); i++){
				pharmacies2 = pdao.findPharmaciesByLocation(location_ids.get(i));
				for (int j=0; j< pharmacies2.size(); j++){
					int availablePharmacies = pdao.findAvailablePharmacies(pharmacies2.get(j).getId(), availability_id);
					if ( availablePharmacies == 1) {
						pharmacies.add(pharmacies2.get(j));
					}
				}
			}
		} else {

			for (int i=0; i<location_ids.size(); i++){
				pharmacies2 = pdao.findPharmaciesByLocation(location_ids.get(i));
				for (int j=0; j< pharmacies2.size(); j++){
					pharmacies.add(pharmacies2.get(j));
				}
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
		<link href="css/landing-page.min.css" rel="stylesheet">
		<link href="css/pharmacies.css" rel="stylesheet">

	</head>

	<body>

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
	  <h2 class="section-heading">Βρες διαθέσιμα φαρμακεία εύκολα και γρήγορα!</h2>
      <h5 class="section-subheading text-muted"><%= pharmacies.size()%> Αποτελέσματα </h5>
	  <hr>

		<%
			List<Integer> pharmacy_ids = new ArrayList<Integer>();
			for (int i=0; i < pharmacies.size(); i++){
				Pharmacy pharmacy = pharmacies.get(i);
				pharmacy_ids.add(pharmacy.getId()); %>


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



    <!-- Footer -->
    <footer class="footer bg-dark">
      <div class="container">
        <div class="row">
          <div class="col-lg-7 h-100 text-center text-lg-right my-auto">
            <ul class="list-inline mb-0">
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-facebook fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item mr-3">
                <a href="#">
                  <i class="fa fa-twitter fa-2x fa-fw"></i>
                </a>
              </li>
              <li class="list-inline-item">
                <a href="#">
                  <i class="fa fa-instagram fa-2x fa-fw"></i>
                </a>
              </li>
            </ul>
			<br>
			<div id="copyright">
				<p class="text-muted small mb-4 mb-lg-0">&copy; Hapi4u 2018. All Rights Reserved.</p>
			</div>
          </div>
        </div>
      </div>
    </footer>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="js/MyFavourites.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.9/angular.min.js"></script>

  </body>

</html>
