<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MM 멘티 가입 페이지</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/join-form.css">
</head>
<body style="height: 100vh;">

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
<div class="container" style="padding-top:100px">
		<div class="row align-items-center">
			<!-- For Demo Purpose -->


			<!-- Registeration Form -->
			<div class="col-md-7 col-lg-6 m-auto">
				<form action="#">
					<div class="row" style="padding: 22px;">

						<!-- Name -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								</span>
							</div>
							<input id="userName" type="text" name="userName" placeholder="이름"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- UserId -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-user text-muted"></i>
								</span>
							</div>
							<input id="userId" type="text" name="userId" placeholder="아이디"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Password -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="Password"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Password Confirmation -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="Confirm Password"
								class="form-control bg-white border-left-0 border-md">
						</div>


						<!-- Email Address -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								</span>
							</div>
							<input id="email" type="email" name="email"
								placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md">
						</div>
						<!-- Gender -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								</span>
							</div>
							<div id="email" name="email" placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md"
								style="max-width: 80px; display: flex; align-content: center; flex-wrap: wrap; justify-content: flex-start;">성별</div>
							<div
								style="display: flex; justify-content: space-around; align-content: center; flex-wrap: wrap;"
								class="form-control bg-white border-left-0 border-md h-70 font-weight-bold">
								<div>
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" checked="" required=""> <label
										class="form-check-label" for="credit">남 </label>
								</div>
								<div>
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required=""> <label
										class="form-check-label" for="debit">여</label>
								</div>


							</div>
						</div>

						<!-- Address -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="주소"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Phone Number -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-phone-square text-muted"></i>
								</span>
							</div>
							<select id="countryCode" name="countryCode"
								style="max-width: 80px"
								class="custom-select form-control bg-white border-left-0 border-md h-100 font-weight-bold text-muted">
								<option value="">010</option>
								<option value="">011</option>
								<option value="">019</option>
								<option value="">017</option>
							</select> <input id="phoneNumber" type="tel" name="phone"
								placeholder="Phone Number"
								class="form-control bg-white border-md border-left-0 pl-3">
						</div>


						<!-- Nickname -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="닉네임"
								class="form-control bg-white border-left-0 border-md">
						</div>


						<!-- Divide Line -->
						<div
							class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom " style="width: 40%;"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted"
								style="width: 20%;">대학교 정보</span>
							<div class="border-bottom " style="width: 40%;"></div>
						</div>

						<!-- College name -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="재학중인 대학명"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- 현재 계열 -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">현재 계열</option>
								<option value="">문과</option>
								<option value="">이과</option>
								<option value="">예체능</option>
								<option value="">미정</option>
							</select>
						</div>
						
							<!-- 현재학년 -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">현재 학년</option>
								<option value="">1학년</option>
								<option value="">2학년</option>
								<option value="">3학년</option>
								<option value="">홈스쿨링</option>
							</select>
						</div>
						
						<!-- Want College name -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="희망 대학"
								class="form-control bg-white border-left-0 border-md">
						</div>
						

						<!-- Want Major -->

						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="희망 학과"
								class="form-control bg-white border-left-0 border-md">
						</div>

						

						<!-- Submit Button -->
						<div class="form-group col-lg-12 mx-auto mb-0">
							<a href="#" class="btn btn-primary btn-block py-2"> <span
								class="font-weight-bold">Create your account</span>
							</a>
						</div>



						<!-- Already Registered -->
						<div class="text-center w-100">
							<p class="text-muted font-weight-bold">
								이미 회원이신가요? <a href="/member/login-form" class="text-primary ml-2">Login</a>
							</p>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
</body>
</html>