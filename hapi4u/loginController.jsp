<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %> 

		<%--   Gets the results from the request --%>
    
		<% 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDAO udao = new UserDAO();
		
		try {
			
			udao.authenticate(email, password);
			
		} catch(Exception e) {
	
			request.setAttribute("message", e.getMessage());
%>
		<jsp:forward page="login.jsp"/>	
	<% }	
		session.setAttribute("user_object", udao.findUser(email)); %>
	
	<jsp:forward page="index.jsp"/>	
			
		