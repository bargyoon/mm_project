<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	<div>일정 제목 <input type="text" name="title" placeholder="일정을 입력하세요" id="titleInput" /></div>
	<div>일정 시작일 <input type="date" name="startDate" id="startInput" /></div>
	<div>일정 종료일 <input type="date" name="endDate" id="endInput" /></div>
	<div>색상 <input type="color" name="color" id="colorInput" /></div>
	<input type="hidden" id="done" name="done" value="0" />
</div>
<div class="wrap-button">
	<input type="submit" value="일정 추가" id="addButton"/>
</div>
</form>


<script src="/resources/js/todo/todo-insert.js"></script>
 
