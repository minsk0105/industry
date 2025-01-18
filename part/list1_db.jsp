<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		<section>
			<%
				String num = request.getParameter("num");
				String name = request.getParameter("name");
				String part = request.getParameter("part");
				String sql = "UPDATE students SET sno = '" + num + "', sname = '" + name + "', partno = '" + part + "' WHERE sno = '" + num + "'";
			
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
			alert ("수정이 완료 되었습니다!");
			location.href = "list1.jsp";
		</script>
<%@ include file="footer.jsp" %>