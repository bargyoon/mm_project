<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/style.css">

</head>
<body style="height: 100vh">
	<!-- Navigation-->

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>


	<div class="section" style="min-height:92vh">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">

						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<form class="section text-center" action="/member/login"
											method="get">
											<h4 class="mb-4 pb-3">Log In</h4>
											<div class="form-group">
												<input type="text" name="userId" class="form-style"
													placeholder="아이디" id="userId" autocomplete="off"> <i
													class="input-icon uil uil-at"></i>
											</div>
											<div class="form-group mt-2">
												<input type="password" name="password" class="form-style"
													placeholder="비밀번호" id="password" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<span style="color: moccasin"><c:if
													test="${not empty param.err}">
                			아이디 또는 비밀번호가 틀렸습니다.
                		</c:if></span>
											<p class="mb-0 mt-4 text-center">
												<a href="/member/forget-password" class="link">비밀번호를
													잊으셨습니까?</a>
											</p>
											<input type="submit" class="btn original mt-2 mb-2"
												value="로그인">
											<div class="border-bottom "></div>
											<a href="javascript:loginFormWithKakao()"
												class="btn kakao mt-2">카카오로 로그인</a> 

											<div class="col-md-12">

												<div class="signup-section">
													Not a member yet? <a href="/member/join-rule"
														style="color: orange"> Sign Up</a>.
												</div>
											</div>
										</form>
									</div>
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
	
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="/resources/js/member/login.js"></script>
	
</body>
</html>