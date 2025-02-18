<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<%
				String year = request.getParameter("year");
				String room = request.getParameter("room");
				String num = request.getParameter("num");
				String name = request.getParameter("name");
				String birth = request.getParameter("birth");
				String gender = request.getParameter("gender");
				String tel1 = request.getParameter("tel1");
				String tel2 = request.getParameter("tel2");
				String tel3 = request.getParameter("tel3");
				
				String sql = "INSERT INTO tbl_student_201905 VALUES ('" + year + "', '" + room + "', '" + num + "', '" + name + "', '" + birth + "', '" + gender + "', '" + tel1 + "', '" + tel2 + "', '" + tel3 + "')";
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