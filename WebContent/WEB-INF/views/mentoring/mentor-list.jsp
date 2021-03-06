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
		<c:set var="excellentMentors" value="${requestScope.excellentMentors}"/>
		<c:set var="excellentMentorsInfo" value="${requestScope.excellentMentorsInfo}"/>
		<c:set var="excellentHistoryList" value="${requestScope.excellentHistoryList}"/>
		<c:set var="excellentMentorImg" value="${requestScope.excellentMentorImg}"/>
		<c:set var="normalMentors" value="${requestScope.normalMentors}"/>
		<c:set var="normalMentorsInfo" value="${requestScope.normalMentorsInfo}"/>
		<c:set var="normalHistoryList" value="${requestScope.normalHistoryList}"/>
		<c:set var="normalMentorImg" value="${requestScope.normalMentorImg}"/>
	        <div class="container px-5 my-5">
	            <div class="row gx-5">
	            	<c:choose>
						<c:when test="${excellentMentors.size() == 0 && normalMentors.size() == 0}">
							<div class="container px-5 my-5 py-5">
								<div class="row gx-5 pt-5 justify-content-md-around" id="apply-page-1">
									<div class="col-lg-10 mb-5 mb-lg-5">
										<h2 class="fw-bolder mb-0 text-sm-center my-5">선택한 조건에 맞는 멘토가 없습니다.</h2>
										<hr>
										<div class="text-sm-center mt-3">
											<span>다른 조건으로 멘토를 선택해주세요.</span>
										</div>
										<div class="text-sm-center">
											<input class="btn btn-primary-dark btn-lg px-4 me-sm-3 mt-5 fw-bolder" type="button" value="뒤로가기" onclick="history.back()">
										</div>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<c:if test="${excellentMentors.size() > 0}">
				            	<c:forEach var="i" begin="0" step="1" end="${excellentMentors.size()-1}">
					                <div class="col-lg-4 mb-5">
					                    <div class="card h-100 shadow border-0">
					                        <div class="card-body p-4">
					                            <div class="badge bg-primary bg-gradient rounded-pill mb-4">우수 멘토</div>
					                        	<div class="d-flex align-items-end justify-content-between">
					                                <div class="d-flex align-items-center">
					                                	<c:if test="${excellentMentors[i].profileImg eq 1}">
					                                    	<img class="rounded-circle me-3" src="${excellentMentorImg[i].downloadURL}" alt="..."
					                                    		style="height: 60px; width: 60px"/>
					                                	</c:if>
					                                    <div class="small">
					                                        <div class="fw-bold">${excellentMentorsInfo[i].userName}</div>
					                                        <div class="text-muted">${excellentMentors[i].universityName} &middot; ${excellentMentors[i].grade}학년</div>
					                                    </div>
					                                </div>
					                            </div>
					                            <c:if test="${excellentMentors[i].history eq null}">
					                            <div class="text-decoration-none link-dark "><h6 class="card-title mb-3 mt-4">이력사항</h6></div>
					                            	<p class="card-text mb-0 small">이력사항이 없습니다.</p>
					                            </c:if>
					                             <c:if test="${excellentMentors[i].history ne null}">
					                            <div class="text-decoration-none link-dark "><h6 class="card-title mb-3 mt-4">이력사항</h6></div>
					                            	<c:forEach var="j" begin="0" step="1" end="${excellentHistoryList[i].size()-1}">
					                            		<p class="card-text mb-0 small">${excellentHistoryList[i][j]}</p>
					                            	</c:forEach>
					                            </c:if>
					                        </div>
					                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
					                            <div class="d-flex align-items-center justify-content-between">
					                            	<button class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" onclick="checkHistory(${excellentMentorsInfo[i].userIdx})" style="box-shadow: 4px 3px 3px black; color: white;">이력 자세히 보기</button>
					                            	<button class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" onclick="apply(${excellentMentorsInfo[i].userIdx}, ${excellentMentors[i].mentorIdx})" style="box-shadow: 4px 3px 3px black; color: white;">멘토링 신청하기</button>
					                            </div>
					                        </div>
					                    </div>
					                </div>
				            	</c:forEach>
			            		<hr>
			            	</c:if>
			            	<c:if test="${normalMentors.size() > 0}">
			            	<c:forEach var="i" begin="0" step="1" end="${normalMentors.size()-1}">
				                <div class="col-lg-4 mb-5 mt-5">
				                    <div class="card h-100 shadow border-0">
				                        <div class="card-body p-4">
				                        	<div class="d-flex align-items-end justify-content-between">
				                                <div class="d-flex align-items-center">
				                                    <c:if test="${normalMentors[i].profileImg eq 1}">
					                                    <img class="rounded-circle me-3" src="${normalMentorImg[i].downloadURL}" alt="..."
					                                    	style="height: 60px; width: 60px"/>
					                                </c:if>
				                                    <div class="small">
				                                        <div class="fw-bold">${normalMentorsInfo[i].userName}</div>
				                                        <div class="text-muted">${normalMentors[i].universityName} &middot; ${normalMentors[i].grade}학년</div>
				                                    </div>
				                                </div>
				                            </div>
				                            <c:if test="${normalMentors[i].history eq null}">
				                            <div class="text-decoration-none link-dark "><h6 class="card-title mb-3 mt-4">이력사항</h6></div>
				                            	<p class="card-text mb-0 small">이력사항이 없습니다.</p>
				                            </c:if>
				                            <c:if test="${normalMentors[i].history ne null}">
				                            <div class="text-decoration-none link-dark "><h6 class="card-title mb-3 mt-4">이력사항</h6></div>
				                            	<c:forEach var="j" begin="0" step="1" end="${normalHistoryList[i].size()-1}">
				                            		<p class="card-text mb-0 small">${normalHistoryList[i][j]}</p>
				                            	</c:forEach>
				                            </c:if>
				                        </div>
				                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
				                            <div class="d-flex align-items-center justify-content-between">
				                            	<button class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" onclick="checkHistory(${normalMentorsInfo[i].userIdx})" style="box-shadow: 4px 3px 3px black; color: white;">이력 자세히 보기</button>
				                            	<button class="btn bg-primary btn-lg px-3 me-sm-3 fw-bolder" onclick="apply(${normalMentorsInfo[i].userIdx}, ${normalMentors[i].mentorIdx})" style="box-shadow: 4px 3px 3px black; color: white;">멘토링 신청하기</button>
				                            </div>
				                        </div>
				                    </div>
				                </div>
			            	</c:forEach>
			            	</c:if>
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