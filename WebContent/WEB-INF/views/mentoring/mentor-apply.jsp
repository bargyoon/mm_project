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
			<div class="container px-5 my-5 py-5">
				<div class="row gx-5">
					<h5 class="fw-bolder px-sm-0 mb-3 pb-2" style="border-bottom: solid 2px gray;">멘토링 신청하기</h5>
				</div>
				<div class="row gx-5 pt-5 justify-content-md-around" id="apply-page-1">
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">희망 학과 선택</h5>
						<hr>
						<div class="fw-bolder mb-0 py-3 small offcanvas-header">
							<span>1. 학교 유형</span>
						</div>
						<div class="offcanvas-header">
							<label class=""><input class="me-md-1" type="radio" name="school_type" value="all">전체</label>
							<label class="px-sm-3"><input class="me-md-1" type="radio" name="school_type" value="university">대학교</label>
							<label class="px-sm-3"><input class="me-md-1" type="radio" name="school_type" value="college">전문대</label>
						</div>
						<hr>
						<div class="fw-bolder mb-0 py-3 small offcanvas-header">
							<span>2. 전공 계열</span>
							<span style="font-size: 11px">*중복선택가능</span>
						</div>
						<div class="offcanvas-header">
							<label><input class="me-md-1" type="checkbox" name="major_type" value="all">전체</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="humanities">인문계열</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="education">교육계열</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="Engineering">공학계열</label>
						</div>						
						<div class="offcanvas-header">
							<label><input class="me-md-1" type="checkbox" name="major_type" value="society">사회계열</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="nature">자연계열</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="anp">예체능계열</label>
							<label><input class="me-md-1" type="checkbox" name="major_type" value="medicine">의약계열</label>
						</div>
						<div class="offcanvas-header">
							<h3>1/3</h3>
							<div class="offcanvas-header">
								<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder" onclick="nextBtn()">다음</button>
							</div>
						</div>
					</div>
					<div class="col-lg-5 mb-5 mb-lg-5 navbar-nav-scroll">
						<h5 class="fw-bolder mb-0 text-sm-center">계열 안내</h5>
						<hr>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">1. 인문계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">2. 교육계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">3. 공학계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">4. 사회계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">5. 자연계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">6. 예체능계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">7. 의약계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
					</div>
				</div>
				
				<div class="row gx-5 pt-5 justify-content-md-around" id="apply-page-2">	
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">희망 요일 및 시간 선택</h5>
						<hr>
						<div class="fw-bolder mb-0 py-3 small offcanvas-header">
							<span>1. 원하는 요일</span>
							<span style="font-size: 11px">*중복선택가능</span>
						</div>
						<div class="offcanvas-header">
							<label><input class="me-md-1" type="checkbox" name="want_date" value="all">전체</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="humanities">월요일</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="education">화요일</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="Engineering">수요일</label>
						</div>						
						<div class="offcanvas-header">
							<label><input class="me-md-1" type="checkbox" name="want_date" value="society">목요일</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="nature">금요일</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="anp">토요일</label>
							<label><input class="me-md-1" type="checkbox" name="want_date" value="medicine">일요일</label>
						</div>
						<hr>
						<div class="fw-bolder mb-0 py-3 small offcanvas-header">
							<span>2. 원하는 시간</span>
						</div>
						<div class="list-group">
							<label class="ms-4"><input class="me-md-1" type="radio" name="want_time" value="all">전체</label>
							<label class="ms-4"><input class="me-md-1" type="radio" name="want_time" value="am">오전(00:00 ~ 12:00)</label>
							<label class="ms-4"><input class="me-md-1" type="radio" name="want_time" value="pm">오후(12:00 ~ 24:00)</label>
						</div>
						<div class="offcanvas-header">
							<h3>2/3</h3>
							<div class="offcanvas-header">
								<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder">이전</button>
								<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder">다음</button>
							</div>
						</div>
					</div>
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">달력</h5>
						<hr>
						<div class="offcanvas-header">
							<div class="year"></div>
							<div class="month-choice">
								<button class="calender_btn" onclick="prevMonth()">&lt;</button>
								<button class="calender_btn today_month"></button>
								<button class="calender_btn" onclick="nextMonth()">&gt;</button>
							</div>
						</div>
						<div>
							<div class="days">
								<div class="day">월</div>
								<div class="day">화</div>
								<div class="day">수</div>
								<div class="day">목</div>
								<div class="day">금</div>
								<div class="day">토</div>
								<div class="day">일</div>
							</div>
							<div class="dates"></div>
						</div>
					</div>
				</div>
				
				<div class="row gx-5 pt-5 justify-content-md-around" id="apply-page-3">	
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">원하는 진행 방식 선택</h5>
						<hr>
						<div class="list-group">
							<label><input class="me-md-1" type="radio" name="want_place" value="all">상관없음</label>
							<label><input class="me-md-1" type="radio" name="want_place" value="all">비대면(화상채팅)을 원해요</label>
							<label><input class="me-md-1" type="radio" name="want_place" value="humanities">저희 동네로 와주세요</label>
							<label><input class="me-md-1" type="radio" name="want_place" value="education">멘토의 동네로 갈게요</label>
							<label><input class="me-md-1" type="radio" name="want_place" value="Engineering">카페/스터디룸 등 대여 공간을 원해요.</label>
						</div>
						<div class="offcanvas-header">
							<h3>3/3</h3>
							<div class="offcanvas-header">
								<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder">이전</button>
								<button class="btn btn-primary-dark btn-lg px-4 ms-sm-3 fw-bolder">작성완료</button>
							</div>
						</div>
					</div>
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">멘토링 진행</h5>
						<hr>
						<div>
							<span class="fw-bolder mb-0 text-sm-center" style="font-size: 14px">여기에서 선택한 진행 방식을 무조건 지킬 필요는 없지만,<br>멘토와 멘티가 선호하는 진행 방식을 맞출 수 있습니다.
								<br><br>진행 방식은 멘토와 멘티가 협의 후 <br>언제든지 바뀔 수 있다는 점을 알아두세요.
							</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="/resources/js/mentoring/mentor-apply.js"></script>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
	

</body>
</html>