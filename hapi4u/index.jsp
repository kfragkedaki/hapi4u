<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();
LocationDAO ldao = new LocationDAO();
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
	
	
	<link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/> <!--For dropdown option-->

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
			  <li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="#services"> Υπηρεσιες</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="#about">Πως λειτουργει</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="#developers">Η ομαδα μας</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="#contact">Επικοινωνια</a>
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
					<a class="nav-link js-scroll-trigger" href="favourites.jsp">Αγαπημένα</a>
				</li>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li class="dropdown">
					<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><span class="glyphicon glyphicon-user"></span><%User user = (User) session.getAttribute("user_object");%> <%=user.getEmail()%> <span class="caret"></span></a>
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

    <!-- Masthead -->
    <header id="page-top" class="masthead text-white text-center">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto" style="color:#000000;">
            <h1 class="mb-5" style=" top:0px;">Βρες διαθέσιμα φαρμακεία εύκολα και γρήγορα!</h1>
          </div>
          <div class="col-md-10 mx-auto">
		   <div class="container2">
			<form class="form-group" method="post" action ="pharmacies.jsp">
			    
					<label><b>Περιοχή:  </b></label>
						<select data-placeholder="Πληκτρολόγησε την περιοχή που επιθυμείς" multiple class="chosen-select" name="locations" style="width: 20%;">
						
						<optgroup label = "Αθήνα, ΑΤΤΙΚΗ">
						
						<% for (int i = 1; i <= ldao.getLocations("Αθήνα", "ΑΤΤΙΚΗ").size() ; i++) { %>
						
					
							<option value=<%=i%>> <%= ldao.getLocationByID(i).getArea() %> </option>
					
						<%}%>
						
						</optgroup>
						
						<optgroup label = "Ηράκλειο, ΚΡΗΤΗ">
						
						<% for (int i = 46; i <= ldao.getLocations("Ηράκλειο", "ΚΡΗΤΗ").size() ; i++) { %>
						
					
							<option value=<%=i%> > <%= ldao.getLocationByID(i).getArea() %> </option>
					
						<% }%>
						
						</optgroup>
						
                      </select>
					
					<label class="date"><b>Ημερομηνία</b>
						<input type="date" id="date" name="date">
					</label>
					<label class="time"><b>Ώρα</b>
						<input type="time"id="time" name="time">
					</label>
					
					<button type="submit" class="btn btn-primary">Αναζήτηση</button>
		    </form>
		   </div>	
          </div>
        </div>
      </div>
    </header>

    <!-- Icons Grid -->
    <section id="services" class="features-icons bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="fa fa-search m-auto text-primary"></i>
              </div>
              <h3>Αναζήτηση</h3>
              <p class="lead mb-0">Μπορείς να αναζητήσεις εύκολα και γρήγορα όλα τα διαθέσιμα φαρμακεία στις περιοχές, την ώρα και την ημερομηνία που επιθυμείς!</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-5 mb-lg-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="fa fa-envelope-o m-auto text-primary"></i>
              </div>
              <h3>Μηνύματα</h3>
              <p class="lead mb-0">Η επικοινωνία με το ίδιο το φαρμακείο γίνεται παιχνιδάκι. Για να δείς αν τα προϊόντα που επιθυμείς βρίσκονται στο κατάστημα, επέλεξε την αποστολή μηνύματος!</p>
            </div>
          </div>
          <div class="col-lg-4">
            <div class="features-icons-item mx-auto mb-0 mb-lg-3">
              <div class="features-icons-icon d-flex">
                <i class="fa fa-heart-o m-auto text-primary"></i>
              </div>
              <h3>Αγαπημένα</h3>
              <p class="lead mb-0">Αποθήκευσε τα αγαπημένα σου φαρμακεία, ώστε να έχεις ευκολότερη πρόσβαση σε αυτά και να ενημερώσε για την διαθεσιμότητα τους!</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Image Showcases -->
    <section id="about" class="showcase">
      <div class="container-fluid p-0">
	    <div class="row">
          <div class="col-lg-12 text-center" style="margin-top:90px;">
            <h2 class="section-heading text-uppercase">ΠΩΣ</h2>
            <h3 class="section-subheading text-muted">...λειτουργεί..</h3>
          </div>
        </div>
        <div class="row no-gutters" style="margin-top:90px;">

          <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/conceptual-creativity-cube.jpg');"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>Συμπλήρωσε την μηχανή αναζήτησης.</h2>
            <p class="lead mb-0">Επέλεξε περιοχή/περιοχές, ημερομηνία και ώρα που επιθυμείς να αναζητήσεις διαθέσιμα φαρμακεία. </p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/apple-business-click.jpg');"></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>Δες τα διαθέσιμα φαρμακεία.</h2>
            <p class="lead mb-0">Πάτησε αναζήτηση! Δες τα διαθέσιμα φαρμακεία που υπάρχουν στην περιοχή/περιοχές που επιθυμείς, την ώρα και την ημερομηνία που έχεις επιλέξει.</p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/adult-beautiful-blur.jpg');"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>Εαν διαθέτεις λογαριασμό...</h2>
            <p class="lead mb-0">Τι καλύτερο απ το να μπορείς να αποθηκεύσεις τα αγαπημένα σου φαρμακεία! Με τη δημιουργία λογαριασμού μπορείς να αποθηκεύσεις τα φαρμακεία που επιθυμείς ώστε κάθε φορά να μπορείς να δεις αν είναι διαθέσιμα χωρίς να πραγματοποιήσεις αναζήτηση.</p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/ask-blackboard.jpg');"></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>Πως δημιουργώ λογαριασμό;</h2>
            <p class="lead mb-0">Παιχνιδάκι. Το μόνο που χρειάζεται είναι να πατήσεις εγγραφή και να σημειώσεις ένα όνομα και ένα email. Τόσο απλό...</p>
          </div>
        </div>
	    <div class="row">
          <div class="col-lg-12 text-center" style="margin-top:90px;">
            <h2>Αν είσαι διαχειριστής φαρμακείου...</h2>
          </div>
        </div>
        <div class="row no-gutters" style="margin-top:90px;">

          <div class="col-lg-6 order-lg-2 text-white showcase-img" style="background-image: url('img/achievement-agreement-body-language.jpg');"></div>
          <div class="col-lg-6 order-lg-1 my-auto showcase-text">
            <h2>Πως θα συνεργαστείς μαζί μας;</h2>
            <p class="lead mb-0">Πολύ απλό! Επικοινώνησε μαζί μας μέσω της <a href="#contact">παρακάτω φόρμας. </a> Συμπλήρωσε τα στοιχεία του φαρμακείου σου και εμείς θα έρθουμε σε επαφή μαζί σου για περισσότερες λεπτομέρειες. </p>
          </div>
        </div>
        <div class="row no-gutters">
          <div class="col-lg-6 text-white showcase-img" style="background-image: url('img/business-communication-computer.jpg');"></div>
          <div class="col-lg-6 my-auto showcase-text">
            <h2>Συνεργάζεσαι ήδη μαζί μας; Δες τα μηνύματά σου!</h2>
            <p class="lead mb-0">Επέλεξε σύνδεση, συμπλήρωσε το username και το password σου. Πάτησε το κουμπί σύνδεση και θα μεταφερθείς αυτομάτως στο προφιλ σου. Εκεί, μπορείς να δεις τα μηνύματα που σου έχουν σταλθεί.</p>
          </div>
        </div>
	  </div>
    </section>

    <!-- Developers -->
    <section id="developers" class="testimonials text-center bg-light">
      <div class="container">
        <h2 class="mb-5">Η ομάδα μας</h2>
        <div class="row">
          <div class="col-lg-7">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="img/anogeianaki.jpg" alt="">
              <h5>Ανωγειανάκη Θεονύμφη</h5>
              <p class="font-weight-light mb-0">CMO & Web Developer  </p>
            </div>
          </div>
          <div class="col-lg-3">
            <div class="testimonial-item mx-auto mb-5 mb-lg-0">
              <img class="img-fluid rounded-circle mb-3" src="img/fragkedaki.jpg" alt="">
              <h5>Φραγκεδάκη Κλειώ</h5>
              <p class="font-weight-light mb-0">CEO & Web Developer</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Contact us -->
    <section id="contact" class="call-to-action text-white">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h2 class="mb-4 text-center">Επικοινώνησε μαζί μας!<h2>
          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">

					
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
    </section>

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
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>

	<script>

		$(".chosen-select").chosen({
  no_results_text: "Oops, nothing found!"
})
	</script>

  </body>

</html>
