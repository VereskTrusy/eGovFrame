<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<title>Depart Controller</title>
</head>



<style> /* css 사용이라는디 일단 고, 헤드와 바디사이에 작성*/
table {
	width:400px;
	border-collapse:collapse; /* cell 간격 없앰 */
}
th,td {
	boder:1px solid #dddddd; /* 회색 */
	padding:8px;
}
tr:nth-child(even) {
  background-color: #dddddd;
</style>



<body>

<h2>부서관리</h2>

<form name="frm" method="post" action="deptWriteSave.do">

<table>
	<tr>
		<th>부서번호</th>
		<td><input type="text" name="deptno"></td>
	</tr>
	<tr>
		<th>부서이름</th>
		<td><input type="text" name="dname"></td>
	</tr>
	<tr>
		<th>부서위치</th>
		<td><input type="text" name="loc"></td>
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