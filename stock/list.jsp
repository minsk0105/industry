<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>주식 매수 내역 조회</h2>
			
			<table>
				<tr>
					<th>매수일자</th>
					<th>종목코드</th>
					<th>종목명</th>
					<th>매수수량</th>
					<th>매수가격</th>
					<th>부서명</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT b.buy_date, b.stock_item_code, s.stock_item_name, b.buy_number, b.buy_price, d.dept_name FROM tbl_buy_stock b, tbl_stock_item s, tbl_dept d WHERE b.stock_item_code = s.stock_item_code AND b.dept_code = d.dept_code ORDER BY b.buy_date ASC");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1).substring(0, 4) + "년" + rs.getString(1).substring(4, 6) + "월" + rs.getString(1).substring(6, 8) + "일</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td>");
							out.println ("	  <td>" + String.format("%,d", rs.getInt(4)) + "</td>");
							out.println ("	  <td>￦" + String.format("%,d", rs.getInt(5)) + "</td>");
							out.println ("	  <td>" + rs.getString(6) + "</td>");
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