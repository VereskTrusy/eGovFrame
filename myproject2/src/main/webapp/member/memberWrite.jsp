<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원 가입 화면</title>
	</head>

	<!-- 생년월일 - 달력 사용을 위한 스크립트 사용 링크 -->	
	<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
	<link rel="stylesheet" href="/resources/demos/style.css">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
	<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

	<!-- jquery 사용 경로 명시 - 다운 받은 파일은 버전이 달라서 안되는듯 
	<script src="/myproject2/script/jquery-1.12.4.js"></script>
	<script src="//myproject2/script/jquery-ui.js"></script> -->

	<!-- daum kakao 우편번호 API 가져다 쓰는 링크 -->
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

	<!-- daum kakao 우편번호 API 가져다 쓰는 스크립트 -->
	<script>
	    function sample6_execDaumPostcode() {
			new daum.Postcode({
				oncomplete: function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
					
					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var addr = ''; // 주소 변수
					var extraAddr = ''; // 참고항목 변수
					
					//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						addr = data.roadAddress;
					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						addr = data.jibunAddress;
					}
					
					// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
					if(data.userSelectedType === 'R'){
						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
						    extraAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if(data.buildingName !== '' && data.apartment === 'Y'){
						    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
						}
						// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if(extraAddr !== ''){
						    extraAddr = ' (' + extraAddr + ')';
						}
						// 조합된 참고항목을 해당 필드에 넣는다.
						document.getElementById("sample6_extraAddress").value = extraAddr;
	
					} else {
						document.getElementById("sample6_extraAddress").value = '';
					}
	
					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_postcode').value = data.zonecode;
					document.getElementById("sample6_address").value = addr;
					// 커서를 상세주소 필드로 이동한다.
					document.getElementById("sample6_detailAddress").focus();
				}
			}).open();
		}
	</script>
	
	<script>
		$( function() {
			// 아이디 중복체크 버튼 이벤트
			$( "#btn_idcheck" ).click( function() {
				
				// 현재 창에 입력된 값 가져와서 앞뒤 공백을 제거 한다.
				var userid = $.trim( $("#userid").val() );
				
				// 현재 창에 입력된 값이 공백인지 체크한다.
				if(userid == ""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				
				// 화면에 표시되는 값을 공백제거한 값으로 대체 한다.
				$("#userid").val(userid);
				
				// idcheck.do 로 비동기 데이터 전송
				$.ajax({
					type:"POST",							// 전송타입
					data:"userid="+userid,					// 전송데이터 - 이런 형식을 json type 이라고 한다.
					url:"idcheck.do",						// URL 
					dataType:"text",						// 리턴 타입
					
					// 전송 및 전송 후 세팅
					success: function( result ) {			// controller result -> "ok"
						if( result == "ok" ) {				// 암호 일치, 저장
							alert("사용 가능한 아이디 입니다.");
						} else {							// 그밖의 오류
							alert("이미 사용중인 아이디 입니다.");
						}
					},
					error: function(){						// system 장애발생
						alert("오류가 발생 하였습니다.");
					}
				});
			});
			
			
			// 생년월일 입력창 선택 시 달력이 표시되게 한다.
			$( "#birth" ).datepicker({
				changeMonth: true,
				changeYear: true,
			});
			
			/*	
			// 우편번호 찾기 : 사용 안함 처리
			 $("#btn_zipcode").click( function() {
				
				var w = 500;
				var h = 100;
				var url = "post1.do"
				
				window.open("post1.do", "zipcode", "width=600,height=150"); // URL, 별칭, 넓이높이 
			});
			*/
			
			
			// 저장버튼 클릭 시 아이디, 패스워드, 이름 유효성검사
			$( "#btn_submit").click( function() {
				
				// 현재 입력창의 값을 가져온다.
				var userid = $("#userid").val();
				var pass = $("#pass").val();
				var name = $("#name").val();
				
				// 가져온 값의 앞뒤 공백을 제거 한다.
				userid = $.trim(userid);
				pass = $.trim(pass);
				name = $.trim(name);
				
				// 값이 데이터가 없을 경우 팝업 메시지 출력 한다.
				if(userid == ""){
					alert("아이디를 입력해주세요.");
					$("#userid").focus();
					return false;
				}
				if(pass == ""){
					alert("패스워드를 입력해주세요.");
					$("#pass").focus();
					return false;
				}
				if(name == ""){
					alert("이름을 입력해주세요.");
					$("#name").focus();
					return false;
				}
				
				// 화면에 표시되는 입력창의 값을 변경 해준다.
				$("#userid").val(userid);
				$("#pass").val(pass);
				$("#name").val(name);
				
				// ajax - memberWriteSave.do로 전송 처리
				var formData = $("#frm").serialize(); // .serialize()를 통해서 폼의 데이터를 가져온다.
				$.ajax({
					type:"POST",									// 전송타입
					data:formData,									// 전송데이터
					url:"memberWriteSave.do",						// URL
					dataType:"text",								// 리턴 타입
					
					// 전송 및 전송 후 세팅
					success: function( result ) {					// controller result -> "ok"
						if( result == "ok" ) {						// 암호 일치, 저장
							alert("저장완료");
							location="loginWrite.do";				// 저장 후 이동 URL
						} else {									// 그밖의 오류
							alert("저장실패\n관리자에게 연락해주세요.");
						}
					},
					error: function(){								// system 장애발생
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
			<!-- 회원가입 영역 Start -->
			<table>
				<caption>회원가입 폼</caption>
				<!-- 아이디 입력란, 중복체크 버튼 -->
				<tr>
					<th><label for="userid">아이디</label></th>
					<td>
						<input type="text" name="userid" id="userid" placeholder="아이디">
						<button type="button" id="btn_idcheck">중복체크</button>
					</td>
				</tr>
				<!-- 패스워드 입력란 -->
				<tr>
					<th><label for="pass">암호</label></th>
					<td>
						<input type="text" name="pass" id="pass" placeholder="암호">
					</td>
				</tr>
				<!-- 이름 입력란 -->
				<tr>
					<th><label for="name">이름</label></th>
					<td>
						<input type="text" name="name" id="name" placeholder="이름">
					</td>
				</tr>
				<!-- 성별 입력란 -->
				<tr>
					<th><label for="gender">성별</label></th>
					<td>
						<input type="radio" name="gender" id="gender" value="M">남
						<input type="radio" name="gender" id="gender" value="F">여
					</td>
				</tr>
				<!-- 생년월일 입력란 -->
				<tr>
					<th><label for="birth">생년월일</label></th>
					<td>
						<input type="text" name="birth" id="birth" placeholder="생년월일">
					</td>
				</tr>
				<!-- 연락처 입력란 -->
				<tr>
					<th><label for="phone">연락처</label></th>
					<td>
						<input type="text" name="phone" id="phone" placeholder="예:010-1234-1234">
					</td>
				</tr>
				<!-- 주소 입력란, 우편번호 찾기 버튼 -->
				<tr>
					<th><label for="address">주소</label></th>
					<td>
						<!-- 우편번호 검색 : 사용 안함 처리함 
						<input type="text" name="zipcode" id="zipcode">
						<button type="button" id="btn_zipcode">우편번호 찾기</button>
						<br>
						<input type="text" name="address" id="address"> -->
						
						<!-- daum kakao 우편번호 API 가져다 쓰기 -->
						<input type="text" id="sample6_postcode" placeholder="우편번호">
						<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
						<input type="text" id="sample6_address" placeholder="주소"><br>
						<input type="text" id="sample6_detailAddress" placeholder="상세주소">
						<input type="text" id="sample6_extraAddress" placeholder="참고항목">
					</td>
				</tr>
			</table>
			
			<div Class="div_button">
				<button type="button" id="btn_submit" >저장</button>
				<button type="reset">취소</button>
			</div>
			<!-- 회원가입 영역 End -->
		</form>
	</body>
</html>