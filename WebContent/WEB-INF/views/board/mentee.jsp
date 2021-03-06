<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/board/board-main.css">
</head>
<body class="d-flex flex-column h-100">

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<!-- Header-->
	<c:set var="page" value="${(param.p == null)?1:param.p}" />
	<c:set var="startNum" value="${page-(page-1)%3}" />
	<c:set var="lastNum" value="${count}" />

	<div class="board_section">
		<div id="boardHeader">
			<div id="boardTitle">
				<p>멘티 게시판</p>
			</div>
			<form class="wrap_search" method="get">
				<div id="searchList">
					<select id="selectBox" name="searchCondition">
						<option ${(param.searchCondition == "bd_title")?"selected":""}
							value="bd_title">제목</option>
						<option ${(param.searchCondition == "user_id")?"selected":""}
							value="user_id">작성자</option>
					</select>
				</div>
				<div id="searchBox">
					<input id="inputBox" type="text" placeholder="검색어를 입력하세요"
						name="searchKeyWord" value="${param.searchKeyWord}" />
					<div id="buttonBox">
						<button type="submit">검색</button>
					</div>
				</div>
			</form>
		</div>
		<hr>
		<div id="boardBody">
			<table class="board_table" border="1">
				<thead class="board_thead">
					<tr class="board_tr">
						<th class="board_th">No.</th>
						<th class="board_th">제목</th>
						<th class="board_th">작성자</th>
						<th class="board_th">작성일</th>
						<th class="board_th"><a href="mentee?&sort=view">조회수↑</a></th>
						<th class="board_th"><a href="mentee?sort=recommend">추천수↑</a></th>
					</tr>
				</thead>
				<tbody class="board_tbody">
					<c:forEach items="${boardMenteeList}" var="list" varStatus="status">
						<tr class="board_tr">
							<td class="board_td">${list.bdIdx}</td>
							<td class="board_td"><a
								href="mentee/mentee-board-detail?bdIdx=${list.bdIdx}&userId=${list.userId}"><c:out
										value="${list.bdTitle}" /></a></td>
							<td class="board_td"><c:out value="${list.userId}" /></td>
							<td class="board_td"><c:out value="${list.regDate}" /></td>
							<td class="board_td"><c:out value="${list.viewCount}" /></td>
							<td class="board_td"><c:out value="${list.recCount}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<hr>
		<div id="boardFooter">
			<div id="pagingWraaper">

				<div id="pagingBox">

					<c:if test="${startNum>1}">
						<i class="fas fa-chevron-left" id="leftArrow"
							onclick="location.href='mentee?p=${startNum-1}&searchCondition=${param.searchCondition}&searchKeyWord=${param.searchKeyWord}'"></i>
					</c:if>
					<c:if test="${startNum<=1}">
						<i class="fas fa-chevron-left" id="leftArrow"
							onclick="alert('이전 페이지가 없습니다.')"></i>
					</c:if>
					<div id="buttonWrapper">
						<c:forEach var="i" begin="0" end="2">
							<c:if test="${(startNum+i) <= lastNum}">
								<button id="firstButton"
									onclick="location.href='mentee?p=${startNum+i}&searchCondition=${param.searchCondition}&searchKeyWord=${param.searchKeyWord}'">${startNum+i}</button>
							</c:if>
						</c:forEach>
					</div>
					<c:if test="${startNum+2<lastNum}">
						<i class="fas fa-chevron-right" id="rightArrow"
							onclick="location.href='mentee?p=${startNum+3}&searchCondition=${param.searchCondition}&searchKeyWord=${param.searchKeyWord}'"></i>
					</c:if>
					<c:if test="${startNum+2>=lastNum}">
						<i class="fas fa-chevron-right" id="rightArrow"
							onclick="alert('다음페이지가 없습니다.')"></i>
					</c:if>
				</div>
			</div>
			<div id="writerButton">
				<button type="button"
					onclick="location.href='mentee/mentee-board-create-form'">글작성</button>
			</div>
		</div>
	</div>

	<!-- Features section-->


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>


</body>
</html>