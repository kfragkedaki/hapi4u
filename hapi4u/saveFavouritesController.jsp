<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="hapi4u_javafiles.*" %>

		<%--   Gets the results from the request --%>

		<%
		int user_id = Integer.parseInt(request.getParameter("user_id"));
    int pharmacy_id = Integer.parseInt(request.getParameter("pharmacy_id"));
		String previous_url = request.getHeader("Referer");

    MyFavouritesDAO fdao = new MyFavouritesDAO();


		try {


			fdao.saveMyFavourites( user_id, pharmacy_id);


		} catch(Exception e) {

			request.setAttribute("message", e.getMessage());
	 }
			response.sendRedirect(previous_url);%>
