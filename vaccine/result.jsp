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
				alert ("�����̷¹�ȣ�� �Է��� �ּ���.");
				return false;
			}
			if (f.date.value === "") {
				alert ("���������� �Է��� �ּ���.");
				return false;
			}
			if (f.round.value === "") {
				alert ("����ȸ���� �Է��� �ּ���.");
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
			
			<h2>���������̷� ���</h2>
			
			<form action="result_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					
					<tr>
						<th>�����̷¹�ȣ</th>
						<td><input type="text" name="num" value="A<%= String.format("%03d", result) %>" readonly> ��) A001</td>
					</tr>
					<tr>
						<th>���̵�</th>
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
							</select> ��) C001
						</td>
					</tr>
					<tr>
						<th>����ڵ�</th>
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
							</select> ��) [V007] ȫ��
						</td>
					</tr>
					<tr>
						<th>��������</th>
						<td><input type="text" name="date"> ��) 230701</td>
					</tr>
					<tr>
						<th>����ȸ��</th>
						<td><input type="text" name="round"> ��) 1</td>
					</tr>
					<tr>
						<th>�������</th>
						<td>
							<select name="result">
								<option value="N">[N] ����</option>
								<option value="A">[A] �̻�</option>
							</select> ��) [N] ����
						</td>
					</tr>
					<tr>
						<th>����ڵ�</th>
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
							</select> ��) B023
						</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" �� �� ">
							<input type="reset" value=" �ٽþ��� " onclick="alert ('�Է��Ͻ� ������ �ʱ�ȭ�˴ϴ�!')">
						</th>
					</tr>
					
				</table>
			</form>
		</section>
		
<%@ include file="footer.jsp" %>