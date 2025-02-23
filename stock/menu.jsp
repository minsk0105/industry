<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>주식 종목 조회</h2>
			
			<table>
				<tr>
					<th>종목코드</th>
					<th>종목명</th>
					<th>종목시장</th>
					<th>업종</th>
					<th>상장일</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_stock_item ORDER BY stock_item_code ASC");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td>");
							out.println ("	  <td>" + rs.getString(4) + "</td>");
							out.println ("	  <td>" + rs.getString(5).substring(0, 4) + "년" + rs.getString(5).substring(4, 6) + "월" + rs.getString(5).substring(6, 8) + "일</td></tr>");
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