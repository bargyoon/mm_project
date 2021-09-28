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
<form action="/todo/insert" method="post">
<div class="wrap-input">
	<div>일정 제목 <input type="text" name="title" placeholder="일정을 입력하세요" id="titleInput" ></div>
	<div>일정 시작일 <input type="date" name="startDate" id="startInput"></div>
	<div>일정 종료일 <input type="date" name="endDate" id="endInput"></div>
	<div>색상 <input type="color" name="color" id="colorInput"></div>
	
</div>
<div class="wrap-button">
	<input type="submit" value="일정 추가" />
</div>
</form>

<!-- 
<div class="wrap-button">
	<button id="addButton">일정  추가</button>
</div>
 -->

<script src="/resources/js/todo/todo-insert.js"></script>
 
