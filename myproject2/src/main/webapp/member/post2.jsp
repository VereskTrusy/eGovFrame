<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편번호 찾기2</title>
</head>

<!-- Jquery 사용 라이브러리 링크 -->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>

<script>
	$( function() {
		$( "#btn_send" ).click( function() {
			var addr = $("#address").val();
			//[123456] 대구광역시 수성구 황금동 12
			
		});
		
	});
</script>

<body>
	<div style="width:100%; text-align:center;">
		<select name="address" id="address">
			<c:forEach var="list" items="${resultList}">
				<option value="${list.addr}"></option>
			</c:forEach>
		</select>
		<br>
		<br>
		<button type="button" id="btn_send">적용하기</button>
	</div>
</body>
</html>