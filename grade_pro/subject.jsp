<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
		
		<section>
			<h2>과목별 성적조회</h2>
			
			<form action="" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<td>과목코드</td>
						<td><input type="text" name="code" /></td>
						<td><input type="submit" value=" 조회 " /></td>
					</tr>
				</table>
			</form>
			
			<table style="margin-top: 30px;">
				<tr>
					<th>학번</th>
					<th>성명</th>
					<th>학과</th>
					<th>과목</th>
					<th>중간</th>
					<th>기말</th>
					<th>출석</th>
					<th>레포트</th>
					<th>기타</th>
					<th>총점</th>
					<th>학점</th>
				</tr>
				
				<%
					String code = request.getParameter("code");
				
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery("SELECT t.stuid, t.sname, t.dept_name, u.subname, c.midscore, c.finalscore, c.attend, c.report, c.etc FROM tbl_student_202210 t, tbl_score_202210 c, tbl_subject_202210 u WHERE t.stuid = c.sid AND c.subcode = u.subcode AND c.subcode = '" + code + "'");
						
						if (code != null) {
							while (rs.next()) {
								double average = (rs.getInt(5) + rs.getInt(6) + rs.getInt(7) + rs.getInt(8) + rs.getInt(9)) / 5.0;
								double mid = Math.round(rs.getInt(5) * 0.3 * 100) / 100.0;
								double last = Math.round(rs.getInt(6) * 0.3 * 100) / 100.0;
								double attend = Math.round(rs.getInt(7) * 0.2 * 100) / 100.0;
								double report = Math.round(rs.getInt(8) * 0.1 * 100) / 100.0;
								double etc = Math.round(rs.getInt(9) * 0.1 * 100) / 100.0;
								double total = mid + last + attend + report + etc;
								
								out.println ("<tr><td>" + rs.getString(1) + "</td>");
								out.println ("	  <td>" + rs.getString(2) + "</td>");
								out.println ("	  <td>" + rs.getString(3) + "</td>");
								out.println ("	  <td>" + rs.getString(4) + "</td>");
								out.println ("	  <td>" + rs.getString(5) + "</td>");
								out.println ("	  <td>" + rs.getString(6) + "</td>");
								out.println ("	  <td>" + rs.getString(7) + "</td>");
								out.println ("	  <td>" + rs.getString(8) + "</td>");
								out.println ("	  <td>" + rs.getString(9) + "</td>");
								out.println ("	  <td>" + total + "</td>");
								out.println ("	  <td>");
								
								if (total >= 95) out.println ("A+");
								else if (total >= 90) out.println ("A");
								else if (total >= 85) out.println ("B+");
								else if (total >= 80) out.println ("B");
								else if (total >= 75) out.println ("C+");
								else if (total >= 70) out.println ("C");
								else if (total >= 65) out.println ("D+");
								else if (total >= 60) out.println ("D");
								else if (total < 60) out.println ("F");
								
								out.println ("	  </td></tr>");
							}
							
							stmt.close();
							con.close();
						}
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>
		
<%@ include file="footer.jsp" %>