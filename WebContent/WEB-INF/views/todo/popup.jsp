<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="/resources/css/todo/test.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
 
 <script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head>
<body>



<input type="text">
<ul></ul>
<script type="text/javascript">
	document.getElementsByTagName("input")[0].onchange = (event) => {
		document.getElementsByTagName("ul")[0].innerHTML += `<li>${event.target.value}</li>`
	};
</script>

 <script src="/resources/js/todo/calendar.js"></script>

