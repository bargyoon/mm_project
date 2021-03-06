<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/board/board-create.css">
</head>
<body class="d-flex flex-column h-100">

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Header-->
	<div class="create_section">
		<div id="contentHeader">
			<div id="contentTitle">
				<p>멘티 게시판</p>
			</div>
		</div>
		<hr>
		<form action="/meboard/mentee/mentee-board-update" encType = "multipart/form-data" method="post">
		<div id="createBody">
			<input type="hidden" name="bdIdx" value="${datas.boardMentee.bdIdx}"/>
			<div>
			제목 : <input type="text" name="bdTitle" value="${datas.boardMentee.bdTitle}"/>
			파일 : <input type="file" name="fileName" multiple/>
			</div>
			<hr>
			<div id="createBox">
				<textarea id="createBox" name="bdContent" required="required" maxlength="1000"><c:out value="${datas.boardMentee.bdContent}"/></textarea>
			</div>
			<hr>
		</div>

		<div class="create_footer">
			<button id="returnButton" type="button" onclick="location.href='mentee'">목록</button>
			<div id="wrapButton">
				<button type="submit">수정</button>
			</div>
		</div>
		</form>
	</div>

	<!-- Features section-->


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>


</body>
</html>