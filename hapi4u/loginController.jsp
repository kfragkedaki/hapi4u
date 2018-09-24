<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page errorPage="error.jsp"%>
<%@ page import="hapi4u_javafiles.*" %> 

		<%--   Gets the results from the request --%>
    
		<% 
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		UserDAO udao = new UserDAO();
		
 		
		try {
			
			udao.authenticateUser(email, password);
			
		} catch(Exception e) {
	
			request.setAttribute("message", e.getMessage());
%>
		<jsp:forward page="login.jsp"/>	
	<% }
		
		for (User user : udao.getUsers()){
			
			if (email.equals(user.getEmail())){
				
				session.setAttribute("user_object", user);
				
				if ( (user.getIfAdministrator()).equals("0") && (user.getIfPharmacy()).equals("0")){
					%>
					<jsp:forward page="index.jsp"/>
				<%}else if (user.getIfPharmacy() == "1"){
					%>
					<jsp:forward page="profil.jsp"/>
				<%}else{
					%>
					<jsp:forward page="profil.jsp"/>
				<%}
				break;
			}
		}%>

			
		