<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENTOR & MENTEE - QR페이지</title>

<link rel="stylesheet" href="/resources/css/mentoring/calender.css">
<%@ include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body class="d-flex flex-column h-75">
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<main class="flex-shrink-0">
		<section class="pt-5">
			<div class="container px-5 my-5 py-5">
				<div class="row gx-5 pt-5 justify-content-md-around">
					<div class="col-lg-5 mb-5 mb-lg-5" style="text-align: center;">
						<img src="/file/qr_img/${requestScope.mentorIdx}.png">
						<h2 class="fw-bolder mb-0 text-sm-center my-5">멘토의 QR 코드</h2>
						<hr>
						<div class="text-sm-center mt-3">
							<span>멘토의 계좌와 연결되는 QR코드 입니다.<br>반드시 멘토와 상의 후 송금하세요.</span>
						</div>
						<div class="text-sm-center">
							<input class="btn btn-primary-dark btn-lg px-4 me-sm-3 mt-5 fw-bolder" type="button" value="확인" onclick="location.href='/mentoring/manage-page'">
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
</body>
</html>