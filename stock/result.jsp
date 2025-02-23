<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>주식 매수 내역 조회</h2>
			
			<table>
				<tr>
					<th>부서코드</th>
					<th>부서명</th>
					<th>총매수주식수</th>
					<th>총매수주식금액</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT d.dept_code, d.dept_name, SUM(b.buy_number), SUM(b.buy_price) FROM tbl_dept d JOIN tbl_buy_stock b ON d.dept_code = b.dept_code GROUP BY d.dept_code, d.dept_name ORDER BY d.dept_code ASC");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + String.format("%,d", rs.getInt(3)) + "</td>");
							out.println ("	  <td>￦" + String.format("%,d", rs.getInt(4)) + "</td>");
						}
						
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>
		
<%@ include file="footer.jsp" %>