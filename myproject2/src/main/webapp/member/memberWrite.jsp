<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 화면</title>
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
	<!-- <script src="/myproject2/script/jquery-1.12.4.js"></script>
	<script src="//myproject2/script/jquery-ui.js"></script> -->
	<script>
	  $( function() {
	    $( "#birth" ).datepicker({
	      changeMonth: true,
	      changeYear: true,
	      
	    });
	  } );
	  </script>
</head>

<!-- CSS -->
<style>
body {
	font-size:9pt;
	font-color:#333333;
	font-family:맑은 고딕;
}
a {
	text-decoration:none;
}
table {
	width:600px;
	border-collapse:collapse;
}
th, td {
	boder:1px solid #ffffff;
	padding:3px;
	line-height:2;
}
caption {
	font-size:15pt;
	font-weight:bold;
	margin-top:10px;
	margin-bottom:10px;
	padding-bottom:5px;
}
.div_button {
	width:600px;
	text-align:center;
	margin-top:5px;
}
</style>

<body>
<form id="frm">
	<!-- 기본 탑메뉴 간단히.. -->
	<table>
		<tr>
			<th width="25%"><a href="/myproject2/">홈</a></th>
			<th width="25%"><a href="/myproject2/boardList.do">게시판</a></th>
			<th width="25%"><a href="/myproject2/memberWrite.do">회원가입</a></th>
			<th width="25%"><a href="/myproject2/loginWrite.do">로그인</a></th>
		</tr>
	</table>
	<table>
		<caption>회원가입 폼</caption>
		<tr>
			<!-- 아이디   중복체크 -> 버튼, 실시간 체크 -> 나중에 -->
			<th><label for="userid">아이디</label></th>
			<td>
				<input type="text" name="userid" id="userid" placeholder="아이디입력">
				<button type="button">중복체크</button>
			</td>
		</tr>
		<tr>
			<!-- 패스워드 -->
			<th><label for="pass">암호</label></th>
			<td>
				<input type="text" name="pass" id="pass" placeholder="암호입력">
			</td>
		</tr>
		<tr>
			<!-- 이름 -->
			<th><label for="name">이름</label></th>
			<td>
				<input type="text" name="name" id="name">
			</td>
		</tr>
		<tr>
			<!-- 성별 -->
			<th><label for="gender">성별</label></th>
			<td>
				<input type="radio" name="gender" id="gender" value="M">남
				<input type="radio" name="gender" id="gender" value="F">여
			</td>
		</tr>
		<tr>
			<!-- 생년월일 -->
			<th><label for="birth">생년월일</label></th>
			<td>
				<input type="text" name="birth" id="birth" readonly>
			</td>
		</tr>
		<tr>
			<!-- 연락처 -->
			<th><label for="phone">연락처</label></th>
			<td>
				<input type="text" name="phone" id="phone">(예:010-1234-1234)
			</td>
		</tr>
		<tr>
			<!-- 주소 -->
			<th><label for="address">주소</label></th>
			<td>
				<input type="text" name="zipcode" id="zipcode">
				<button type="button">우편번호 찾기</button>
				<br>
				<input type="text" name="address" id="address">
			</td>
		</tr>
	</table>
	<div Class="div_button">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
	</div>
</form>
</body>
</html>