<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Login page</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
	<link href="css/login_page.css" rel="stylesheet">
	<link href="css/landing-page.min.css" rel="stylesheet">


  </head>

  <body>

  <jsp:include page="navbar.jsp" />

  <div class="container theme-showcase" role="main" style="min-height: 83.2vh;">

        <% if(request.getAttribute("message") != null) { %>
			     <div class="alert alert-danger text-center" role="alert">Λάθος email ή κωδικός</div>
		    <% } %>


		<form class="form-signin" method="post" action="loginController.jsp">
			<h2 class="form-signin-heading text-center">Παρακαλώ συνδεθείτε.</h2>
			<input type="text" name="email" id="inputusername" class="form-control" placeholder="email" required>
			<input name="password" type="password" id="inputpassword" class="form-control" placeholder="κωδικός" required>

			<button class="btn btn-lg btn-primary btn-block" type="submit">Σύνδεση</button>
		</form>

	</div>
	<!-- /container -->

  <jsp:include page="footer.jsp" />

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>

  </body>
</html>
