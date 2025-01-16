<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
			<%
				String v1 = request.getParameter("v1");
				String v2 = request.getParameter("v2");
				String v3 = request.getParameter("v3");
				String v4 = request.getParameter("v4");
				String v5 = request.getParameter("v5");
				String v6 = request.getParameter("v6");
				String v7 = request.getParameter("v7");
				
				String sql = "insert into tbl_ferformance values ('"+v1+"','"+v2+"','"+v3+"','"+v4+"','"+v5+"','"+v6+"','"+v7+"')";
				
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
<%@ include file="footer.jsp" %>