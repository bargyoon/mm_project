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
	<div class="board_section">
		<div id="boardHeader">
			<div id="boardTitle">
				<p>멘티 게시판</p>
			</div>
			<form class="wrap_search" action="/board-list" method="get">
				<div id="dateList">
					<select id="dateBox" name="date">
						<option value="entire-period">전체기간</option>
						<option value="day">1일</option>
						<option value="week">1주</option>
						<option value="month">1개월</option>
						<option value="three-month">3개월</option>
						<option value="year">1년</option>
					</select>
				</div>
				<div id="searchList">
					<select id="selectBox" name="search">
						<option value="title">제목</option>
						<option value="user">작성자</option>
						<option value="post-title">게시글+제목</option>
					</select>
				</div>
				<div id="searchBox">
					<input id="inputBox" type="text" placeholder="검색어를 입력하세요">
					<div id="buttonBox">
						<button>검색</button>
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
						<th class="board_th">조회수</th>
						<th class="board_th">추천수</th>
					</tr>
				</thead>
				<tbody class="board_tbody">
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
					<tr class="board_tr">
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
						<td class="board_td"><a></a></td>
					</tr>
				</tbody>
			</table>
		</div>
		<hr>
		<div id="boardFooter">
			<div id="pagingWraaper">
				<div id="countBox">
					<select id="count" name="count">
						<option value="count15">15개</option>
						<option value="count30">30개</option>
						<option value="count60">60개</option>
					</select>
				</div>
				<div id="pagingBox">
					<i class="fas fa-chevron-left" id="leftArrow"></i>
					<div id="buttonWrapper">
						<button id="firstButton">1</button>
						<button id="secondButton">2</button>
						<button id="thirdButton">3</button>
					</div>
					<i class="fas fa-chevron-right" id="rightArrow"></i>
				</div>
			</div>
			<div id="writerButton">
				<button>글작성</button>
			</div>
		</div>
	</div>

	<!-- Features section-->

	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>


</body>
</html>