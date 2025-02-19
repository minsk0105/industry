<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<%
				String num = request.getParameter("num");
				String code = request.getParameter("code");
				String mid = request.getParameter("mid");
				String last = request.getParameter("last");
				String attend = request.getParameter("attend");
				String report = request.getParameter("report");
				String etc = request.getParameter("etc");
				
				String sql = "INSERT INTO tbl_score_202210 VALUES ('" + num + "', '" + code + "', '" + mid + "', '" + last + "', '" + attend + "', '" + report + "', '" + etc + "')";
				
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
			alert ("성적정보가 정상적으로 등록되었습니다!");
			location.href = "index.jsp";
		</script>
		
<%@ include file="footer.jsp" %>