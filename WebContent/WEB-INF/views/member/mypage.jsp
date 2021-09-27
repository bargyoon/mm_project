<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
</head>
<body class="bg-right">

	<!-- Top navbar -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container-fluid"
		style="padding-top: 9rem; padding-bottom: 9rem">
		<div class="row">
			<div class="col-md-10 col-11 mx-auto">


				<!-- Side navbar -->
				<div class="row">
					<div class="col-lg-3 col-md-4 d-md-block">
						<div class="card bg-common card-left bg-commom">
							<div class="card-body">
								<nav class="nav d-md-block d-none">
									<a data-toggle="tab" class="nav-link active"
										aria-current="page" href="#profile"> <i
										class="fas fa-user mr-1"></i>Profile
									</a> <a data-toggle="tab" class="nav-link" href="#account"> <i
										class="fas fa-user-cog mr-1"></i>Account Settings
									</a> <a data-toggle="tab" class="nav-link" href="#security"> <i
										class="fas fa-user-shield mr-1"></i>Security
									</a> <a data-toggle="tab" class="nav-link" href="#notification">
										<i class="fas fa-bell mr-1"></i>Notification
									</a> <a data-toggle="tab" class="nav-link" href="#billing"> <i
										class="fas fa-money-check-alt mr-1"></i>Billings
									</a>
								</nav>
							</div>
						</div>
					</div>
					<!-- right side div -->
					<div class="col-lg-9 col-md-8">
						<div class="card">
							<div class="card-header border-bottom mb-3 d-md-none">
								<ul class="nav nav-tabs card-header-tabs nav-fill">
									<li class="nav-item"><a data-toggle="tab"
										class="nav-link active" aria-current="page" href="#profile"><i
											class="fas fa-user mr-1"></i></a></li>
									<li class="nav-item"><a data-toggle="tab" class="nav-link"
										href="#account"><i class="fas fa-user-cog mr-1"></i></a></li>
									<li class="nav-item"><a data-toggle="tab" class="nav-link"
										href="#security"><i class="fas fa-user-shield mr-1"></i></a></li>
									<li class="nav-item"><a data-toggle="tab" class="nav-link"
										href="#notification"><i class="fas fa-bell mr-1"></i></a></li>
									<li class="nav-item"><a data-toggle="tab" class="nav-link"
										href="#billing"><i class="fas fa-money-check-alt mr-1"></i></a></li>

								</ul>
							</div>

							<!-- user profile start -->
							<div class="card-body tab-content border-0">
								<!-- profile data -->
								<div class="tab-pane active" id="profile">
									<h6>Your Profile Information</</h6>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">이름</label>

											<input type="text" class="form-control"
												id="exampleFormControlInput" placeholder="Thapa Technical">
											<small class="form-text text-muted">Please Enter your
												fullname</small>

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">location</label>

											<input type="text" class="form-control"
												id="exampleFormControlInput" placeholder="Thapa Technical">

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">location</label>

											<input type="text" class="form-control"
												id="exampleFormControlInput" placeholder="Thapa Technical">

										</div>
										
										<div class="mb-3" >
											<label for="exampleFormControlTextarea1" class="form-label">Your
												Bio</label>
											<textarea class="form-control"
												id="exampleFormControlTextarea1" row="3" placeholder="내용"></textarea>
										</div>
										
										<div class="form-group form-text text-muted small">여기에
											내용들이 들어가면 됩니다.</div>
										<br>
										<button class="btn btn-outline-info" type="button">Update
											Profile</button>
										<button class="btn btn-outline-info" type="reset">Reset
											Changes</button>
									</form>
								</div>

								<!-- account data -->
								<div class="tab-pane " id="account">
									<h6>Account Setting</h6>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">username</label>
											<input type="text" class="form-control"
												id="exampleFormControlInput1" placeholder="Thapa Technical">
											<small class='form-text text-muted'>회원 이름을 바꾸시면 쓰시던
												이름은 다른사람이 사용 가능하게 됩니다.</small>
										</div>
									</form>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput1"
												class="form-label text-danger">Delete Account</label>
											<p class="text-muted">계정을 삭제하시면 되돌릴 수 없습니다.</p>

										</div>
										<br>
										<button class="btn btn-danger">Delete Profile</button>
									</form>
								</div>
								<div class="tab-pane " id="security">
									<h6>Security Setting</h6>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">username</label>
											<input type="Password" class="form-control"
												id="exampleFormControlInput1" placeholder="현재 비밀번호">
											<br> <input type="Password" class="form-control"
												id="exampleFormControlInput1" placeholder="새로운 비밀번호">
											<input type="Password" class="form-control"
												id="exampleFormControlInput1" placeholder="비밀번호 확인">

										</div>
									</form>
									<hr>
									<form>
									<div class="form-group">
									<label class="d-block mb-2">Two Factor Authentication</label>
									<button class="btn btn-outline-info" type="submit">Enable two-factor authentication</button>
									<p class='text-muted small'>여기에 아마 카카오랑 네이버 로그인 연동하는거 하지 않을까 싶습니다.</p>
									</div>
									</form>
								</div>
								<div class="tab-pane " id="notification">
									<h6>Your Profile Information</</h6>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">이름</label>

											<input type="text" class="form-control"
												id="exampleFormControlInput" placeholder="Thapa Technical">
											<small class="form-text text-muted">Please Enter your
												fullname</small>

										</div>
									</form>
								</div>
								<div class="tab-pane " id="billing">
									<h1>this is the billing tab</h1>
								</div>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>



	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
</body>
</html>