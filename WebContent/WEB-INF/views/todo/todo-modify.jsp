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
<script
  src="https://code.jquery.com/jquery-3.6.0.js"
  integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
  crossorigin="anonymous"></script>
  
</head> 
<body>
<div class="wrap-input">
	<input type="hidden" name="todoIdx" id="todoIdx" />
	<div class="top-div">일정 제목</div><div><input type="text" name="title" id="titleInput" /></div>
	<div>일정 시작일</div><div><input type="date" name="startDate" id="startInput" /></div>
	<div>일정 종료일</div><div><input type="date" name="endDate" id="endInput" /></div>
	<div>색상</div><div><input type="color" name="color" id="colorInput" /></div>
	<input type="hidden" id="done" name="done" value="0" />
	
</div>
<div class="wrap-button">
<!-- 	<input type="submit" value="일정 수정" formaction="/todo/modify" id="modifyButton" onclick="todoModify()"/> -->
	<button type="button" id="modifyButton" onclick="todoModify()">일정 수정</button>
	<button type="button" id="deleteButton" onclick="deleteEntry()">일정 삭제</button>
</div>
</body>

<!-- 
<div class="wrap-button">
	<button id="modifyButton">일정  수정</button>
	<button id="deleteButton">일정 삭제</button>
</div>
 -->
 <script src="/resources/js/todo/todo-modify.js"></script>
 
