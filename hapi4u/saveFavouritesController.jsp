<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ page import="hapi4u_javafiles.*" %>

		<%--   Gets the results from the request --%>

		<%
		int user_id = Integer.parseInt(request.getParameter("user_id"));
    int pharmacy_id = Integer.parseInt(request.getParameter("pharmacy_id"));
		String date = request.getParameter("date").toString();
		String time = request.getParameter("time").toString();

		List<Pharmacy> pharmacies_ids = request.getParameter(pharmacies_ids);

    MyFavouritesDAO fdao = new MyFavouritesDAO();


		try {


			fdao.saveMyFavourites( user_id, pharmacy_id);


		} catch(Exception e) {

			request.setAttribute("message", e.getMessage());
	%>
		<jsp:forward page="pharmacies.jsp?<%for(int i=0; i< pharmacies_ids.length; i++) {locations=%><%=parmacies_ids[i]%><% &}%>date=<%=date%>&time=<%=%time>"/>
	<% }%>
    <jsp:forward page="pharmacies.jsp?<%for(int i=0; i< pharmacies_ids.length; i++) {locations=%><%=parmacies_ids[i]%><% &}%>date=<%=date%>&time=<%=%time>"/>
