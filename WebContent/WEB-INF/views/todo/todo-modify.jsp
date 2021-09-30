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
<form method="post">
<div class="wrap-input">
	<div>일정 제목 <input type="text" name="title" id="titleInput" /></div>
	<div>일정 시작일 <input type="date" name="startDate" id="startInput" /></div>
	<div>일정 종료일 <input type="date" name="endDate" id="endInput" /></div>
	<div>색상 <input type="color" name="color" id="colorInput" /></div>
	
	<input type="hidden" id="done" name="done" value="0" />
	
</div>
<div class="wrap-button">
	<input type="submit" value="일정 수정" formaction="/todo/modify" id="modifyButton" onclick="todoModify()"/>
	<input type="submit" value="일정 삭제" formaction="/todo/delete" id="deleteButton" onclick="deleteEntry()"/>
</div>
</form>
</body>

<!-- 
<div class="wrap-button">
	<button id="modifyButton">일정  수정</button>
	<button id="deleteButton">일정 삭제</button>
</div>
 -->
 <script src="/resources/js/todo/todo-modify.js"></script>
 
