<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %>


<%

UserDAO udao = new UserDAO();
LocationDAO ldao = new LocationDAO();
%>

<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="mainNav" style="background-color:#14141f">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="./index.jsp#page-top" id="title"></i> <i class='fa fa-ambulance'></i> Hapi4u</a>
			<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			  Menu
			  <i class="fa fa-bars"></i>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
			  <ul class="navbar-nav text-uppercase ml-auto">
			  <li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="./index.jsp#services"> Υπηρεσιες</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="./index.jsp#about">Πως λειτουργει</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="./index.jsp#developers">Η ομαδα μας</a>
				</li>
				<li class="nav-item">
				  <a class="nav-link js-scroll-trigger" href="./index.jsp#contact">Επικοινωνια</a>
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
