<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	
		<section>
			<h2>�����������</h2>
			
			<table>
				<tr>
					<th>����ڵ�</th>
					<th>��󰨿���</th>
					<th>�������</th>
					<th>��������Ƚ��</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery ("select v.vaccine_code, v.infectious_disease, v.vaccines, count(v.vaccine_code) from tbl_vaccine v join tbl_vaccination n on v.vaccine_code = n.vaccine_code group by v.vaccine_code, v.infectious_disease, v.vaccines order by v.vaccine_code asc");
						
						while(rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("<td>" + rs.getString(2) + "</td>");
							out.println ("<td>" + rs.getString(3) + "</td>");
							out.println ("<td>" + rs.getString(4) + "ȸ</td>");
						}
						
						stmt.close();
						con.close();
							
					} catch (Exception e) {
						e.printStackTrace();
					}
				%>
			</table>
		</section>
		
<%@ include file="footer.jsp" %>