<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<style>
	.btn {
		border: none;
		background-color: white;
		cursor: pointer;
	}
</style>
		<section>
			<h2>학생 조회</h2>
			
			<form action="list1_up.jsp" method="GET">
				<table>
					<tr>
						<th>학번</th>
						<th>학생이름</th>
						<th>과목번호</th>
						<th>과목이름</th>
						<th>수정</th>
					</tr>
					
					<%
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("select * from students s join part p on s.partno = p.partno order by s.sno asc");
							
							while (rs.next()) {
								out.println ("<tr><td>" + rs.getString(1) + "</td>");
								out.println ("	  <td>" + rs.getString(2) + "</td>");
								out.println ("	  <td>" + rs.getString(3) + "</td>");
								out.println ("	  <td>" + rs.getString(5) + "</td>");
								out.println ("	  <td><button type='submit' class='btn' name='num' value='" + rs.getString(1) + "'><u>수정</u></button></td></tr>");
							}
							
							stmt.close();
							con.close();
						} catch (Exception e) {
							e.printStackTrace();
						}
					%>
				</table>
			</form>
		</section>
<%@ include file="footer.jsp" %>