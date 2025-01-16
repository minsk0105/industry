<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		td {text-align: left;}
	</style>
</head>
			<%
				String num = "";
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery ("select max(P_NUMBER)+1 from  tbl_ferformance");
					
					rs.next();
					num = rs.getString(1);
					
					stmt.close();
					con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>

			<h2>방문일자별 네일아트(네일)통계</h2>
			
			<form action="result_db.jsp">
				<table>
					<tr>
						<th>번호</th>
						<td><input type="text" name="v1" value="<%= num %>" readonly> 예) 1</td>
					</tr>
					<tr>
						<th>고객아이디</th>
						<td><input type="text" name="v2" value=""> 예) C001</td>
					</tr>
					<tr>
						<th>고객등급</th>
						<td>
							<input type="radio" name="v3" value="V" checked>우수고객 &nbsp;
							<input type="radio" name="v3" value="G">일반고객 &nbsp;
							<input type="radio" name="v3" value="S">학생고객 &nbsp;
						</td>
					</tr>
					<tr>
						<th>네일코드</th>
						<td>
							<select name="v4">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select * from tbl_menu where menutype = 'N'");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
										}
									
										stmt.close();
										con.close();
								
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [N01]풀코트
						</td>
					</tr>
					<tr>
						<th>패디코드</th>
						<td>
							<select name="v5">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select * from tbl_menu where menutype = 'P'");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
										}
									
										stmt.close();
										con.close();
								
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [P01]풀코트
						</td>
					</tr>
					<tr>
						<th>기타코드</th>
						<td>
							<select name="v6">
								<%
									try {
										Class.forName ("oracle.jdbc.OracleDriver");
										Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
									
										Statement stmt = con.createStatement();
										ResultSet rs = stmt.executeQuery ("select * from tbl_menu where menutype = 'E'");
										
										while(rs.next()) {
											out.println ("<option value='" + rs.getString(1) + "'>[" + rs.getString(1) + "]" + rs.getString(2) + "</option>");
										}
									
										stmt.close();
										con.close();
								
									} catch (Exception e) {
										e.printStackTrace();
									}
								%>
							</select> 예) [E00]해당없음
						</td>
					</tr>
					<tr>
						<th>방문일자</th>
						<td><input type="text" name="v7" value=""> 예) 2023-08-01</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 등 록 ">
							<input type="reset" value=" 다시쓰기 " onclick="alert ('모든 내용이 초기화 됩니다!')">
						</th>
					</tr>
				</table>
			</form>
<%@ include file="footer.jsp" %>