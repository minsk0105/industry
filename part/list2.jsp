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
			<h2>학과 조회</h2>
			
			<form action="list2_up.jsp" method="GET">
				<table>
					<tr>
						<th>학과번호</th>
						<th>학과이름</th>
						<th>지원학생수</th>
						<th>상태</th>
						<th>상태변경</th>
					</tr>
					
					<%
						try {
							Class.forName ("oracle.jdbc.OracleDriver");
							Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
							
							Statement stmt = con.createStatement();
							ResultSet rs = stmt.executeQuery("SELECT p.partno, p.pname, count(s.partno), p.status FROM part p LEFT JOIN students s ON p.partno = s.partno GROUP BY p.partno, p.pname, p.status ORDER BY p.partno asc");
							
							while (rs.next()) {
								out.println ("<tr><td>" + rs.getString(1) + "</td>");
								out.println ("	  <td>" + rs.getString(2) + "</td>");
								out.println ("	  <td>" + rs.getString(3) + "</td>");
								out.println ("	  <td>");
								
								if (rs.getString(4).equals("1")) out.print ("지원가능");
								else out.print ("지원불가능");
								
								out.println ("	  </td>");
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