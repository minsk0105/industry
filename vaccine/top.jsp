<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>��ſ������� ���α׷�</title>
<style>
	* {margin: 0; padding: 0; box-sizing: border-box;}
	li {list-style: none; padding-left: 0;}
	a {text-decoration: none; color: inherit;}
	
	.wrap {width: 1200px; overflow: hidden; margin: 0 auto;}
	
	header {width: 100%; height: 70px; background-color: blue; display: flex; justify-content: center; align-items: center;}
	footer {width: 100%; height: 50px; background-color: blue; display: flex; justify-content: center; align-items: center;}
	header h1, footer h3 {color: white;}
	
	nav {width: 100%; height: 50px; background-color: #77F; display: flex; justify-content: left; align-items: center; color: white; padding-left: 30px;}
	a {margin-right: 30px; cursor: pointer;}
	
	section {width: 100%; overflow: hidden; padding: 30px;}
	section h2 {text-align: center; margin-bottom: 30px;}
	
	p {margin-top: 10px;}
	
	table, th, td {text-align: center; margin: 0 auto; border: 1px solid #000;}
	table {width: 80%;}
</style>
</head>
<body>
	<div class="wrap">
		<header><h1>�������� ����ó��������(v4.0) ������������ ���α׷�</h1></header>
	
		<nav>
			<a href="menu.jsp">���������ȸ</a>
			<a href="result.jsp">���������̷µ��</a>
			<a href="list.jsp">���������̷���ȸ</a>
			<a href="report.jsp">�����������</a>
			<a href="index.jsp">Ȩ����</a>
		</nav>