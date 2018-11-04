<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %> 
<%@ page import="java.util.*" %>

		<%--   Gets the results from the request --%>
    
		<% 
		
		String title = request.getParameter("title");
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String msg = request.getParameter("message");
		int admin_id = Integer.parseInt(session.getAttribute("admin_id_receiver").toString());
		int pharmacy_id = Integer.parseInt(session.getAttribute("pharmacy_id_receiver").toString());
		Date date = new Date();
		
 		
		try {
			
			mdao.saveMessage(title,name,email,msg,date.toString(),pharmacy_id,admin_id);
			
		} catch(Exception e) {
			
	
			request.setAttribute("msg", "Message is not send");
%>
		<jsp:forward page="index.jsp?#contact"/>	
	<% } %>
	
	<jsp:forward page="messageConfirmation.jsp"/>

			
		