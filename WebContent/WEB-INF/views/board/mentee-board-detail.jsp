<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
								value="${datas.boardMentee.detailDate}" /></th>
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
					<c:forEach items="${datas.files}" var="file">
					<img src="${file.downloadURL}"><br>
					</c:forEach>
					<c:out value="${datas.boardMentee.bdContent}" />
				</div>
			</div>
			<div class='info file_info'>
				<ol>
					<c:forEach items="${datas.files}" var="file">
						<li id="liTag"><a id="fileName"
							href="/file/${file.savePath}${file.renameFileName}?originName=${file.originFileName}">${file.originFileName}<i class="fas fa-paperclip" id="fileClip"></i></a></li>
					</c:forEach>
				</ol>
			</div>
			<div id="otherUtil">
				<a href="mentee/mentee-board-detail/content-recommend?bdIdx=${datas.boardMentee.bdIdx}&userId=${datas.boardMentee.userId}">추천</a> <a id="shareURL" onclick="clip(); return false;">공유</a>
			</div>
			<hr>
			<table class="comment_table" border="0">
				<c:forEach items="${boardCommentList}" var="commentList" varStatus="status">
					<tr class="comment_tr">
						<th class="comment_info">${commentList.userId}</th>
						<th class="comment_info">${commentList.coContent}</th>
						<th class="comment_info"><i class="fas fa-times" id="commentDelete" onclick="location.href='mentee/comment-delete?coIdx=${commentList.coIdx}&userId=${commentList.userId}&bdIdx=${datas.boardMentee.bdIdx}'"></i></th>
						<th class="comment_info">${commentList.detailDate}</th>
						<th class="comment_info"><i class="far fa-thumbs-up" id="commentRecommend" onclick="location.href='mentee/comment-recommend?coIdx=${commentList.coIdx}&userId=${commentList.userId}&bdIdx=${datas.boardMentee.bdIdx}'" ></i>${commentList.recCount}</th>
					</tr>
				</c:forEach>
			</table>
			<hr>
			<form class="wrap_comment" action="/meboard/mentee/comment-upload">
				<input type="hidden" name="bdIdx" value="${datas.boardMentee.bdIdx}"/>
				<textarea id="commentBox" required="required" maxlength="100" name="coComment"></textarea>
				<button id="writeButton">등록</button>
			</form>
			<hr>
		</div>

		<div class="content_footer">
			<button id="returnButton" type="button"
				onclick="location.href='mentee'">목록</button>
			<div id="wrapButton">
				<button type="button"
					onclick="location.href='mentee/mentee-board-modify?bdIdx=${datas.boardMentee.bdIdx}&userId=${datas.boardMentee.userId}'">수정</button>
				<button type="button"
					onclick="location.href='mentee/mentee-board-delete?bdIdx=${datas.boardMentee.bdIdx}&userId=${datas.boardMentee.userId}'">삭제</button>
			</div>
		</div>
	</div>

	<!-- Features section-->


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
	<script type="text/javascript">
	function clip(){

		var url = '';
		var textarea = document.createElement("textarea");
		document.body.appendChild(textarea);
		url = window.document.location.href;
		textarea.value = url;
		textarea.select();
		document.execCommand("copy");
		document.body.removeChild(textarea);
		alert("URL이 복사되었습니다.")
	}

	</script>

</body>
</html>