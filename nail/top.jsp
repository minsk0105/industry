<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>네일아트관리 프로그램</title>
<style>
	* {margin: 0; padding: 0}
	
	a {color: inherit; text-decoration: none;}
	
	.wrap {width: 1000px; margin: 0 auto;}
	
	.header {width: 100%; height: 99px; background: blue; text-align: center; color: #FFF; align-content: center;}
	
	.nav {width: 100%; height: 55px; background: #AAA; color: #FFF; align-content: center;}
	
	.section {width: 100%; height: 500px; background: #EEE; overflow: hidden;}
	
	.footer {width: 100%; height: 55px; background: blue; text-align: center; color: #FFF; align-content: center;}
	
	.nav a {margin-left: 33px;}
	
	.section h2 {padding: 30px 0; text-align: center;}
	
	.section p {margin: 10px 0;}
	
	table, td, th {border: 1px solid #000; text-align: center;}
	
	table {width:80%; margin: 0 auto;}
</style>
</head>
<body>

	<div class="wrap">
		<div class="header"><h1>네일아트관리 프로그램</h1></div>
		
		<div class="nav">
			<a href="menu.jsp">네일메뉴조회</a>
			<a href="result.jsp">네일실적등록</a>
			<a href="list.jsp">네일실적조회</a>
			<a href="report.jsp">네일아트통계</a>
			<a href="index.jsp">홈으로</a>
		</div>
		
		<div class="section">