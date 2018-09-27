<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();

PharmacyDAO pdao = new PharmacyDAO();

AdministratorDAO adao = new AdministratorDAO();

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
    <%Pharmacy pharmacy = pdao.findPharmacyByUserId(user.getUserId());
	  
	%>
    <header>
     <img class="img-fluid d-block mx-auto"  style="width:30%; margin-top:30px;" src=<%=pharmacy.getImage()%> alt="">
    </header>

    <!-- Content section -->
    <section class="py-5">
      <div class="container">
        <h1><%=pharmacy.getName()%></h1>
        <p class="lead">Δημαρχείου 14, Αιγάλεω, 12242, ΑΤΤΙΚΗΣ</p>
      </div>
    </section>


	
	<div class="container">
<h3 class=" text-center">Μηνύματα</h3>
<div class="messaging">
      <div class="inbox_msg">
        <div class="inbox_people">
          <div class="headind_srch">
            <div class="recent_heading">
              <h4>Πρόσφατα</h4>
            </div>
            <div class="srch_bar">
              <div class="stylish-input-group">
                <input type="text" class="search-bar"  placeholder="Αναζήτηση" >
                <span class="input-group-addon">
                <button type="button"> <i class="fa fa-search" aria-hidden="true"></i> </button>
                </span> </div>
            </div>
          </div>
          <div class="inbox_chat">
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5>georgean@gmail.com<span class="chat_date">Aug 28</span></h5>
                  <p><h5>Καλησπέρα. Μπορώ να βρω στο κατάστημά σας το Collagen Power Pro Active Liquid Lemon; Μήπως θα...</h5></p>
                </div>
				<button class="btn"><i class="fa fa-trash"></i></button>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5> mel.st@hotmail.com<span class="chat_date">Aug 26</span></h5>
                  <p><h5>Γεια σας! Μήπως έχετε την κρέμα σώματος "Pure Seduction" της Victoria Secret;</h5></p>
                </div>
              </div>
            </div>
            <div class="chat_list active_chat">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5>nick.cave@gmail.com<span class="chat_date">Aug 01</span></h5>
                  <p>Καλησπέρα σας! Ονομάζομαι Νίκος Καβέρης. Σας στέλνω για να σας ρωτήσω αν θα μπορούσα να πάρω lonaridΝ χωρίς...</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5>helen_77@yahoo.gr <span class="chat_date">Jul 25</span></h5>
                  <p>Καλησπέρα! Ευχαριστούμε που επικοινωνήσστε μαζί μας! Βεβαίως έχουμε, αλλά για να χορηγηθεί απαιτείται...</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5>stef_len@gmail.com <span class="chat_date">Jul 05</span></h5>
                  <p>Ευχαριστούμε που επικοινωνήσατε μαζί μας. Βεβαίως και διαθέτουμε το προϊόν που αναζητείτε! Περάστε...</p>
                </div>
              </div>
            </div>
            <div class="chat_list">
              <div class="chat_people">
                <div class="chat_ib">
                  <h5>michael_par_2@hotmail.com <span class="chat_date">Jul 01</span></h5>
                  <p>Ευχαριστούμε που επικοινωνήσατε μαζί μας! Δυστυχώς, δεν έχουμε αποθέματα απ το προϊόν που ζητάτε αλλά μπορούμε...</p>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="mesgs">
          <div class="msg_history">
            <div class="incoming_msg">
              <div class="incoming_msg_img">nick.cave@gmail.com</div>
              <div class="received_msg" style="margin-top:50px;">
                <div class="received_withd_msg">
                  <p>Καλησπέρα σας! Ονομάζομαι Νίκος Καβέρης. Σας στέλνω για να σας ρωτήσω αν θα μπορούσα να πάρω lonaridΝ χωρίς τη συανταγή γιατρού; Κι αν ναι, το διαθέτεται στο φαρμακείο σας ή πρέπει να σας καλέσω για να το παραγγείλω; Ευχαριστώ πολύ ! </p>
                  <span class="time_date"> 01:01 PM    |    Aug 01</span></div>
              </div>
            </div>
          </div>
          <div class="type_msg">
            <div class="input_msg_write">
              <input type="text" class="write_msg" placeholder="Type a message" />
              <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
            </div>
          </div>
        </div>
      </div>
      
      
    </div></div>

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

  </body>

</html>
