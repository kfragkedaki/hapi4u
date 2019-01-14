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
	<link href="css/choose_who_are_you.css" rel="stylesheet">


	<link href="https://cdn.rawgit.com/harvesthq/chosen/gh-pages/chosen.min.css" rel="stylesheet"/> <!--For dropdown option-->

  </head>

  <body>

<jsp:include page="navbar.jsp" />

<div class="container1">
<div class="split left">
  <img src="img/achievement-agreement-body-language.jpg" class="image" style="width:100%">
  <div class="middle2">
    <div class="text1">Είσοδος</div>
  </div>
      <h2>Είσαι χρήστης;</h2>
    <p>Πάτησε εδώ.</p>
</div>
</div>

<div class="split middle">
  <div class="centered">
    <img src="img/achievement-agreement-body-language.jpg" alt="Avatar man">
    <h2>Είσαι χρήστης;</h2>
    <p>Some text here too.</p>
  </div>
</div>

<div class="split right">
  <div class="centered">
    <img src="img_avatar.png" alt="Avatar man">
    <h2>Είσαι διαχειριστής;</h2>
    <p>Some text here too.</p>
  </div>
</div>




<jsp:include page="footer.jsp" />

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>


  </body>

</html>
