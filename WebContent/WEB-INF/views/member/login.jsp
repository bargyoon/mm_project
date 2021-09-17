<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>





<%@ include file="/WEB-INF/views/include/head.jsp" %>
<link rel="stylesheet" href="/resources/css/member/style.css">




</head>
<body>
	<!-- Navigation-->

<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	



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
											<a href="/member/login" class="btn mt-4">submit</a>
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



	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
	<script src="/resources/js/member/script.js"></script>


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
											<a href="/member/login" class="btn mt-4">submit</a>
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



	<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
	<script src="/resources/js/member/script.js"></script>
</body>
</html>