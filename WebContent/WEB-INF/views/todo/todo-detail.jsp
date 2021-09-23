<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>TODO-DETAIL</title>

<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/todo/reset.css">
<link rel="stylesheet" href="/resources/css/todo/test.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/fullcalendar@5.9.0/main.min.css">
<script src='https://cdn.jsdelivr.net/combine/npm/fullcalendar@5.9.0/main.min.js,
											npm/fullcalendar@5.9.0/locales-all.min.js'></script>

</head>


<body class="d-flex flex-column h-100">
    
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
 
<main class="flex-shrink-0">

	<div class="vv">+</div>


<div class="wrap-calendar"><div id='calendar' class="calendar"></div></div>
<script src="/resources/js/todo/calendar.js"></script>





	<!-- Footer-->

<%@ include file="/WEB-INF/views/include/footer.jsp" %>
<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
</body>
</html>