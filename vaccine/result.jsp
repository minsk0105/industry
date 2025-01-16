<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		td {text-align: left;}
	</style>
	
	<script>
		function ck(f) {
			if (f.num.value === "") {
				alert ("접종이력번호를 입력해 주세요.");
				return false;
			}
			if (f.date.value === "") {
				alert ("접종일차를 입력해 주세요.");
				return false;
			}
			if (f.round.value === "") {
				alert ("접종회차를 입력해 주세요.");
				return false;
			}
		}
	</script>
</head>


		<section>
		
			<%
				String num = "";
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery ("select max(vaccinate_no) from  tbl_vaccination");
					
					rs.next();
					num = rs.getString(1);
					
					stmt.close();
					con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				String code = num.substring(1);
				int result = Integer.parseInt(code) + 1;
			%>
			
			<h2>예방접종이력 등록</h2>
			
			<form action="result_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					
					<tr>
						<th>접종이력번호</th>
						<td><input type="text" name="num" value="A<%= String.format("%03d", result) %>" readonly> 예) A001</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>
							<select name="id">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select people_id from tbl_vaccination");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>" + rs.getString(1) + "</option>");
										}
										
										stmt.close();
										con.close();
										
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) C001
						</td>
					</tr>
					<tr>
						<th>백신코드</th>
						<td>
							<select name="code">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select vaccine_code, infectious_disease from tbl_vaccine");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "] " + rs.getString(2) + "</option>");
										}
										
										stmt.close();
										con.close();
										
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [V007] 홍역
						</td>
					</tr>
					<tr>
						<th>접종일자</th>
						<td><input type="text" name="date"> 예) 230701</td>
					</tr>
					<tr>
						<th>접종회차</th>
						<td><input type="text" name="round"> 예) 1</td>
					</tr>
					<tr>
						<th>접종결과</th>
						<td>
							<select name="result">
								<option value="N">[N] 정상</option>
								<option value="A">[A] 이상</option>
							</select> 예) [N] 정상
						</td>
					</tr>
					<tr>
						<th>기관코드</th>
						<td>
							<select name="location">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
										
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select visit_agency from tbl_institutional");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "</option>");
										}
										
										stmt.close();
										con.close();
										
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) B023
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 등 록 ">
							<input type="reset" value=" 다시쓰기 " onclick="alert ('입력하신 정보가 초기화됩니다!')">
						</th>
					</tr>
					
				</table>
			</form>
		</section>
		
<%@ include file="footer.jsp" %>