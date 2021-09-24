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


<input type="text" placeholder="일정을 입력하세요">
<p><input type="text" placeholder="카테고리"></p>

<button id="addBtn">일정  추가</button>

<ul></ul>
<table id="todoTable">
	<tr>
		<td class="td">checkbox</td>
		<td class="td">to-do</td>
		<td class="td">category</td>
		<td class="td">delete</td>
	</tr>
</table>

 <script src="/resources/js/todo/calendar.js"></script>
