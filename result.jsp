<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		td {text-align: center;}
	</style>
</head>

		<section>
			
			<%
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery("SELECT c.cust_no, n.cust_name, c.resv_date, c.court_no FROM tbl_resv_202301 c JOIN tbl_cust_202301 n ON c.cust_no = n.cust_no WHERE c.cust_no = '" + request.getParameter("num") + "' ORDER BY c.resv_date DESC");
					
					if (!rs.next()) { %>
						<h1 style="text-align: center; margin-bottom: 20px;">코트예약 정보가 존재하지 않습니다.</h1>
						<input style="display: block; margin: 0 auto;" type="button" value=" 돌아가기 " onclick="location.href='list.jsp'" />
					<% } else { %>
						<h2>고객번호:<%= request.getParameter("num") %>님의 코트예약 조회</h2>
						<form>
							<table>
								
								<tr>
									<th>고객번호</th>
									<th>이름</th>
									<th>코트사용일자</th>
									<th>코트번호</th>
								</tr>
						<%
						
						out.println ("<tr><td>" + rs.getString(1) + "</td>");
						out.println ("	  <td>" + rs.getString(2) + "</td>");
						out.println ("	  <td>" + rs.getString(3).substring(0, 4) + "년 " + rs.getString(3).substring(4, 6) + "월 " + rs.getString(3).substring(6, 8) + "일" + "</td>");
						out.println ("	  <td>" + rs.getString(4) + "</td></tr>");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td>");
							out.println ("	  <td>" + rs.getString(4) + "</td></tr>");
						} %>
								<tr>
									<th colspan="4">
										<input type="button" value=" 돌아가기 " onclick="location.href='list.jsp'" />
									</th>
								</tr>
							</table>
						</form>
					<% }
					
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</section>

<%@ include file="bottom.jsp" %>