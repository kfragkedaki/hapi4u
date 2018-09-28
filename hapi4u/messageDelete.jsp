<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="hapi4u_javafiles.*" %> 

		<%--   Gets the results from the request --%>
    
		<% 
		int message_id = Integer.parseInt(request.getParameter("message_id"));
		
		MessageDAO mdao = new MessageDAO();
		
 		
		try {
			
			
			mdao.deleteMessageById(message_id);
			
			
		} catch(Exception e) {
	
			request.setAttribute("message", e.getMessage());
%>
		<jsp:forward page="profil.jsp"/>	
	<% }%>
	<jsp:forward page="profil.jsp"/>
		
	