<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700"
	rel="stylesheet">
<link href="/resources/css/member/mypage.css" rel="stylesheet">
</head>
<body style="height: 100vh">

	<div class="main-content">
		<!-- Top navbar -->
		<%@ include file="/WEB-INF/views/include/nav.jsp"%>

		<!-- Header -->
		<div class="header pb-8 pt-5 pt-lg-8 d-flex align-items-center" style="min-height: 300px; background-color: #343a40; background-size: cover; background-position: center top;">
			<!-- Mask -->

			<!-- Header container -->
			
		</div>
		<!-- Page content -->
		<div class="container-fluid mt--7">
			<div class="row">
				<div class="col-xl-4 order-xl-2 mb-5 mb-xl-0">
					<div class="card card-profile shadow">
						<div class="row justify-content-center">
							<div class="col-lg-3 order-lg-2">
								<div class="card-profile-image">
									<a href="#"> <img
										src="https://footballk.net/w/images/thumb/3/39/%ED%99%8D%EA%B8%B8%EB%8F%99.jpg/300px-%ED%99%8D%EA%B8%B8%EB%8F%99.jpg"
										class="rounded-circle">
									</a>
								</div>
							</div>
						</div>
						<div
							class="card-header text-center border-0 pt-8 pt-md-4 pb-0 pb-md-4">
							<div class="d-flex justify-content-end">
								<a href="#" class="btn btn-sm btn-default float-right">사진 변경</a>
							</div>
						</div>
						<div class="card-body pt-0 pt-md-4">
							<div class="row">
								<div class="col">
									<div
										class="card-profile-stats d-flex justify-content-center mt-md-5">



									</div>
								</div>
							</div>
							<div class="text-center">
								<h3>
									홍길동<span class="font-weight-light">, 17</span>
								</h3>



								<div>
									<i class="ni education_hat mr-2"></i>대한 고등학교
								</div>



							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-8 order-xl-1">
					<div class="card bg-secondary shadow" style="margin-bottom: 100px">
						<div class="card-header bg-white border-0">
							<div class="row align-items-center">
								<div class="col-8">
									<h3 class="mb-0">My account</h3>
								</div>
								<div class="col-4 text-right"></div>
							</div>
						</div>
						<div class="card-body">
							<form>
								<h6 class="heading-small text-muted mb-4">회원정보</h6>
								<div class="pl-lg-4">
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-userId">아이디</label>
												<input type="text" id="input-userId" class="form-control form-control-alternative" placeholder="아이디" value="hong123">
													
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group">
												<label class="form-control-label" for="input-email">이메일</label>
												<input type="email" id="input-email" class="form-control form-control-alternative" placeholder="이메일" value="honghong@naver.com">
											</div>
										</div>
									</div>
									<div class="row">
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-first-name">전화번호</label>
											<input type="tel" id="input-tell" class="form-control form-control-alternative" placeholder="전화번호" value="010-1234-5678">
												
											</div>
										</div>
										<div class="col-lg-6">
											<div class="form-group focused">
												<label class="form-control-label" for="input-last-name">주소</label>
											<input type="text" id="input-address" class="form-control form-control-alternative" placeholder="주소" value="서울 성북구">
													
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
						<hr class="my-4">
						<!-- Address -->
						<h6 class="heading-small text-muted mb-4">Contact information</h6>
						<div class="pl-lg-4">
							<div class="row">
								<div class="col-md-12">
									<div class="form-group focused">
										<label class="form-control-label" for="input-address">Address</label>
										<input id="input-address"
											class="form-control form-control-alternative"
											placeholder="Home Address"
											value="Bld Mihail Kogalniceanu, nr. 8 Bl 1, Sc 1, Ap 09"
											type="text">
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-city">City</label>
										<input type="text" id="input-city"
											class="form-control form-control-alternative"
											placeholder="City" value="New York">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group focused">
										<label class="form-control-label" for="input-country">Country</label>
										<input type="text" id="input-country"
											class="form-control form-control-alternative"
											placeholder="Country" value="United States">
									</div>
								</div>
								<div class="col-lg-4">
									<div class="form-group">
										<label class="form-control-label" for="input-country">Postal
											code</label> <input type="number" id="input-postal-code"
											class="form-control form-control-alternative"
											placeholder="Postal code">
									</div>
								</div>
							</div>
						</div>



						<div class="form-group"
							style="display: flex; justify-content: center;">
							<button href="#!" class="btn btn-info""="">Settings</button>
						</div>
						<!-- Description -->

						<div class="pl-lg-4"></div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
</body>
</html>