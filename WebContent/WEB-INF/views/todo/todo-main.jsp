<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      		<form action="/todo/todaySave" method="post" >
      		<c:forEach var="todo" items="${todayList}" varStatus="status">
		         <p>
		         	<input type="checkbox" id="${todo.todoIdx}" name="todoList" value="${todo.todoIdx}"> 
		         	<label for="${todo.todoIdx}" class="check-label">${todo.title}</label>
		         </p>
      		</c:forEach>
      		
      			<input type="submit" value="저장" />
      		</form>
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