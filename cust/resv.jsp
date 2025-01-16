<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

		<script>
			function ck(f) {
				if (f.one.value === "") {
					alert ("예약번호가 입력되지 않았습니다.");
					f.one.focus();
					return false;
				}
				
				if (f.two.value === "") {
					alert ("고객번호가 입력되지 않았습니다.");
					f.two.focus();
					return false;
				}
				
				if (f.three.value === "") {
					alert ("예약일자가 입력되지 않았습니다.");
					f.three.focus();
					return false;
				}
				
				if (f.four.value === "") {
					alert ("코트번호가 입력되지 않았습니다.");
					f.four.focus();
					return false;
				}
			};
		</script>

		<section>
			<h2>코트 예약</h2>
			
			<form action="resv_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<th>예약번호</th>
						<td><input type="text" name="one" /> 예) 20230001</td>
					</tr>
					<tr>
						<th>고객번호</th>
						<td><input type="text" name="two" /> 예) 1001</td>
					</tr>
					<tr>
						<th>예약일자</th>
						<td><input type="text" name="three" /> 예) 20230101</td>
					</tr>
					<tr>
						<th>코트번호</th>
						<td><input type="text" name="four" /> 예) C001 ~ C009</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 예약등록 " />
							<input type="reset" value=" 다시쓰기 " onclick="alert ('입력하신 정보가 초기화됩니다.')" />
						</th>
					</tr>
				</table>
			</form>
		</section>

<%@ include file="bottom.jsp" %>