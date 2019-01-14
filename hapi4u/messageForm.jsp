<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();
%>

<!DOCTYPE html>
<html lang="en">

  <head>

    <style>
        body{
            background: -webkit-linear-gradient(left, white, silver);
        }
            .contact-form{
          margin-top: 10%;
          margin-bottom: 5%;
          width: 70%;
          background-color: darkgrey;
        }
        .contact-form .form-control{
          border-radius:1rem;
        }
        .contact-image{
          text-align: center;
        }
        .contact-image img{
          border-radius: 6rem;
          width: 11%;
          margin-top: -3%;
          transform: rotate(29deg);
        }
        .contact-form form{
          padding: 7%;
        }
        .contact-form form .row{
          margin-bottom: -7%;
        }
    </style>

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

    <section id="contact" class="call-to-action">
      <div class="container contact-form">
        <div class="contact-image">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSDZ7dLlnFL-ci6tXjC1PrveQSwWrC-jrRlsj6xt8y1DpFpqxmq" alt="rocket_contact"/>
        </div>
        <div class="row">
          <div class="col-xl-9 mx-auto">
            <%String name = new String(request.getParameter("pharmacy_name").getBytes("ISO-8859-1"),"UTF-8");;%>
            <h2 class="mb-4 text-center"><%=name%><h2>
            <h3 class="mb-4 text-center">Συμπλήρωσε την παρακάτω φόρμα!<h3>

          </div>
          <div class="col-md-10 col-lg-8 col-xl-7 mx-auto">


			  <form name="sentMessage" method="post" action="messageController.jsp">
			    <div class="control-group form-group">
				  <div class="controls">
					<input type="text" class="form-control" name="title" placeholder="Τίτλος* " required>
				  </div>
				</div>
				<div class="control-group form-group">
				  <div class="controls">
					<input type="text" class="form-control" id="name" name="name" placeholder="Όνομα* " required>
					<p class="help-block"></p>
				  </div>
				</div>
				<div class="control-group form-group">
				  <div class="controls">
					<input type="email" class="form-control" id="email" name= "email" placeholder="Email* " required>
				  </div>
				</div>
				<div class="control-group form-group">
				  <div class="controls">
					<textarea rows="10" cols="100" class="form-control" id="message" name="message" maxlength="999" placeholder="Μήνυμα" style="resize:none"required></textarea>
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

    <jsp:include page="footer.jsp" />

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script src="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.jquery.min.js"></script>


  </body>

</html>
