<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="hapi4u_javafiles.*" %>

		<%--   Gets the results from the request --%>

		<%
		int user_id = Integer.parseInt(request.getParameter("user_id"));
    int pharmacy_id = Integer.parseInt(request.getParameter("pharmacy_id"));

    MyFavouritesDAO fdao = new MyFavouritesDAO();


		try {


			fdao.deleteMyFavourites( user_id, pharmacy_id);


		} catch(Exception e) {

			request.setAttribute("message", e.getMessage());
%>
		<jsp:forward page="pharmacies.jsp?locations=1&date=2018-10-11&time=12%3A32"/>
	<% }%>
	<jsp:forward page="pharmacies.jsp?locations=1&date=2018-10-11&time=12%3A32"/>