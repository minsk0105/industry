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
				if (f.name.value === "") {
					alert ("이름이 입력되지 않았습니다!");
					f.name.focus();
					return false;
				}
				if (f.birth.value === "") {
					alert ("생년월일이 입력되지 않았습니다!");
					f.birth.focus();
					return false;
				}
				if (!f.gender.checked && f.gender.value === "") {
					alert ("성별을 선택하세요!");
					return false;
				}
				if (f.tel1.value === "") {
					alert ("전화번호가 입력되지 않았습니다!");
					f.tel1.focus();
					return false;
				}
				if (f.tel2.value === "") {
					alert ("전화번호가 입력되지 않았습니다!");
					f.tel2.focus();
					return false;
				}
				if (f.tel3.value === "") {
					alert ("전화번호가 입력되지 않았습니다!");
					f.tel3.focus();
					return false;
				}
			}
		</script>
		
		<section>
			<h2>학생등록</h2>
			
			<form action="new_db.jsp" method="GET" onsubmit="return ck(this)">
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
						<td>이름</td>
						<td class="input"><input type="text" name="name" /></td>
					</tr>
					<tr>
						<td>생년월일</td>
						<td class="input"><input type="text" name="birth" />(예) 20190301</td>
					</tr>
					<tr>
						<td>성별</td>
						<td class="input">
							<input type="radio" name="gender" value="M" />남성
							<input type="radio" name="gender" value="F" />여성
						</td>
					</tr>
					<tr>
						<td>전화번호</td>
						<td class="input">
							<input type="text" name="tel1" />-
							<input type="text" name="tel2" />-
							<input type="text" name="tel3" />
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<input type="submit" value="학생등록" />
							<input type="reset" value="다시쓰기" onclick="alert ('정보를 지우고 처음부터 다시 입력합니다!')" />
						</td>
					</tr>
				</table>
			</form>
		</section>
		
<%@ include file="bottom.jsp" %>