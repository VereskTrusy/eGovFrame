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
		<title>게시판 등록 화면</title>
		
		<!-- 외부 CSS 파일 경로 링크 -->
		<link rel="stylesheet" href="<c:url value='/css/board.css'/>">
		
		<!-- jscipt 파일 연결 -->
		<!-- src="../script/jquery...> 간접경로 방식이 안되서, 직접경로방식으로 연결하였음  -->
		<script src="/myproject2/script/jquery-1.12.4.js"></script>
		<script src="/myproject2/script/jquery-ur.js"></script>
		
		<script>
			/* 
			// 임의로 입력란에 값 변경 테스트
			$(function(){
				$("#title").val("제목입력");
			});
			 */
			function fn_submit(){
				// jquery 형식으로 작성
				/*
				- jquery 에서 #의 의미는 아이디 값을 쓸때 사용한다
				#을 쓰면 해당 아이디 값을 찾는다.
				- $.trim() 앞뒤 공백 제거해준다
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
				
				/*
				// 자바 스크립트 형식으로 작성
				if( document.frm.title.value==""){
					alert("제목을 입력해주세요!");
					document.frm.title.focus();
					return false;
				}
				if( document.frm.pass.value==""){
					alert("암호를 입력해주세요!");
					document.frm.pass.focus();
					return false;
				}
				//doucument.frm.submit(); // 동기전송방식
				*/
				
				// form안의 요소를 모두 갖고 있는 변수 선언
				var formData = $("#frm").serialize();
				
				// 비동기 전송방식의 기능을 가지고 있는 jquery의 함수
				// ajax 해야할것 : 전송타입, 전송데이터 설정, URL, 리턴타입,성공/실패 경우 설정
				$.ajax({
					type:"POST",				// 전송타입
					data:formData,				// 전송데이터
					url:"boardWriteSave.do",	// URL
					dataType:"text",			// 리턴 타입
					success: function(msg){	// controller -> "ok", "fail"
						if(msg == "ok"){
							alert("저장완료");
							location="boardList.do";
						} else {
							alert("저장실패");
						}
					},
					error: function(){			// 장애발생
						alert("오류발생");
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
			<div Class="div_title" align="center">게시판 등록</div>
			<!-- 테이블 및 내용 S -->
			<div Class="div_content">
				<!--
				ajax의 비동기 전송 방식의 경우 ajax에서 모두 세팅하기 때문에
				아래와 같이 form의 id 값만 남긴다 
				<form name="frm" id="frm" method="post" action="boardWriteSave.do">
				 -->
				<form name="frm" id="frm">
					<table>
						<tr>
							<th width="20%">
								<label for="title">제목</label>
							</th>
							<td width="80%">
								<input type="text" name="title" id="title" class="input1" placeholder="제목">
							</td>
						</tr>
						<tr>
							<th>
								<label for="pass">암호</label>
							</th>
							<td>
								<input type="text" name="pass" id="pass" placeholder="암호">
							</td>
						</tr>
						<tr>
							<th>
								<label for="name">글쓴이</label>
							</th>
							<td>
								<input type="text" name="name" id="name" placeholder="글쓴이">
							</td>
						</tr>
						<tr>
							<th>
								<label for="content">내용</label>
							</th>
							<td>
								<input type="text" name="content" id="content" class="textarea" placeholder="내용">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 테이블 및 내용 E -->
			<!-- 하단 버튼 S -->
			<div Class="div_bottom">
				<button type="submit" onclick="fn_submit();return false;">저장</button>
				<button type="reset" onclick="location='boardList.do'">취소</button>
			</div>
			<!-- 하단 버튼 E -->
		</div>
	</body>
</html>