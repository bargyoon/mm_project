<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENTOR & MENTEE - 멘토 평가</title>

<link rel="stylesheet" href="/resources/css/mentoring/toggle-btn.css">
<%@ include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body class="d-flex flex-column h-75">
	<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<c:set var="mh" value="${requestScope.mh}"/>
	<main class="flex-shrink-0">
		<section class="pt-5">
			<div class="container px-5 mt-5 pt-5">
				<div class="row gx-5">
					<h5 class="fw-bolder px-sm-0 mb-3 pb-2" style="border-bottom: solid 2px gray;">멘토 평가</h5>
					<div class="fw-bolder mb-0 py-2 small offcanvas-header"></div>
				</div>
			</div>
		</section>
		
		<section class="py-3">
	        <div class="container px-5 my-5" style="margin-top: 0;">
	            <div class="row gx-5">
	                <div class="mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <div class="card-body p-4">
	                            <div class="badge bg-dark bg-gradient rounded-pill mb-2">멘토 <c:out value="${mh.mentorName}"/></div>
	                            <p class="small card-text mb-0">멘토링 진행기간 : <c:out value="${mh.startDate}"/> ~ <c:out value="${mh.endDate}"/></p>
	                            <hr>
	                            <h5 class="card-title mb-1 text-decoration-none mt-2">키워드 평가</h5>
	                            <p class="small card-text mt-0">멘토의 좋았던 점을 체크해주세요 !</p>
	                            <form action="/mentoring/regist-rating" class="mt-2">
	                            	<input type="hidden" name="m_idx" value="${mh.mIdx}">
	                            	<div class="justify-content-between">
				                        <div class="switch-holder my-md-2 mx-md-5">
					                        <div class="switch-label">
											<span>친절함</span>
										</div>
										<div class="switch-toggle">
											<input type="checkbox" name="rating" value="kindness" id="kindness">
											<label for="kindness"></label>
										</div>
										</div>
										<div class="switch-holder my-md-2 mx-md-5">
						                        <div class="switch-label">
												<span>의사소통</span>
											</div>
											<div class="switch-toggle">
												<input type="checkbox" name="rating" value="communication" id="communication">
												<label for="communication"></label>
											</div>
										</div>
										<div class="switch-holder my-md-2 mx-md-5">
						                        <div class="switch-label">
												<span>전문성</span>
											</div>
											<div class="switch-toggle">
												<input type="checkbox" name="rating" value="professional" id="professional">
												<label for="professional"></label>
											</div>
										</div>
				                        <div class="switch-holder my-md-2 mx-md-5">
					                        <div class="switch-label">
												<span>수업진행방식</span>
											</div>
											<div class="switch-toggle">
												<input type="checkbox" name="rating" value="process" id="process">
												<label for="process"></label>
											</div>
										</div>
										<div class="switch-holder my-md-2 mx-md-5">
					                        <div class="switch-label">
												<span>시간약속이행</span>
											</div>
											<div class="switch-toggle">
												<input type="checkbox" name="rating" value="timeAppointment" id="time_appointment">
												<label for="time_appointment"></label>
											</div>
										</div>
										<div class="switch-holder my-md-2 mx-md-5">
					                        <div class="switch-label">
												<span>설명능력</span>
											</div>
											<div class="switch-toggle">
												<input type="checkbox" name="rating" value="explain" id="explain">
												<label for="explain"></label>
											</div>
										</div>	
									</div>
									<hr>
									<h5 class="card-title mb-3 text-decoration-none mt-4">고생한 멘토에게 글남기기</h5>
			                        <div class="switch-holder m-3">
				                        <table style="width:100%;">
										    <tr>
												<th style="vertical-align: middle; text-align: center;">글자수 제한<br/>
										            <sup>(<span id="nowByte">0</span>/100자)</sup>
										        </th>
										        <td>
										           	<textarea rows="4" class="form-control" id="textArea_byteLimit" name="rating_comment" onkeyup="checkByte(this)"></textarea>
										        </td>
										    </tr>
										</table>
				                    </div>
				                    <div class="d-flex mt-5" style="justify-content: center;">
										<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder">작성 완료</button>
				                    </div>
								</form>
		                    </div>
						</div>
	                </div>
	            </div>
	        </div>
        </section>
	</main>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>		
	<script src="/resources/js/mentoring/mentor-rating.js"></script>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>

</body>
</html>