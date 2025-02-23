<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<%
				String date = request.getParameter("date");
				String name = request.getParameter("name");
				String code = request.getParameter("code");
				String num = request.getParameter("num");
				String price = request.getParameter("price");
				String dept = request.getParameter("dept");
				
				String sql = "INSERT INTO tbl_buy_stock VALUES ('" + date + "', '" + name + "', '" + num + "', '" + price + "', '" + dept + "')";
				// out.println (sql);
				
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					rs.next();
					
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</section>
		
		<script>
			alert ("주식 매수 등록이 완료 되었습니다!");
			location.href = "index.jsp";
		</script>
		
<%@ include file="footer.jsp" %>