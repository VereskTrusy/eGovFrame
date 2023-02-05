<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!--JSP는 컨트롤러에서 보내온 데이터를 그냥은 못받기 때문에
	JSTL 사용을 위한 라이브러리 링크 설정을 해야한다 -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 목록 화면</title>

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

<!-- 테이블 열 : 행번호, 제목, 글쓴이, 등록일, 조회수 -->
<table>
	<tr>
		<th width="5%">번호</th>
		<th width="45%">제목</th>
		<th width="20%">글쓴이</th>
		<th width="15%">등록일</th>
		<th width="15%">조회수</th>
	</tr>
	
	<!-- 행번호 출력을 위해 cnt 변수 선언 -->
	<c:set var="cnt" value="1"/>
	
	<!-- 목록 실제 데이터, jstl 반복문 사용-->
	<c:forEach var="result" items="${resultList}">
		<tr align="center">
			<td><c:out value="${cnt}"/></td>
			<td align="left"><c:out value="${result.title}"/></td>
			<td><c:out value="${result.name}"/></td>
			<td><c:out value="${result.rdate}"/></td>
			<td><c:out value="${result.hits}"/></td>
		</tr>
		<!-- cnt 변수 1증가 -->
		<c:set var="cnt" value="${cnt+1}"/>
	</c:forEach>
</table>

<!-- 글쓰기 버튼 -->
<div style="whidth:600px; margin-top:5px; text-align:right;">
	<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
</div>

</body>

</html>
