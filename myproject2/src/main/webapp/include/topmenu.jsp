<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	</head>

	<style>
		a {text-decoration:none;}
	</style>

	<body>
		<!-- 세션처리?? -->
		<%
			String USERID = (String) session.getAttribute("SessionUserID");
		%>
		
		<!-- 기본 탑메뉴 -->
		<table>
			<tr>
				<th width="20%"><a href="/myproject2/boardList.do">게시판</a></th>
				<%
				if( USERID == null ) {
				%>
					<th width="20%"><a href="/myproject2/memberWrite.do">회원가입</a></th>
					<th width="40%"></th>
					<th width="20%"><a href="/myproject2/loginWrite.do">로그인</a></th>
				<%
				} else {
				%>
					<th width="20%"><a href="/myproject2/memberModify.do">회원정보</a></th>
					<th width="40%"></th>
					<th width="20%"><a href="/myproject2/loginOut.do">로그아웃</a></th>
				<%
				}
				%>
			</tr>
		</table>
	</body>
</html>