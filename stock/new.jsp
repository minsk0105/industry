<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		td:nth-child(2) {text-align: left;}
	</style>
</head>

		<script>
			function ck(f) {
				if (f.date.value === "") {
					alert ("매수일자가 입력되지 않았습니다!");
					f.date.focus();
					return false;
				}
				if (f.name.value === "") {
					alert ("종목명이 입력되지 않았습니다!");
					f.name.focus();
					return false;
				}
				if (f.code.value === "") {
					alert ("종목코드가 입력되지 않았습니다!");
					f.code.focus();
					return false;
				}
				if (f.num.value === "") {
					alert ("매수수량이 입력되지 않았습니다!");
					f.num.focus();
					return false;
				}
				if (f.price.value === "") {
					alert ("매수가격이 입력되지 않았습니다!");
					f.price.focus();
					return false;
				}
				if (f.dept.value === "") {
					alert ("부서코드가 입력되지 않았습니다!");
					f.dept.focus();
					return false;
				}
			}
		</script>
		
		<section>
			<h2>주식 매수 등록</h2>
			
			<form action="new_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<td>매수일자</td>
						<td><input type="text" name="date" /> 예)20220302</td>
					</tr>
					<tr>
						<td>종목명</td>
						<td>
							<select name="name" id="">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT stock_item_code, stock_item_name FROM tbl_stock_item ORDER BY stock_item_code ASC");
										
										while (rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
										}
										
										stmt.close();
										con.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [100002]카카오
						</td>
					</tr>
					<tr>
						<td>종목코드</td>
						<td><input type="text" name="code" /> 예)100001</td>
					</tr>
					<tr>
						<td>매수수량</td>
						<td><input type="text" name="num" /> 주</td>
					</tr>
					<tr>
						<td>매수가격</td>
						<td><input type="text" name="price" /> 원</td>
					</tr>
					<tr>
						<td>부서코드</td>
						<td>
							<select name="dept" id="">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery("SELECT dept_code, dept_name FROM tbl_dept ORDER BY dept_code ASC");
										
										while (rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
										}
										
										stmt.close();
										con.close();
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [100]국내펀드1팀
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value=" 주식매수등록 " />
							<input type="reset" value=" 다시쓰기 " onclick="alert ('모든 내용이 초기화됩니다!')" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		
<%@ include file="footer.jsp" %>