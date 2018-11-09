<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="hapi4u_javafiles.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.DateFormat" %>
<%@ page import="java.text.SimpleDateFormat" %>

		<%--   Gets the results from the request --%>

		<% 
		String title = new String(request.getParameter("title").getBytes("ISO-8859-1"),"UTF-8");
		String name = new String(request.getParameter("name").getBytes("ISO-8859-1"),"UTF-8");
		String email = new String(request.getParameter("email").getBytes("ISO-8859-1"),"UTF-8");
		String msg = new String(request.getParameter("message").getBytes("ISO-8859-1"),"UTF-8");
		int user_id = Integer.parseInt(session.getAttribute("user_id_receiver").toString());
		DateFormat df = new SimpleDateFormat("dd/MM/yy HH:mm");
		Date date = new Date();

		MessageDAO mdao = new MessageDAO();

		try {
				mdao.saveMessage(title,name,email,msg,(df.format(date)).toString(),user_id);


		} catch(Exception e) {


			request.setAttribute("msg", "Το μήνυμα δεν στάλθηκε!");
%>
		<jsp:forward page="index.jsp?#contact"/>
	<% } %>

	<jsp:forward page="messageConfirmation.jsp"/>
