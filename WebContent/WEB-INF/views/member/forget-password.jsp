<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 찾기</title>





<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/style.css">




</head>
<body style="height: 100vh">
	<!-- Navigation-->

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>



	<div class="section" style="min-height:92vh;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">

						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<form class="section text-left" action="/member/reset-password">
											<h3 class="mb-4">비밀번호를 잊으셨나요?</h3>
											<div class="mb-4">
												<div>가입시 작성한 이메일을 적어주십시오.</div>
												<div>재설정 안내 이메일을 발송해드립니다.</div>
											</div>

											<div class="form-group">
												<input type="email" name="logemail" class="form-style"
													placeholder="Your Email" id="logemail" autocomplete="off">
												<i class="input-icon uil uil-at"></i>
											</div>
											<p class='text-muted small' id="infoPw">
												<c:if test="${not empty param.err}">
                   등록되지 않은 이메일 입니다.
                </c:if>
											</p>

											<button type="submit" class="btn mt-4" style="width:100%">submit</button>

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
	<script src="/resources/js/member/script.js"></script>
</body>
</html>