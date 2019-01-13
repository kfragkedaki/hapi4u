<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();
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
    <jsp:include page="navbar.jsp" />

    <!-- Contact us -->

    <section id="contact" class="call-to-action text-white">
      <div class="overlay"></div>
      <div class="container">
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <h2 class="mb-4 text-center">Συμπλήρωσε την παρακάτω φόρμα!<h2>
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
					<% int pharmacy_id = Integer.parseInt(request.getParameter("pharmacy_id"));
					session.setAttribute("user_id_receiver", udao.findUserIdByPharmacyId(pharmacy_id) );%>
					<!-- For success/fail messages -->
					<button type="submit" class="btn btn-primary">Send Message</button>
				</div>
			  </form>
          </div>
        </div>
      </div>
    </section>

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

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>


  </body>

</html>
