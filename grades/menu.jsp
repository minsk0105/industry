<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>학생성적조회</h2>
			
			<table>
				<tr>
					<th>학년-반-번호</th>
					<th>이름</th>
					<th>성별</th>
					<th>국어</th>
					<th>영어</th>
					<th>수학</th>
					<th>총점</th>
					<th>평균</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT s.syear, s.sclass, s.sno, s.sname, s.gender, c.kor, c.eng, c.mat, (c.kor + c.eng + c.mat) AS total, TO_CHAR((c.kor + c.eng + c.mat) / 3, 'FM99.0') AS average FROM tbl_student_201905 s JOIN tbl_score_201905 c ON s.syear = c.syear AND s.sclass = c.sclass AND s.sno = c.sno");
						
						while (rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "-" + rs.getString(2) + "-" + rs.getString(3) + "</td>");
							out.println ("	  <td>" + rs.getString(4) + "</td>");
							out.println ("	  <td>");
							if (rs.getString(5).equals("M")) out.println ("남");
							else out.println ("여");
							out.println ("</td>");
							out.println ("	  <td>" + rs.getString(6) + "</td>");
							out.println ("	  <td>" + rs.getString(7) + "</td>");
							out.println ("	  <td>" + rs.getString(8) + "</td>");
							out.println ("	  <td>" + rs.getString(9) + "</td>");
							out.println ("	  <td>" + rs.getString(10) + "</td></tr>");
						}
						
						Statement stmt2 = con.createStatement();
						ResultSet rs2 = stmt2.executeQuery("SELECT sum(c.kor), sum(c.eng), sum(c.mat) FROM tbl_student_201905 s JOIN tbl_score_201905 c ON s.syear = c.syear AND s.sclass = c.sclass AND s.sno = c.sno");
						
						while (rs2.next()) {
							out.println ("<tr><td></td>");
							out.println ("	  <td></td>");
							out.println ("	  <td>학년총점</td>");
							out.println ("	  <td>" + rs2.getString(1) + "</td>");
							out.println ("	  <td>" + rs2.getString(2) + "</td>");
							out.println ("	  <td>" + rs2.getString(3) + "</td>");
							out.println ("	  <td></td>");
							out.println ("	  <td></td></tr>");
						}
						
						Statement stmt3 = con.createStatement();
						ResultSet rs3 = stmt3.executeQuery("SELECT ROUND(sum(c.kor) / count(c.kor), 1) AS akor, ROUND(sum(c.eng) / count(c.eng), 1) AS aeng, ROUND(sum(c.mat) / count(c.mat), 1) AS amat FROM tbl_student_201905 s JOIN tbl_score_201905 c ON s.syear = c.syear AND s.sclass = c.sclass AND s.sno = c.sno");
						
						while (rs3.next()) {
							out.println ("<tr><td></td>");
							out.println ("	  <td></td>");
							out.println ("	  <td>학년평균</td>");
							out.println ("	  <td>" + rs3.getString(1) + "</td>");
							out.println ("	  <td>" + rs3.getString(2) + "</td>");
							out.println ("	  <td>" + rs3.getString(3) + "</td>");
							out.println ("	  <td></td>");
							out.println ("	  <td></td></tr>");
						}
						
						stmt.close();
						stmt2.close();
						stmt3.close();
						con.close();
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>
		
<%@ include file="bottom.jsp" %>