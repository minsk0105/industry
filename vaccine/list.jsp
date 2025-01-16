<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	
		<section>
			<h2>���������̷���ȸ</h2>
			
			<table>
				<tr>
					<th>�����̷¹�ȣ</th>
					<th>���̵�</th>
					<th>����</th>
					<th>����ڵ�</th>
					<th>�������</th>
					<th>��ű���</th>
					<th>��������</th>
					<th>����ȸ��</th>
					<th>�������</th>
					<th>����̸�</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery ("select v.vaccinate_no, v.people_id, p.people_name, v.vaccine_code, c.vaccines, c.vaccine_recommendation, v.vaccinate_date, v.vaccinate_round, v.vaccinate_result, i.institutional_name from tbl_vaccination v, tbl_people p, tbl_vaccine c, tbl_institutional i where v.people_id = p.people_id and v.vaccine_code = c.vaccine_code and v.visit_agency = i.visit_agency order by v.vaccinate_no asc");
						
						while(rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("<td>" + rs.getString(2) + "</td>");
							out.println ("<td>" + rs.getString(3) + "</td>");
							out.println ("<td>" + rs.getString(4) + "</td>");
							out.println ("<td>" + rs.getString(5) + "</td>");
							out.println ("<td>");
							
							if (rs.getString(6).equals("2")) out.print ("���豺����");
							else out.print ("���ɱ���");
							
							out.println ("</td>");
							out.println ("<td>" + rs.getString(7) + "</td>");
							out.println ("<td>" + rs.getString(8) + "ȸ��</td>");
							out.println ("<td>");
							
							if (rs.getString(9).equals("N")) out.print ("����");
							else out.print ("�̻�");
							
							out.println ("</td>");
							out.println ("<td>" + rs.getString(10) + "</td>");
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