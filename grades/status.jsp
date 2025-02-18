<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>반별통계</h2>
			
			<table>
				<tr>
					<th>학년</th>
					<th>반</th>
					<th>교사명</th>
					<th>국어총점</th>
					<th>영어총점</th>
					<th>수학총점</th>
					<th>국어평균</th>
					<th>영어평균</th>
					<th>수학평균</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT d.syear, d.sclass, d.tname, SUM(s.kor), SUM(s.eng), SUM(s.mat), ROUND(AVG(s.kor), 1), ROUND(AVG(s.eng), 1), ROUND(AVG(s.mat), 1) FROM tbl_dept_201905 d JOIN tbl_score_201905 s ON d.syear = s.syear AND d.sclass = s.sclass GROUP BY d.syear, d.sclass, d.tname");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("	  <td>" + rs.getString(2) + "</td>");
							out.println ("	  <td>" + rs.getString(3) + "</td>");
							out.println ("	  <td>" + rs.getString(4) + "</td>");
							out.println ("	  <td>" + rs.getString(5) + "</td>");
							out.println ("	  <td>" + rs.getString(6) + "</td>");
							out.println ("	  <td>" + rs.getString(7) + "</td>");
							out.println ("	  <td>" + rs.getString(8) + "</td>");
							out.println ("	  <td>" + rs.getString(9) + "</td></tr>");
						}
						
						stmt.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>
		
<%@ include file="bottom.jsp" %>