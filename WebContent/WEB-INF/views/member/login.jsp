<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel='stylesheet'
	href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link
	href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap"
	rel="stylesheet">
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>
<link rel="stylesheet" href="/mm/resources/css/font/style.css">
<!-- Style -->
<link rel='stylesheet'
	href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>

<link rel="stylesheet" href="/mm/resources/css/common/styles.css">
<link rel="stylesheet" href="/mm/resources/css/member/style.css">

</head>
<body>
	<!-- Navigation-->

	<div class="site-mobile-menu site-navbar-target">
		<div class="site-mobile-menu-header">
			<div class="site-mobile-menu-close mt-3">
				<span class="icon-close2 js-menu-toggle"></span>
			</div>
		</div>
		<div class="site-mobile-menu-body"></div>
	</div>
	<!-- .site-mobile-menu -->


	<div class="site-navbar-wrap">

		<div class="site-navbar site-navbar-target js-sticky-header">
			<div class="container">
				<div class="row align-items-center">
					<div class="col-2">

						<a class="navbar-brand" href="index.html">MENTOR & MENTEE</a>

					</div>
					<div class="col-10"
						style="display: flex; justify-content: flex-end;">
						<nav class="site-navigation text-right" role="navigation">
							<div class="container">
								<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
									<a href="#" class="site-menu-toggle js-menu-toggle text-black"><span
										class="icon-menu h3"></span></a>
								</div>

								<ul class="site-menu main-menu js-clone-nav d-none d-lg-block">

									<li><a href="#classes-section" class="nav-link">멘토신청</a></li>
									<li><a href="#gallery-section" class="nav-link">멘토링 관리</a></li>
									<li class="has-children"><a href="#" class="nav-link">게시판</a>
										<ul class="dropdown arrow-top" style="text-align: center;">
											<li><a href="#" class="nav-link">멘토 게시판</a></li>
											<li><a href="#" class="nav-link">멘티 게시판</a></li>


										</ul></li>
									<li><a href="#about-section" class="nav-link">일정관리</a></li>
									<li><a href="#events-section" class="nav-link">로그인</a></li>

									<li class="has-children"><a href="#" class="join-link">회원가입</a>
										<ul class="dropdown arrow-top" style="text-align: center;">
											<li><a href="#" class="mentor-join">멘토 가입</a></li>
											<li><a href="#" class="mentor-join">멘티 가입</a></li>
										</ul></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 로그인 후 바뀌는 내비바 변경사항 -->

	<!--                               <c:choose>
                                 <c:when test="${sessionScope.userId eq null}">
                                    <li><a href="#events-section" class="nav-link">로그인</a></li>
                                    <li class="has-children"><a href="#" class="nav-link">회원가입</a>
                                       <ul class="dropdown arrow-top">
                                          <li><a href="#" class="nav-link">멘토 가입</a></li>
                                          <li><a href="#" class="nav-link">멘티 가입</a></li>
                                       </ul>
                                    </li>
                                 </c:when>
                                 <c:otherwise>
                                    <li><a href="#mypage-section" class="nav-link">${request.userNickname}</a></li>
                                 </c:otherwise>
                              </c:choose> -->




	<div class="section">
		<div class="container">
			<div class="row full-height justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">
						<h6 class="mb-0 pb-3">
							<span>MENTOR & MENTEE</span>
						</h6>

						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
											<h4 class="mb-4 pb-3">Log In</h4>
											<div class="form-group">
												<input type="email" name="logemail" class="form-style"
													placeholder="Your Email" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<input type="password" name="logpass" class="form-style"
													placeholder="Your Password" id="logpass" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<a href="#" class="btn mt-4">submit</a>
											<p class="mb-0 mt-4 text-center">
												<a href="#0" class="link">Forgot your password?</a>
											</p>
											<div class="col-md-12">
												<ul class="social-network social-circle">
													<li><a href="#" class="icoFacebook" title="Facebook"><i
															class="fas fa-comment"></i></a></li>
													<li><a href="#" class="icoTwitter" title="Twitter"><i
															class="fab fa-neos"></i></a></li>

												</ul>
												<div class="modal-footer d-flex justify-content-center">
													<div class="signup-section">
														Not a member yet? <a href="#a" class="text-info"> Sign
															Up</a>.
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- partial -->



	<script src="/mm/resources/js/main/jquery-3.3.1.min.js"></script>
	<script src="/mm/resources/js/main/bootstrap.min.js"></script>
	<script src="/mm/resources/js/main/jquery.sticky.js"></script>
	<script src="/mm/resources/js/main/main.js"></script>
	<script src="/mm/resources/js/member/script.js"></script>
</body>
</html>