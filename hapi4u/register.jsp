<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>


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
		<link href="css/register.css" rel="stylesheet">s
		<link href="css/landing-page.css" rel="stylesheet">
		<link href="../hapi4u/css/register.css" rel="stylesheet">
		<link href="../hapi4u/css/landing-page.css" rel="stylesheet">

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
					<li class="nav-item">
					  <a class="nav-link js-scroll-trigger" href="login.jsp"><b>Εισοδος</b></button></a>
					</li>
					<li class="nav-item">
					  <a class="nav-link js-scroll-trigger" href="register.jsp"><b>Εγγραφη</b></button></a>
					</li>
				  </ul>
				</div>
			</div>
		</nav>

		<!-- /container -->

		<div class="container theme-showcase" role="main">

			<h2 class="form-signin-heading text-center">Εγγραφή</h2>
			<h4 class="form-signin-heading text-center"><small>Δημιούργησε λογαριασμό στο hapi4u συμπληρώνοντας απλώς την παρακάτω φόρμα!</small></h4>

			<hr>

			<% if(session.getAttribute("message") != null) { %>
				<div class="alert alert-danger text-center" role="alert"><%=(String)session.getAttribute("message") %></div>
			<% } %>

			<form name="form-register" class="form-horizontal" method="post" action="../servlet/RegisterController">
				<div class="form-group row">
					<label for="email" class="col-sm-2 offset-sm-2 control-label"><b>Email:</b></label>
					<div class="col-sm-4">
						<input name="email" type="text" class="form-control" id="inputEmail" placeholder="example@gmail.com">
					</div>
				</div>
				<div class="form-group row">
					<label for="password" class="col-sm-2 offset-sm-2 control-label"><b>Κωδικός:</b></label>
					<div class="col-sm-4">
						<input name="password" type="password" class="form-control" id="inputPassword" placeholder="Password">
					</div>
					</div>
				<div class="form-group row">
					<label for="password" class="col-sm-3 offset-sm-1 control-label"><b>Επιβεβαίωση Kωδικού:</b></label>
					<div class="col-sm-4">
						<input name="valid_password" type="password" class="form-control" id="inputValidPassword" placeholder="Password">
					</div>
				</div>
				<br>
				<br>
				<div class="text-center">
					<button type="submit" class="btn btn-lg btn-primary "><b>Δημιουργία λογαριασμού</b></button>
				</div>
			</form>
		</div>


	  <!-- Footer -->

	  <footer class="py-5 bg-dark">
	  	<div class="container">
		  	<p class="m-0 text-center text-white">Copyright &copy; hapi4u 2018</p>
		  </div>
		  <!-- /.container -->
	  </footer>

		<!-- End footer -->

		 <!-- Bootstrap core JavaScript -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
	</body>
</html>
