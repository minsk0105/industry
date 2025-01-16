<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

		<section>
			<%
				String one = request.getParameter("one");
				String two = request.getParameter("two");
				String three = request.getParameter("three");
				String four = request.getParameter("four");
				
				String sql = "INSERT INTO tbl_resv_202301 VALUES ('" + one + "','" + three + "','" + four + "','" + two + "')";
				
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
			alert ("예약이 완료되었습니다.");
			location.href = "index.jsp";
		</script>

<%@ include file="bottom.jsp" %>