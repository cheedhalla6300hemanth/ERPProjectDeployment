<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Invalidate session and redirect to the login page
    session.invalidate();
    response.sendRedirect("index");
%>
