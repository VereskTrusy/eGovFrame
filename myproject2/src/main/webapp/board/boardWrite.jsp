<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록 화면</title>
</head>
<!-- CSS 사용 문구 -->
<style>
body {
	font-size:9px;
}
button {
	font-size:9px;
}
table {
	width:600px;
	boarder-collapse:callapse;
}
th,td {
	boarder:1px solid #cccccc;
	padding: 3px;
}
.input1 {
	width:98%;
}
.textarea {
	width:98%;
	height:70px;
}
</style>

<body>
<form name="frm" id="frm" method="post" action="boardWriteSave.do">
<table>
	<caption>게시판 등록</caption>
	<tr>
		<th width="20%"><label for="title">제목</label></th>
		<td width="80%"><input type="text" name="title" id="title" class="input1"></td>
	</tr>
	<tr>
		<th><label for="pass">암호</label></th>
		<td><input type="text" name="pass" id="pass"></td>
	</tr>
	<tr>
		<th><label for="name">글쓴이</label></th>
		<td><input type="text" name="name" id="name"></td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><input type="text" name="content" id="content" class="textarea"></td>
	</tr>
	<tr>
		<th colspan="2">
		<button type="submit">저장</button>
		<button type="reset">취소</button>
		</th>
	</tr>
</table>
</form>
</body>
</html>