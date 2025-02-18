<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<%
				String year = request.getParameter("year");
				String room = request.getParameter("room");
				String num = request.getParameter("num");
				String kor = request.getParameter("kor");
				String eng = request.getParameter("eng");
				String mat = request.getParameter("mat");
				
				String sql = "INSERT INTO tbl_score_201905 VALUES ('" + year + "', '" + room + "', '" + num + "', '" + kor + "', '" + eng + "', '" + mat + "')";
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
			alert ("학생등록이 정상적으로 완료되었습니다!");
			location.href = "index.jsp";
		</script>
		
<%@ include file="bottom.jsp" %>