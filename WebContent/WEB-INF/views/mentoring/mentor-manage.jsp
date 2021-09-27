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
	<div class="container px-5 my-5 pt-5">
	    <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5">
		    <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start">
		    	<div class="d-flex align-items-center">
			    	<div class="mb-4 mb-xl-0">
			        	<img class="rounded-circle me-3" src="https://dummyimage.com/100x100/ced4da/6c757d" alt="..." />
			        </div>
			        <div class="mb-4 mb-xl-0">
			            <div class="fs-3 fw-bold text-white">멘토 ${sessionScope.authentication.userName}님</div>
			            <div class="text-white-50">Sign.</div>
			        </div>
		        </div>
		        <div class="d-flex flex-column align-items-center">
		            <div class="input-group mb-2">
		                <div class="fs-5 fw-bold text-white">신청 중인 멘토링</div>
		            </div>
		            <div class="small text-white-50">
		                <button class="btn btn-outline-light" onclick="renderApplying()">1건</button>
		            </div>
		        </div>
		        <div class="d-flex flex-column align-items-center">
		            <div class="input-group mb-2">
		                <div class="fs-5 fw-bold text-white">진행 중인 멘토링</div>
		            </div>
		            <div class="small text-white-50">
		                <button class="btn btn-outline-light" onclick="renderProceeding()">2건</button>
		            </div>
		        </div>
		        <div class="d-flex flex-column align-items-center">
		            <div class="input-group mb-2">
		                <div class="fs-5 fw-bold text-white">완료한 멘토링</div>
		            </div>
		            <div class="small text-white-50">
		                <button class="btn btn-outline-light" onclick="renderCompleted()">3건</button>
		            </div>
		        </div>
		    </div>
		</aside>
	</div>
	<div class="container px-5 my-5 pt-4">
		<div class="row gx-5">
			<h5 class="fw-bolder px-sm-0 mb-3 pb-2" id="type_manage" style="border-bottom: solid 2px gray;">진행중인 멘토링</h5>
		</div>
		<div class="row">
			<div class="text-muted text-sm-end" id="expiration-date" style="font-size: 0.75rem"></div>
		</div>
	</div>
	<section>
        <div class="container px-5">
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-8 col-xl-3">
                    <div class="text-center">
                        <h2 class="fw-bolder pb-3" style="border-bottom: solid 2px gray">8월</h2> <!-- userId로 mentoring history에서 현재 진행 상황에 맞는 멘토리스트를 데려오고 월 별로 끊어서 출력(여기에는 년도와 월 출력) -->
                    </div>
                </div>
            </div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-10 mb-4">
					<div class="d-flex align-items-center justify-content-between">
					    <div class="d-flex align-items-center">
					    	<img class="rounded-circle me-3" src="https://dummyimage.com/60x60/ced4da/6c757d" alt="..." />
					    	<div class="small">
						        <div class="fw-bold">멘토 이름</div>
						        <div class="text-muted">희망 멘토 진행 기간 : 가져와서 적용</div>
					        </div>
					    </div>
						<div class="d-flex flex-column">
						    <button class="btn btn-primary-dark my-1" style="font-size: 0.75rem" id="button-newsletter" type="button" onclick="renderCompleted()">재신청</button>
						    <button class="btn btn-primary-dark my-1" style="font-size: 0.75rem" id="button-newsletter" type="button" onclick="renderCompleted()">결제하기</button>
						</div>
					</div>
                <hr>
                </div>
			</div>
			 <div class="row gx-5 justify-content-center">
                <div class="col-lg-10 mb-4">
					<div class="d-flex align-items-center justify-content-between">
					    <div class="d-flex align-items-center">
					    	<img class="rounded-circle me-3" src="https://dummyimage.com/60x60/ced4da/6c757d" alt="..." />
					    	<div class="small">
						        <div class="fw-bold">멘토 이름</div>
						        <div class="text-muted">멘토 진행 기간 : 가져와서 적용</div>
					        </div>
					    </div>
					</div>
                <hr>
                </div>
			</div>
            <div class="row gx-5 justify-content-center">
                <div class="col-lg-10 mb-4">
					<div class="d-flex align-items-center justify-content-between">
					    <div class="d-flex align-items-center">
					    	<img class="rounded-circle me-3" src="https://dummyimage.com/60x60/ced4da/6c757d" alt="..." />
					    	<div class="small">
						        <div class="fw-bold">멘토 이름</div>
						        <div class="text-muted">멘토 진행 기간 : 가져와서 적용</div>
					        </div>
					    </div>
						<div class="d-flex flex-column">
						    <button class="btn btn-primary-dark my-1" style="font-size: 0.75rem" id="button-newsletter" type="button" onclick="renderCompleted()">재신청</button>
						    <button class="btn btn-primary-dark my-1" style="font-size: 0.75rem" id="button-newsletter" type="button" onclick="renderCompleted()">평가하기</button>
						</div>
					</div>
                <hr>
                </div>
			</div>
		</div>

    </section>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="/resources/js/mentoring/mentor-manage.js"></script>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
	

</body>
</html>