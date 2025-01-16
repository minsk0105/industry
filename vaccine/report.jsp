<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	
		<section>
			<h2>예방접종통계</h2>
			
			<table>
				<tr>
					<th>백신코드</th>
					<th>대상감염병</th>
					<th>백신종류</th>
					<th>정상접종횟수</th>
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
							out.println ("<td>" + rs.getString(4) + "회</td>");
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