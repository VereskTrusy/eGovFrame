<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title><spring:message code="title.sample" />게시판 목록 화면</title>
		<!-- 외부 CSS 파일 경로 링크 -->
		<link rel="stylesheet" href="<c:url value='/css/board.css'/>">
	</head>
	<body>
		<div Class="div_pageframe">
			<!-- 탑 메뉴 S -->
			<div Class="div_topmenu" align="center">
				<%@ include file="../include/topmenu.jsp" %>
			</div>
			<!-- 탑 메뉴 E -->
			<!-- 타이틀 S -->
			<div class="div_title" align="center">게시판 목록</div>
			<!-- 타이틀 E -->
			<!-- 게시글 total 갯수 S -->
			<div class="div_Total">Total: ${total}</div><!-- controller에서 total개수 받아서 뿌리기 -->
			<!-- 게시글 total 갯수 E -->
			<!-- 검색 상자 S -->
			<div class="div_Search" align="right">
				<form name="searchFrm" method="post" action="boardList.do">
					<select name="searchGubun" id="searchGubun"><!-- 검색기능 콤보박스, 입력상자, 검색버튼 -->
						<option value="title">제목</option>
						<option value="name">글쓴이</option>
						<option value="content">내용</option>
					</select>
					<input type="text" name="searchText" id="searchText">
					<button type="submit">검색</button>
				</form>
			</div>
			<!-- 검색 상자 E -->
			<!-- 테이블 및 내용 S -->
			<div Class="div_content">
				<table><!-- 테이블 열 : 행번호, 제목, 글쓴이, 등록일, 조회수 -->
					<tr>
						<th width="10%">번호</th>
						<th width="45%">제목</th>
						<th width="15%">글쓴이</th>
						<th width="15%">등록일</th>
						<th width="15%">조회수</th>
					</tr>
					
					<!-- 행번호 출력을 위해 cnt 변수 선언 -->
					<c:set var="cnt" value="${rowNumber}"/>
					
					<!-- 목록 실제 데이터, jstl 반복문 사용-->
					<c:forEach var="result" items="${resultList}">
						<tr>
							<td align="center" class="listtd"><c:out value="${cnt}"/></td>
							<td align="left" class="listtd"><a href="boardDetail.do?unq=${result.unq}"><c:out value="${result.title}"/></a></td>
							<td align="center" class="listtd"><c:out value="${result.name}"/></td>
							<td align="center" class="listtd"><c:out value="${result.rdate}"/></td>
							<td align="center" class="listtd"><c:out value="${result.hits}"/></td>
						</tr>
						
						<!-- cnt 변수 1감소 -->
						<c:set var="cnt" value="${cnt-1}"/>
						
					</c:forEach>
				</table>
			</div>
			<!-- 테이블 및 내용 E -->
			<!-- 페이지 처리 S -->
			<!-- total(데이터총개수), totalPage(페이지개수) 받아서 페이징처리하기 -->
			<div class="div_PageNum">
				<c:forEach var="i" begin="1" end="${totalPage}">
					<a href="boardList.do?viewPage=${i}">${i} </a>
				</c:forEach>
			</div>
			<!-- 페이지 처리 E -->
			<!-- 하단 버튼 S -->
			<div class="div_bottom">
				<button type="button" onclick="location='boardWrite.do'">글쓰기</button>
			</div>
			<!-- 하단 버튼 E -->
		</div>
	</body>

</html>
