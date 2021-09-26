<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TODO-MAIN</title>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/todo/reset.css">
<link rel="stylesheet" href="/resources/css/todo/test.css">

</head>
<body class="d-flex flex-column h-100">
    
<%@ include file="/WEB-INF/views/include/nav.jsp" %>

    
    
        <main class="flex-shrink-0">
            
      <div class="user-name">
         <h2>${authentication.userName} 님<h2>
         <h3>오늘의 할 일입니다.</h3>
      </div>
      
      <div class="todo-list-wrap">
      	<div class="todo-list">
	         <p><input type="checkbox" id="a"> <label for="a" class="check-label">오늘의일정</label></p>
		     <p><input type="checkbox" id="b"> <label for="b" class="check-label">오늘의일정</label></p>
	         <p><input type="checkbox" id="c"> <label for="c" class="check-label">오늘의일정</label></p>
	         <p><input type="checkbox" id="d"> <label for="d" class="check-label">오늘의일정</label></p>
	         <p><input type="checkbox" id="e"> <label for="e" class="check-label">오늘의일정</label></p>
	         <p><input type="checkbox" id="f"> <label for="f" class="check-label">오늘의일정오늘의일정오늘의일정오늘의일정오늘의일정</label></p>

		     
      	</div>
      </div>
	      
	<div class="Aligner">
		<div class="Aligner-item">
		  <div class="Aligner-under-item">　</div>
		</div>
	</div>

      <div class="percent">
         <h3>일정 00 % 완료!</h3>
      </div>
	
	<div class="wrap-but">
	      <a href="${contextPath}/todo/detail"><button class="submit-but"><h5>세부 일정 관리<h5></button></a>
	</div>


	<!-- Footer-->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
</body>
</html>