<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인 화면</title>
		<!-- jquery 사용 경로 명시 - 다운 받은 파일은 버전이 달라서 안되는듯 -->
		<script src="/myproject2/script/jquery-1.12.4.js"></script>
	</head>
	
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
	
	<!-- CSS 디자인 설정 -->
	<style>
		body {
			font-size:9pt;
			font-color:#333333;
			font-family:맑은 고딕;
		}
		a {text-decoration:none;}
		table {
			border: 1px solid #ffffff;
			width:600px;
			border-collapse:collapse;
		}
		th, td {
			padding:8px;
			line-height:2;
		}
		caption {
			font-size:15pt;
			font-weight:bold;
			margin-top:10px;
			margin-bottom:10px;
			padding-bottom:5px;
		}
		.div_button {
			width:600px;
			text-align:center;
			margin-top:5px;
		}
	</style>
	
	<body>
		<!-- 탑 메뉴 적용 -->
		<%@ include file="../include/topmenu.jsp" %>
		
		<form name="frm" id="frm">
			<!-- 로그인 영역 Start -->
			<table>
				<caption>로그인</caption>
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
			
			<div Class="div_button">
				<button type="button" id="btn_submit" >로그인</button>
				<button type="reset">취소</button>
			</div>
			<!-- 로그인 영역 End -->
		</form>
	</body>
</html>