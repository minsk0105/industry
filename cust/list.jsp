<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>

		<script>
			function ck(f) {
				if (f.num.value === "") {
					alert ("고객번호가 입력되지 않았습니다.");
					f.num.focus();
					return false;
				}
			};
		</script>

		<section>
			<h2>코트 예약 조회</h2>
			
			<form action="result.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<th>고객번호를 입력하세요</th>
						<td><input type="text" name="num" /> 예) 1001</td>
					</tr>
					<tr>
						<th colspan="2">
							<input type="submit" value=" 코드예약조회 " />
							<input type="button" value=" 홈으로 " onclick="location.href='index.jsp'" />
						</th>
					</tr>
				</table>
			</form>
		</section>

<%@ include file="bottom.jsp" %>