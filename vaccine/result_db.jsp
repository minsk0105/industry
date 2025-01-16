<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="top.jsp" %>

		<section>
		
			<%
				String num = request.getParameter("num");
				String id = request.getParameter("id");
				String code = request.getParameter("code");
				String date = request.getParameter("date");
				String round = request.getParameter("round");
				String result = request.getParameter("result");
				String location = request.getParameter("location");
				
				String sql = "insert into tbl_vaccination values ('"+ num +"','"+ id +"','"+ code +"','"+ date +"','"+ round +"','"+ result +"','"+ location +"')";
				
				out.print(sql);
				
				try {
					Class.forName ("oracle.jdbc.OracleDriver");
					Connection con = DriverManager.getConnection ("jdbc:oracle:thin:@//localhost:1521/xe","system","1234");
					
					Statement stmt = con.createStatement();
					ResultSet rs = stmt.executeQuery (sql);
					
					rs.next();
					
					stmt.close();
					con.close();
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		
		</section>
		
		<script>
			alert ("정상적으로 입력되었습니다.");
			location.href = "list.jsp";
		</script>
		
<%@ include file="footer.jsp" %>