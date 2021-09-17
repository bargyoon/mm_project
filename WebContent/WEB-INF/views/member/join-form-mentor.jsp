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
<body>

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container">
		<div class="row py-5 align-items-center">
			<!-- For Demo Purpose -->
			<div class="col-md-5 pr-lg-5 mb-5 mb-md-0">

				<h1>Create an Account</h1>
				<p class="font-italic text-muted mb-0">Create a minimal
					registeration page using Bootstrap 4 HTML form elements.</p>
				<p class="font-italic text-muted">
					Snippet By <a href="https://bootstrapious.com" class="text-muted">
						<u>Bootstrapious</u>
					</a>
				</p>
			</div>

			<!-- Registeration Form -->
			<div class="col-md-7 col-lg-6 ml-auto">
				<form action="#">
					<div class="row">

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

						<!-- Last Name -->
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
								class="form-control bg-white border-left-0 border-md"> <select
								id="addressCode" name="addressCode" style="max-width: 160px"
								class="custom-select form-control bg-white border-left-0 border-md h-100 font-weight-bold text-muted">
								<option value="">@google.com</option>
								<option value="">@naver.com</option>
								<option value="">@daum.net</option>
								<option value="">017</option>
							</select>
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

						<!-- Password -->
						<div class="input-group col-lg-12 mb-4">
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
						<div class="input-group col-lg-12 mb-4">
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

						<!-- Divider Text -->
						<div
							class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom w-100 ml-5"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted">spec</span>
							<div class="border-bottom w-100 mr-5"></div>
						</div>


						<!-- Job -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">Choose your job</option>
								<option value="">Designer</option>
								<option value="">Developer</option>
								<option value="">Manager</option>
								<option value="">Accountant</option>
							</select>
						</div>
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">Choose your job</option>
								<option value="">Designer</option>
								<option value="">Developer</option>
								<option value="">Manager</option>
								<option value="">Accountant</option>
							</select>
						</div>


						<!-- Submit Button -->
						<div class="form-group col-lg-12 mx-auto mb-0">
							<a href="#" class="btn btn-primary btn-block py-2"> <span
								class="font-weight-bold">Create your account</span>
							</a>
						</div>


						<!-- Social Login -->
						<div class="form-group col-lg-12 mx-auto">
							<a href="#" class="btn btn-primary btn-block py-2 btn-facebook">
								<i class="fa fa-facebook-f mr-2"></i> <span
								class="font-weight-bold">Continue with Facebook</span>
							</a> <a href="#" class="btn btn-primary btn-block py-2 btn-twitter">
								<i class="fa fa-twitter mr-2"></i> <span
								class="font-weight-bold">Continue with Twitter</span>
							</a>
						</div>

						<!-- Already Registered -->
						<div class="text-center w-100">
							<p class="text-muted font-weight-bold">
								Already Registered? <a href="#" class="text-primary ml-2">Login</a>
							</p>
						</div>

					</div>
				</form>
			</div>
		</div>
	</div>
	</main>
	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
</body>
</html>