<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

 
<link rel="stylesheet" href="/resources/css/todo/reset.css"> 
<link rel="stylesheet" href="/resources/css/todo/popup.css"> 


<!-- full calendar -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css"> 
<script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head> 
<body>
<form action="/todo/modify" method="post">
<div class="wrap-input">
	<div><input type="text" placeholder="일정을 입력하세요" id="titleInput"></div>
	<div><input type="date" id="startInput"></div>
	<div><input type="date" id="endInput"></div>
	<div><input type="color" id="colorInput"></div>
</div>
	<input type="submit" value="일정 수정" />
	<input type="submit" value="일정 삭제" />
</form>


<!-- 
<div class="wrap-button">
	<button id="modifyButton">일정  수정</button>
	<button id="deleteButton">일정 삭제</button>
</div>
 -->
 <script src="/resources/js/todo/todo-modify.js"></script>
 
