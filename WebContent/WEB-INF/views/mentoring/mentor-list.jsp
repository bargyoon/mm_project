<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENTOR & MENTEE - 멘토링 신청</title>

<link rel="stylesheet" href="/resources/css/mentoring/calender.css">
<%@ include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body class="d-flex flex-column h-75">
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<main class="flex-shrink-0">
		<section class="pt-5">
			<div class="container px-5 mt-5 pt-5">
				<div class="row gx-5">
					<h5 class="fw-bolder px-sm-0 mb-3 pb-2" style="border-bottom: solid 2px gray;">추천 멘토 리스트</h5>
					<div class="fw-bolder mb-0 py-2 small offcanvas-header">
						<span></span>
						<span style="font-size: 11px">${sessionScope.authentication.userName} 님의 선택에 따른 추천 멘토 리스트 입니다.</span>
					</div>
				</div>
			</div>
		</section>
		
		<section class="py-3">
		<c:set var="Members" value="${requestScope.selectedMembers}"/>
		<c:set var="Mentors" value="${requestScope.selectedMentors}"/>
	        <div class="container px-5 my-5">
	            <div class="row gx-5">
	            	<c:choose>
						<c:when test="${Mentors == null}">
							당신의 선택과 일치하는 멘토가 존재하지 않습니다.
							<a href="/memtoring/apply-page"><button>뒤로가기</button></a>
						</c:when>
						<c:otherwise>
			            	<c:forEach var="i" begin="0" step="1" end="${Mentors.size()-1}">
				                <div class="col-lg-4 mb-5">
				                    <div class="card h-100 shadow border-0">
				                        <div class="card-body p-4">
				                            <div class="badge bg-primary bg-gradient rounded-pill mb-4">우수 멘토</div>
				                        	<div class="d-flex align-items-end justify-content-between">
				                                <div class="d-flex align-items-center">
				                                    <img class="rounded-circle me-3" src="https://dummyimage.com/50x50/ced4da/6c757d" alt="..." />
				                                    <div class="small">
				                                        <div class="fw-bold">${Members[i].userName}</div>
				                                        <div class="text-muted">${Mentors[i].universityName} &middot; ${Mentors[i].grade}학년</div>
				                                    </div>
				                                </div>
				                            </div>
				                            <div class="text-decoration-none link-dark stretched-link"><h6 class="card-title mb-3 mt-4">이력사항</h6></div>
				                            <p class="card-text mb-0 small">${Mentors[i].history}</p>
				                        </div>
				                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
				                            <div class="d-flex align-items-center justify-content-between">
				                            		<a class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" href="/member/mypage" style="box-shadow: 4px 3px 3px black; color: white;">이력 자세히 보기</a>
				                            		<a class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" href="/mentoring/apply-complete" style="box-shadow: 4px 3px 3px black; color: white;">멘토링 신청하기</a>
				                            </div>
				                        </div>
				                    </div>
				                </div>
			            	</c:forEach>
			            	<hr>
						</c:otherwise>
					</c:choose>
	            </div>
	        </div>
        </section>
	</main>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>		
	<script src="/resources/js/mentoring/mentor-list.js"></script>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>

</body>
</html>