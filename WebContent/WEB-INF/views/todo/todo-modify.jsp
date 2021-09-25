<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<link rel="stylesheet" href="/resources/css/todo/reset.css"> 


<link rel="stylesheet" href="/resources/css/todo/test.css">


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
 
 <script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head> 
<body>


<p><input type="text" placeholder="일정을 입력하세요"></p>

<p><input type="date" id="dateInput"></p>
<p><input type="time" id="timeInput"></p>

<button id="addBtn">일정  추가</button>
<p><button id="sortBtn">일정 정렬</button></p>

<ul></ul>
<table id="todoTable">
	<tr>
		<td></td>
		<td>Date</td>
		<td>Time</td>
		<td>to-do</td>
		<td>delete</td>
	</tr>
</table>

 <script src="/resources/js/todo/calendar.js"></script>
