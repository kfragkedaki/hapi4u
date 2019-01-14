<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>



<!DOCTYPE html>
<html lang="en">

  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

	<meta http-equiv="refresh" content="3;url=index.jsp" />

    <title>Successfull send</title>

    <!-- Bootstrap core CSS -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

    <!-- Custom styles for this template -->
	<link href="css/landing-page.min.css" rel="stylesheet">
	<link href="css/login_page.css" rel="stylesheet">

  </head>

  <body>

  <jsp:include page="navbar.jsp" />

	<div class="container theme-showcase" role="main">

	<% if(request.getAttribute("msg") != null) { %>

		<div class="alert alert-danger text-center" role="alert">Tο μήνυμα δε στάλθηκε.</div>

   <% } else {%>
		<div class="alert alert-success text-center" role="alert">Το μύνημα στάλθηκε με επιτυχία!</div>

   <%}%>


	</div>
	<!-- /container -->


	<!-- footer -->
  <jsp:include page="footer.jsp" />

	<!-- Bootstrap core JavaScript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="js/jquery.min.js"></script>
	<script	src="js/bootstrap.min.js"></script>

  </body>
</html>
