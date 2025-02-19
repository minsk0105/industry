<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		.input {text-align: left;}
	</style>
</head>
		
		<script>
			function ck(f) {
				if (f.num.value === "") {
					alert ("학번이 입력되지 않았습니다!");
					f.num.focus();
					return false;
				}
				if (f.mid.value === "") {
					alert ("중간고사는 숫자가 아니거나 입력하지 않았습니다!");
					f.mid.focus();
					return false;
				}
				if (f.last.value === "") {
					alert ("기말고사는 숫자가 아니거나 입력하지 않았습니다!");
					f.last.focus();
					return false;
				}
				if (f.attend.value === "") {
					alert ("출석은 숫자가 아니거나 입력하지 않았습니다!");
					f.attend.focus();
					return false;
				}
				if (f.report.value === "") {
					alert ("레포트는 숫자가 아니거나 입력하지 않았습니다!");
					f.report.focus();
					return false;
				}
				if (f.etc.value === "") {
					alert ("기타는 숫자가 아니거나 입력하지 않았습니다!");
					f.etc.focus();
					return false;
				}
			}
		</script>
		
		<section>
			<h2>성적입력</h2>
			
			<form action="grade_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<td>학번</td>
						<td class="input"><input type="text" name="num" /></td>
					</tr>
					<tr>
						<td>교과코드</td>
						<td class="input">
							<select name="code" id="">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT subcode, subname FROM tbl_subject_202210 ORDER BY subcode ASC");
										
										while (rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>" + rs.getString(1) + "-" + rs.getString(2) + "</option>");
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
						<td>중간</td>
						<td class="input"><input type="number" name="mid" /></td>
					</tr>
					<tr>
						<td>기말</td>
						<td class="input"><input type="number" name="last" /></td>
					</tr>
					<tr>
						<td>출석</td>
						<td class="input"><input type="number" name="attend" /></td>
					</tr>
					<tr>
						<td>레포트</td>
						<td class="input"><input type="number" name="report" /></td>
					</tr>
					<tr>
						<td>기타</td>
						<td class="input"><input type="number" name="etc" /></td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value=" 등록 " />
							<input type="reset" value=" 취소 " />
						</td>
					</tr>
				</table>
			</form>
		</section>
		
<%@ include file="footer.jsp" %>