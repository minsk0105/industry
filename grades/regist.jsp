<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp" %>
<head>
	<style>
		.input {text-align: left;}
	</style>
</head>
		
		<script>
			function ck(f) {
				if (f.year.value === "") {
					alert ("학년정보가 입력되지 않았습니다!");
					f.year.focus();
					return false;
				}
				if (f.room.value === "") {
					alert ("학반정보가 입력되지 않았습니다!");
					f.room.focus();
					return false;
				}
				if (f.num.value === "") {
					alert ("학번정보가 입력되지 않았습니다!");
					f.num.focus();
					return false;
				}
				if (f.kor.value === "") {
					alert ("국어점수가 입력되지 않았습니다!");
					f.kor.focus();
					return false;
				}
				if (f.eng.value === "") {
					alert ("영어점수가 입력되지 않았습니다!");
					f.eng.focus();
					return false;
				}
				if (f.mat.value === "") {
					alert ("수학점수가 입력되지 않았습니다!");
					f.mat.focus();
					return false;
				}
			}
		</script>
		
		<section>
			<h2>성적등록</h2>
			
			<form action="regist_db.jsp" method="GET" onsubmit="return ck(this)">
				<table>
					<tr>
						<td>학년</td>
						<td class="input"><input type="text" name="year" />(예) 1</td>
					</tr>
					<tr>
						<td>반</td>
						<td class="input"><input type="text" name="room" />(예) 01</td>
					</tr>
					<tr>
						<td>번호</td>
						<td class="input"><input type="text" name="num" />(예) 01</td>
					</tr>
					<tr>
						<td>국어</td>
						<td class="input"><input type="text" name="kor" />점수범위(0~100)</td>
					</tr>
					<tr>
						<td>영어</td>
						<td class="input"><input type="text" name="eng" />점수범위(0~100)</td>
					</tr>
					<tr>
						<td>수학</td>
						<td class="input"><input type="text" name="mat" />점수범위(0~100)</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="성적저장" />
							<input type="reset" value="다시쓰기" onclick="alert ('정보를 지우고 처음부터 다시 입력합니다!')" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		
<%@ include file="bottom.jsp" %>