<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		<section>
			<%
				String numStr = request.getParameter("num");
				String name = request.getParameter("name");
				String statusStr = request.getParameter("status");
				String basicStr = request.getParameter("basic");
				int num = Integer.parseInt(numStr);
				int status = Integer.parseInt(statusStr);
				int basic = Integer.parseInt(basicStr);
				String sql = "UPDATE part SET partno = " + num + ", pname = '" + name + "', status = " + status + " WHERE partno = " + basic;
			
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
			location.href = "list2.jsp";
		</script>

<%@ include file="footer.jsp" %>