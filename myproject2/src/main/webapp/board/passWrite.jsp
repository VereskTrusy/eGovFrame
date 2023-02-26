<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c"		uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 삭제 - 암호입력화면</title>

<!-- Jquery를 사용하기위한 jscript 파일 연결 (jquery도 javascript의 일종임-->
<script src="/myproject2/script/jquery-1.12.4.js"></script>
<script src="/myproject2/script/jquery-ur.js"></script>

</head>

<!-- 
1. jquery문법 -> password 입력해주세요 체크
2. 암호 일치 -> 비동기전송처리 -->
<script>
	/* jquery문법의 시작이다 알리는 형태*/
	$(function() {
		
		/* 버튼 클릭시 */
		$("#delBtn").click(function() { // 기능 부여시 function() 함수를 꼭써줘야 한다
			
			/* password 공백체크 */
			var pass = $("#pass").val();	// 현재 입력된 값
			pass = $.trim(pass);			// 앞뒤 공백 제거
			if( pass == "" ) {				// 암호 미입력시 포커스
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			var sendData = "unq=${unq}&pass=" + pass;	// json설정타입
			
			/* ajax(비동기) 방식으로 전송 */
			$.ajax({
				type:"POST",			// 전송타입
				data: sendData,			// 전송데이터
				url:"boardDelete.do",	// URL
				dataType:"text",		// 리턴 타입
				/*전송 후 세팅*/
				success: function( result ) {	// controller result -> "1"
					if( result == "1" ) {						// 암호 일치, 저장
						alert("삭제완료");
						location="boardList.do";
					} else if( result == "-1" ) {				// 암호 불일치
						alert("암호가 일치하지 않습니다.")
					} else {									// 오류
						alert("삭제실패\n관리자에게 연락해주세요.");
					}
				},
				error: function(){								// 장애발생
					alert("오류가 발생 하였습니다.");
				}
			});
			
		});
		
	});
</script>

<!-- CSS 구성 -->

<body>
<!-- 암호입력 상자, 데이터 전송 ajax형태로 전송 -->
<table>
	<tr>
		<th>암호입력</th>
		<td><input type="password" id="pass"></td>
		<td><button type="button" id="delBtn">삭제하기</button></td>
		<!-- password 공백검사 -> 공백이 아닐경우 비동기 전송 -->
	</tr>
</table>

</body>
</html>