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
		<link href="css/login_page.css" rel="stylesheet">
		<link href="css/register.css" rel="stylesheet">
		<link href="css/landing-page.css" rel="stylesheet">

	</head>

	<body>
		<jsp:include page="navbar.jsp" />

		<!-- /container -->

		<div class="container theme-showcase" role="main">

			<h2 class="form-signin-heading text-center">Εγγραφή</h2>
			<h4 class="form-signin-heading text-center"><small>Δημιούργησε λογαριασμό στο hapi4u συμπληρώνοντας απλώς την παρακάτω φόρμα!</small></h4>

			<hr>

			<% if(session.getAttribute("message") != null) { %>
				<div class="alert alert-danger text-center" role="alert"><%=(String)session.getAttribute("message") %></div>
			<% } %>
			<%
			session.invalidate();
			%>

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


		<jsp:include page="footer.jsp" />

		<!-- End footer -->

		 <!-- Bootstrap core JavaScript -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.bundle.min.js"></script>
	</body>
</html>
