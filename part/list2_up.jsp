<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<style>
	.btn {
		border: none;
		background-color: white;
		cursor: pointer;
	}
	
	input {text-align: center;}
	td {display: flex; justify-content: center; align-items: center;}
	input[type="radio"] {margin: 0 5px;}
</style>

		<script>
			function ck(f) {
				if (f.num.value === "") {
					alert ("학과번호가 입력되지 않았습니다.");
					f.num.focus();
					return false;
				}
				
				if (f.name.value === "") {
					alert ("학과이름이 입력되지 않았습니다.");
					f.name.focus();
					return false;
				}
			};
		</script>

		<section>
			<h2>학생 수정</h2>
			
			<%
				String num = request.getParameter("num");
				String sql = "SELECT * FROM part WHERE partno = '" + num + "'";
				
				String name = "";
			
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery(sql);
					
					if (rs.next()) {
						name = rs.getString(2);
					}
					
					stmt.close();
					con.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			
			<form action="list2_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<th>학생번호</th>
						<td>
							<input type="text" name="num" value="<%= num %>" />
							<input type="hidden" name="basic" value="<%= num %>" />
						</td>
					</tr>
					<tr>
						<th>학생이름</th>
						<td><input type="text" name="name" value="<%= name %>" /></td>
					</tr>
					<tr>
						<th>학과지원</th>
						<td>
							<input type="radio" name="status" value="1" checked />지원가능
							<input type="radio" name="status" value="0" />지원불가능
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 수정 " />
							<input type="button" value=" 조회 " onclick="location.href = 'list2.jsp'" />
						</th>
					</tr>
				</table>
			</form>
		</section>
<%@ include file="footer.jsp" %>