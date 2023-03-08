<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- JSTL에서 \n을 사용 할 수 있게 세팅하기 -->
<!-- 내용(baordVO.content)의 엔터키 적용
controller에서 받은 boardVO.content데이터의 \n을 <br>로 바꾸고 그 값을 content에게 부여 -->
<% pageContext.setAttribute("newline", "\n"); %>
<c:set var="content" value="${fn:replace(baordVO.content, newline, '<br>')}"/>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 상세 화면</title>
		
		<!-- 외부 CSS 파일 경로 링크 -->
		<link rel="stylesheet" href="<c:url value='/css/board.css'/>">
	</head>
	
	<!-- jscipt 파일 연결 -->
	<!-- src="../script/jquery...> 간접경로 방식이 안되서, 직접경로방식으로 연결하였음  -->
	<script src="/myproject2/script/jquery-1.12.4.js"></script>
	<script src="/myproject2/script/jquery-ur.js"></script>


	<body>
		<div Class="div_pageframe">
			<!-- 탑 메뉴 S -->
			<div Class="div_topmenu">
				<%@ include file="../include/topmenu.jsp" %>
			</div>
			<!-- 탑 메뉴 E -->
			<!-- 타이틀 S -->
			<div Class="div_title" align="center">게시판 상세</div>
			<!-- 타이틀 E -->
			<!-- 테이블 및 내용 S -->
			<div Class="div_content">
				<form name="frm" id="frm">
					<table>
						<tr>
							<th width="20%">제목</th>
							<td width="80%">${boardVO.title}</td>
						</tr>
						<tr>
							<th>글쓴이</th>
							<td><c:out value="${boardVO.name}"/></td>
						</tr>
						<tr>
							<th height="50">내용</th>
							<td><c:out value="${boardVO.content}"/></td>
						</tr>
						<tr>
							<th>등록일</th>
							<td><c:out value="${boardVO.rdate}"/></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 테이블 및 내용 E -->
			<!-- 하단 버튼 S -->
			<div Class="div_bottom">
				<button type="button" onclick="location='boardList.do'">목록</button>
				<button type="button" onclick="location='boardModifyWrite.do?unq=${boardVO.unq}'">수정</button>
				<button type="button" onclick="location='passWrite.do?unq=${boardVO.unq}'">삭제</button>
			</div>
			<!-- 하단 버튼 E -->
		</div>
	</body>
</html>