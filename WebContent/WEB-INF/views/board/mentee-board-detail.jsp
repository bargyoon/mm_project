<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/board/board-content.css">
</head>
<body class="d-flex flex-column h-100">

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Header-->
	<div class="content_section">
		<div id="contentHeader">
			<div id="contentTitle">
				<p>멘티 게시판</p>
			</div>
		</div>
		<hr>
		<div id="contentBody">
			<table class="content_table" border="0">
				<thead class="content_thead">
					<tr class="content_tr">
						<th class="content_info" id="contentNo"><c:out
								value="${datas.boardMentee.bdIdx}" /></th>
						<th class="content_info" id="content"><c:out
								value="${datas.boardMentee.bdTitle}" /></th>
						<th class="content_info" id="contentWriter" name="userId">작성자
							: <c:out value="${datas.boardMentee.userId}" />
						</th>
						<th class="content_info" id="contentDate"><c:out
								value="${datas.boardMentee.regDate}" /></th>
						<th class="content_info" id="contentView">조회수 : <c:out
								value="${datas.boardMentee.viewCount}" /></th>
						<th class="content_info" id="contentRec">추천수 : <c:out
								value="${datas.boardMentee.recCount}" /></th>
					</tr>
				</thead>
			</table>
			<hr>
			<div id="contentBox">
				<div>
					<c:out value="${datas.boardMentee.bdContent}" />
				</div>
			</div>
			<div class='info file_info'>
				<ol>
					<c:forEach items="${datas.files}" var="file">
						<li><a
							href="/file/${file.savePath}${file.renameFileName}?originName=${file.originFileName}">${file.originFileName}</a></li>
					</c:forEach>
				</ol>
			</div>
			<div id="otherUtil">
				<a>추천</a> <a>공유</a> <a>신고</a>
			</div>
			<hr>
			<table class="comment_table" border="0">
				<thead class="comment_thead">
					<tr class="comment_tr">
						<th class="comment_info">NAME3</th>
						<th class="comment_info">comment</th>
						<th class="comment_info"><i class="far fa-edit"></i></th>
						<th class="comment_info"><i class="fas fa-times"></i></th>
						<th class="comment_info">21-09-19 00:00:00</th>
						<th class="comment_info"><i class="far fa-thumbs-up"></i>0</th>
					</tr>
				</thead>
			</table>
			<hr>
			<form class="wrap_comment">
				<textarea id="commentBox" required="required" maxlength="100">comment</textarea>
				<button id="writeButton">등록</button>
			</form>
			<hr>
		</div>

		<div class="content_footer">
			<button id="returnButton" type="button"
				onclick="location.href='mentee'">목록</button>
			<div id="wrapButton">
				<button type="button"
					onclick="location.href='mentee/mentee-board-modify?bdIdx=${datas.boardMentee.bdIdx}'">수정</button>
				<button type="button"
					onclick="location.href='mentee/mentee-board-delete?bdIdx=${datas.boardMentee.bdIdx}&userId=${datas.boardMentee.userId}'">삭제</button>
			</div>
		</div>
	</div>

	<!-- Features section-->


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>


</body>
</html>