<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 
<link rel="stylesheet" href="/resources/css/todo/reset.css"> 
 -->
<link rel="stylesheet" href="/resources/css/todo/test.css">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
 
 <script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head> 
<body>


<p><input type="text" placeholder="일정을 입력하세요" id="titleInput"></p>
<p><input type="datetime-local" id="startInput"></p>
<p><input type="datetime-local" id="endInput"></p>
<p><input type="color" id="colorInput"></p>

<button id="modifyButton">일정  수정</button>
<button id="deleteButton">일정 삭제</button>

 <script src="/resources/js/todo/todo-modify.js"></script>
 
