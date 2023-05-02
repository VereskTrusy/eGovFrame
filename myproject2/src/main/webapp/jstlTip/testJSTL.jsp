<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!--JSTL 사용을 위한 라이브러리 링크 설정 -->
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	
	
	
	
	<h1>HELLO</h1>
	
	
	<!-- JSTL 변수 선언 사용법 -->
	<c:set var="str" value="Hello"/>
	
	<!-- JSTL if문 사용법 -->
	<c:if test="${str eq 'Hello'}"> <!-- str 이 'Hello' 와 같으면 eq str 을 출력하라 -->
	    eq str
	</c:if><br>
	
	
	<c:if test="${str ne 'Hi'}"> <!-- str 이 'HELLO' 와 같으면 ne str 을 출력하라 -->
	    ne str
	</c:if><br>
	
	
	<c:if test="${empty list}"> <!-- list가 비어 있으면 empty 사용 문구를 출력하라  -->
	    empty 사용
	</c:if><br>
	
	
	<c:if test="${not empty str}"> <!-- str 이 비어 있으면 not empty 사용 문구를 출력하라  -->
	    not empty 사용
	</c:if><br>
	
	
	
	
	<!-- 기본 SELECT BOX 사용하기 -->
	<label for="assNumber">음료</label><br>   <!-- 라벨 -->
	<select>                                 <!-- 셀렉트 박스 시작 -->
	    <option value="밀크티">밀크티</option>      <!-- 셀렉트 박스 첫번째 옵션 -->
	    <option value="라떼">라떼</option>         <!-- 셀렉트 박스 두번째 옵션 -->
	    <option value="아아">아아</option>         <!-- 셀렉트 박스 세번째 옵션 -->
	</select><br>                            <!-- 셀렉트 박스 끝 -->
	
	
	
	<!-- SELECT 문에서 특정 option 선택하기 -->
	<select>
	    <option value="밀크티">밀크티</option>
	    <option value="라떼" selected>라떼</option>
	    <option value="아아">아아</option>
	</select><br>
	
	
	<%-- select 문에서 <c:forEach> 사용하여 서버에서 값 불러오기 --%>
	<select>
	   <option value="">선택해주세요</option>                                 <!-- 셀렉트박스 첫 표시부 문구 -->
	       <c:forEach var="list" items="${result}">                        <!-- ${result}에는 밀크티,라떼,아아가 들어있음(서버에서 받음) -->
	           <option value="${list.beverage}">${list.beverage}</option>  <!-- list 변수를 통해서 이름과 값을 설정한다. -->
	       </c:forEach>
	</select><br>
	
	
	<%-- select 문에서 <c:forEach> 와 <c:if> 사용하여 선택한 값 체크하기 --%>
    <select>
       <option value="">선택해주세요</option>                                 <!-- 셀렉트박스 첫 표시부 문구, 그래서 value가 없다. -->
           <c:forEach var="list" items="${result}">                        <!-- ${result}에는 밀크티,라떼,아아가 들어있음(서버에서 받음) -->
               <option value="${list.beverage}" 
                   <c:if test="${user.selectedBeverage eq list.beverage}"> <!-- user가 선택한 항목과 list에 있는 항목이 일치하면 -->
                       selected="selected"                                 <!-- selected="seleted" 옵션 적용 -->
                   </c:if>>
                   ${list.beverage}
               </option>
           </c:forEach>
    </select>
    <!-- var="list" 변수를 통해서 이름과 값을 설정한다, if문을 <option> 의 속성으로 추가해서 selected="" 옵션이 적용되게끔 만든다 -->
    <!-- if문 대신 3항 연산자 사용도 있음 -->
    
    
    <!-- select 박스 선택 했을 때, 이벤트 발생됐을때 함수 실행 및 해당 값 가져오기 -->
    <select id="selectbox" name="selectbox" onChange="changeSelect(this.value)">     <!-- onchange : 어떤걸 선택하는 등 상태가  바뀌면 동작되는 이벤트 -->
       <option value="" selected disabled>선택해주세요</option>               <!-- 셀렉트박스 첫 표시부 문구, 그래서 value가 없다. selected disabled : 선택 안되게 하는 옵션-->
           <c:forEach var="list" items="${result}">                        <!-- ${result}에는 밀크티,라떼,아아가 들어있음(서버에서 받음) -->
               <option value="${list.beverage}" 
                   <c:if test="${user.selectedBeverage eq list.beverage}"> <!-- user가 선택한 항목과 list에 있는 항목이 일치하면 -->
                       selected="selected"                                 <!-- selected="seleted" 옵션 적용 -->
                   </c:if>>
                   ${list.beverage}
               </option>
           </c:forEach>
    </select>
    
    <!-- 스크립트 단 changeSelect() 함수 -->
    <script>
        function changeSelect(value){
        	var selectComponent = document.getElementById("selectbox"); // id 값으로 핸들 가져오기
        	
        	// select element 에서 선택된 option의 value가 저장된다.
        	var selectValue = selectComponent.options[selectComponent.selectedIndex].value;
        	
        	// select element 에서 선택된 option의 text가 저장된다.
            var selectText = selectComponent.options[selectComponent.selectedIndex].text;
        }
        // 참고 링크 : [JavaScript] select박스에서 값 변경시 이벤트 처리방법
        // https://goodsgoods.tistory.com/249
    </script>
    
    
    
    
    
    
    
    
<%--     <select>
        <option value="">선택</option>
            <jsp:useBean id="now" class="java.util.Date"/>
            <fmt:formatDate value="${now}" pattern="yyyy" var="startYear"/>
            <c:forEach begin="0" end="${startYear - 2005}" var="year" step="1">
                <option value="${startYear-year}">${startYear-year}</option>
            </c:forEach>
    </select> --%>







</body>
</html>