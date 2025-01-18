<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

		<script>
			function ck(f) {
				if (f.num.value === "") {
					alert ("학생번호가 입력되지 않았습니다.");
					f.num.focus();
					return false;
				}
				
				if (f.name.value === "") {
					alert ("학생이름이 입력되지 않았습니다.");
					f.name.focus();
					return false;
				}
			};
		</script>

		<section>
			<h2>학생 등록</h2>
			
			<form action="new_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<th>학생번호</th>
						<td><input type="text" name="num" /></td>
					</tr>
					<tr>
						<th>학생이름</th>
						<td><input type="text" name="name" /></td>
					</tr>
					<tr>
						<th>학과지원</th>
						<td>
							<select name="part">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT * FROM part WHERE status NOT LIKE '0'");
										
										while (rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>" + rs.getString(2) + "</option>");
										}
										
										stmt.close();
										con.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select>
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 등록 " />
							<input type="button" value=" 조회 " onclick="location.href = 'list1.jsp'" />
						</th>
					</tr>
				</table>
			</form>
		</section>
<%@ include file="footer.jsp" %>