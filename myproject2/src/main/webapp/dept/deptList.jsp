<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%--JSTL 문법 사용하는 라이브러리 --%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>deptList.jsp</title>
</head>
<style>
table {
	width: 400px;
	border-collapse: collapse; /* cell 간격 없앰*/
}
th,td {
	border: 1px solid #cccccc;
	padding: 5px;
}
</style>
<body>
<table>
	<caption>부서목록</caption>
	<tr>
		<th>부서번호</th>
		<th>부서이름</th>
		<th>부서위치</th>
	</tr>
	<c:forEach var="result" items="${resultList}" varStatus="status">
		<tr>
			<td>${result.deptno }</td>
			<td><a href="deptDetail.do?deptno=${result.deptno}">${result.dname }</a></td><!-- dname을 클릭해서 상세 화면으로 넘어가게 만들기 -->
			<td>${result.loc }</td>
		</tr>
	</c:forEach>
	<%--  
	1~5 Line				: JSTL 사용 필수 선언
	<c:forEach></c:forEach>	: JSTL형식의 반복문 사용
	var="result" 			: 내부변수	
	items="${resultList}"	: Controller에서 사용하는 이름과 같아야함
	varStatus="status"		: 나중에 정리할것
	--%>
</table>
</body>
</html>
