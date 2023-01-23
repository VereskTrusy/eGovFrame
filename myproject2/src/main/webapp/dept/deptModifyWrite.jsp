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
	<title>deptModifyWrite.jsp</title>
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
	<form name="frm" method="post" action="deptModifySave.do">
		<table>
			<tr>
				<th>부서번호</th>
				<td><input type="text" name="deptno" value="${deptVO.deptno}" readonly></td>
			</tr>
			<tr>
				<th>부서이름</th>
				<td><input type="text" name="dname" value="${deptVO.dname}"></td>
			</tr>
			<tr>
				<th>부서위치</th>
				<td><input type="text" name="loc" value="${deptVO.loc}"></td>
			</tr>
			<tr>
				<th colspan="2">
				<button type="submit">저장</button>
				</th>
			</tr>
		</table>
	</form>
</body>
</html>