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
		<title>로그인 화면</title>
		
		<!-- 외부 CSS 파일 경로 -->
		<link rel="stylesheet" href="<c:url value='/css/board.css'/>">
		
		<!-- jquery 사용 경로 명시 - 다운 받은 파일은 버전이 달라서 안되는듯 -->
		<script src="/myproject2/script/jquery-1.12.4.js"></script>
		
		<script>
			$( function() {
				$( "#btn_submit").click( function() {
					var userid = $.trim($("#userid").val());	//입력한 아이디 공백제거
					var pass = $.trim($("#pass").val());		//입력한 암호 공백제거
					
					if( userid == "" ){
						alert("아이디를 입력해주세요.")
						$("#userid").focus();
						return false;
					}
					if( pass == "" ){
						alert("암호를 입력해주세요.")
						$("#pass").focus();
						return false;
					}
					
					$.ajax({
						type:"POST",							// 전송타입
						data:"userid="+userid+"&pass="+pass,	// 전송데이터 - 이런 형식을 json type 이라고 한다.
						url:"loginWriteSub.do",					// URL 
						dataType:"text",						// 리턴 타입
						
						// 전송 및 전송 후 세팅
						success: function( message ) {			// controller result -> "ok"
							if( message == "ok" ) {				// 암호 일치, 저장
								alert(userid+"님 로그인 되었습니다.");
								location="boardList.do";		// 저장 후 이동 URL
							} else {							// 그밖의 오류
								alert("아이디/암호를 확인 해주세요.");
							}
						},
						error: function(){						// system 장애발생
							alert("오류가 발생 하였습니다.");
						}
					});
				});
			});
		</script>
	</head>

	<body>
		<div Class="div_pageframe">
			<!-- 탑 메뉴 S -->
			<div Class="div_topmenu"><%@ include file="../include/topmenu.jsp" %></div>
			<!-- 탑 메뉴 E -->
			
			<!-- 타이틀 S -->
			<div Class="div_title" align="center">로그인</div>
			<!-- 타이틀 E -->
			
			<!-- 컨텐츠 S -->
			<div Class="div_content">
				<form name="frm" id="frm">
					<table>
						<!-- 아이디 입력란, 중복체크 버튼 -->
						<tr>
							<th><label for="userid">아이디</label></th>
							<td>
								<input type="text" name="userid" id="userid" placeholder="아이디">
							</td>
						</tr>
						<!-- 패스워드 입력란 -->
						<tr>
							<th><label for="pass">암호</label></th>
							<td>
								<input type="text" name="pass" id="pass" placeholder="암호">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<!-- 컨텐츠 E -->
			
			<!-- 하단 버튼 S -->
			<div Class="div_bottom">
				<button type="button" id="btn_submit" >로그인</button>
				<button type="reset">취소</button>
			</div>
			<!-- 하단 버튼 E -->
		</div>
		
		
		
		
	</body>
</html>