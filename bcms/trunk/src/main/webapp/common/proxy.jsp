<%@page import="org.apache.http.impl.client.HttpClientBuilder"%>
<%@page import="org.apache.http.client.HttpClient"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String url = request.getParameter("url");
	Map params = request.getParameterMap();
	HttpClient client = HttpClientBuilder.create().build();
	
%>
<%!HttpClient getClient() {
		request.
		return null;
	}%>