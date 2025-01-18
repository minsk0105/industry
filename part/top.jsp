<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>학과지원 프로그램</title>
<style>
	* {margin: 0; padding: 0; box-sizing: border-box;}
	.wrap {
		width: 1200px;
		overflow: hidden;
		margin: 0 auto;
	}
	
	header {
		width: 100%;
		height: 70px;
		background-color: blue;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	footer {
		width: 100%;
		height: 50px;
		background-color: blue;
		display: flex;
		justify-content: center;
		align-items: center;
	}
	
	header h1, footer h2 {color: white;}
	
	nav {display: flex; align-items: center; width: 100%; height: 50px; background-color: #77F;}
	a {text-decoration: none; color: white; margin: 0 30px; cursor: pointer;}
	
	section {
		width: 100%;
		padding: 30px;
	}
	
	section h2 {text-align: center; margin-bottom: 30px;}
	p {line-height: 25px;}
	
	table, th, td {border: 1px solid #000; text-align: center;}
	table {width: 100%;}
	form {width: 80%; margin: 0 auto;}
</style>
</head>
<body>
	<div class="wrap">
	
		<header><h1>학과 지원 프로그램</h1></header>
		<nav>
			<a href="new.jsp">학생등록</a>
			<a href="list1.jsp">학생조회/수정</a>
			<a href="list2.jsp">학과조회/수정</a>
			<a href="index.jsp">홈으로</a>
		</nav>