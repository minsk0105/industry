<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		td {text-align: center;}
	</style>
</head>

		<section>
			<h2>사용일수집계</h2>
			
			<table>
				<tr>
					<th>고객번호</th>
					<th>이름</th>
					<th>사용일수</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT c.cust_no, n.cust_name, count(c.cust_no) FROM tbl_resv_202301 c JOIN tbl_cust_202301 n ON c.cust_no = n.cust_no GROUP BY c.cust_no, n.cust_name ORDER BY c.cust_no ASC");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td></tr>");
						}
						
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>

<%@ include file="bottom.jsp" %>