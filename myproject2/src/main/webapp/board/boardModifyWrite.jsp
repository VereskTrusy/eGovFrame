<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"	uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"		uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring"	uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="fn"		uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판 수정 화면</title>
		
		<!-- 외부 CSS 파일 경로 링크 -->
		<link rel="stylesheet" href="<c:url value='/css/board.css'/>">
		
		<!-- Jquery를 사용하기위한 jscript 파일 연결 -->
		<script src="/myproject2/script/jquery-1.12.4.js"></script>
		<script src="/myproject2/script/jquery-ur.js"></script>
		<script>
			function fn_submit(){
				
				//jquery 형식으로 작성
				/*
				// jquery 에서 #의 의미는 아이디 값을 쓸때 사용한다
				#을 쓰면 해당 아이디 값을 찾는다.
				// document.frm.title.value == ""	같은내용
				// $("#title").val() == ""			같은내용
				// $.trim() 앞뒤 공백 제거해준다
				// $.trim("  aabbcc  ") => $.trim($("#title").val()) == ""
				*/
				$("#title").val($.trim($("#title").val())); // 앞뒤공백제거
				if( $.trim( $("#title").val()) == "") { // 오류체크
					alert("제목을 입력해주세요!");
					$("#title").focus();
					return false;
				}
			
				
				$("#pass").val($.trim($("#pass").val())); // 앞뒤공백제거
				if( $.trim( $("#pass").val()) == "") { // 오류체크
					alert("암호를 입력해주세요!");
					$("#pass").focus();
					return false;
				}
				
				/* form안의 요소를 모두 갖고 있는 변수 선언*/
				var formData = $("#frm").serialize();
				/* 비동기 전송방식의 기능을 가지고 있는 jquery의 함수*/
				/* ajax 해야할것 : 전송타입, 전송데이터 설정, URL, 리턴타입,성공/실패 경우 설정*/
				$.ajax({
					type:"POST",				// 전송타입
					data:formData,				// 전송데이터
					url:"boardModifySave.do",	// URL
					dataType:"text",			// 리턴 타입
					/*전송 후 세팅*/
					success: function( result ) {	// controller result -> "1"
						if( result == "1" ) {						// 암호 일치, 저장
							alert("저장완료");
							location="boardDetail.do?unq=${boardVO.unq}";
						} else if( result == "-1" ) {				// 암호 불일치
							alert("암호가 일치하지 않습니다.")
						} else {									// 오류
							alert("저장실패\n관리자에게 연락해주세요.");
						}
					},
					error: function(){								// 장애발생
						alert("오류가 발생 하였습니다.");
					}
				});
			}
	</script>
	</head>
	<body>
		<div Class="div_pageframe">
			<!-- 탑 메뉴 S -->
			<div Class="div_topmenu">
				<%@ include file="../include/topmenu.jsp" %>
			</div>
			<!-- 탑 메뉴 E -->
			<!-- 타이틀 S -->
			<div Class="div_title" align="center">게시판 수정</div>
			<!-- 타이틀 E -->
			<!-- 테이블 및 내용 S -->
			<div Class="div_content">
				<form id="frm">
					<input type="hidden" name="unq" value="${boardVO.unq}">
				
					<table>
						<tr>
							<th width="20%"><label for="title">제목</label></th>
							<td width="80%"><input type="text" name="title" id="title" class="input1"
								value="${boardVO.title}"></td>
						</tr>
						<tr>
							<th><label for="pass">암호</label></th>
							<td><input type="text" name="pass" id="pass"></td>
						</tr>
						<tr>
							<th><label for="name">글쓴이</label></th>
							<td><input type="text" name="name" id="name" value="${boardVO.name}"></td>
						</tr>
						<tr>
							<th><label for="content">내용</label></th>
							<td><textarea name="content" id="content" class="textarea">${boardVO.content}</textarea></td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 테이블 및 내용 E -->
			<!-- 하단 버튼 S -->
			<div Class="div_bottom">
				<button type="submit" onclick="fn_submit();return false;">저장</button>
				<button type="reset" onclick="location='boardDetail.do?unq=${boardVO.unq}'">취소</button>
			</div>
			<!-- 하단 버튼 E -->
		</div>
	</body>
</html>