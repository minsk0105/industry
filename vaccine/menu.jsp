<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>
	
		<section>
			<h2>���������ȸ</h2>
			
			<table>
				<tr>
					<th>����ڵ�</th>
					<th>��󰨿���</th>
					<th>�������</th>
					<th>��������ñ�</th>
					<th>��ű���</th>
				</tr>
				
				<%
					try {
						Class.forName ("oracle.jdbc.OracleDriver");
						Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
						
						Statement stmt = con.createStatement();
						ResultSet rs = stmt.executeQuery ("select * from tbl_vaccine");
						
						while(rs.next()) {
							out.println ("<tr><td>" + rs.getString(1) + "</td>");
							out.println ("<td>" + rs.getString(2) + "</td>");
							out.println ("<td>" + rs.getString(3) + "</td>");
							out.println ("<td>" + rs.getString(4) + "</td>");
							out.println ("<td>");
							
							if (rs.getString(5).equals("2")) out.print ("���豺����");
							else out.print ("���ɱ���");
							
							out.println("</td></tr>");
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