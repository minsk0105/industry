<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>학생정보현황</h2>
			
			<table>
				<tr>
					<th>학번</th>
					<th>이름</th>
					<th>주민번호</th>
					<th>학과명</th>
					<th>성별</th>
					<th>전화번호</th>
					<th>이메일</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT * FROM tbl_student_202210 ORDER BY stuid ASC");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(4).substring(0, 6) + "-" + rs.getString(4).substring(6, 13) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td>");
							out.println ("	  <td>");
							
							if (rs.getString(4).substring(6, 7).equals("3")) out.println ("남자");
							else out.println ("여자");
							
							out.println ("	  </td>");
							out.println ("	  <td>" + rs.getString(5) + "</td>");
							out.println ("	  <td>" + rs.getString(6) + "</td></tr>");
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