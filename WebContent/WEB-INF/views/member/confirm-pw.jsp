<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>





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

										<form action="/member/delete-member" class="section text-left"
											method="post">
											<h3 class="mb-4">회원탈퇴 인증</h3>
											<div class="mb-4">
												<div>비밀번호 확인후 탈퇴가 완료됩니다.</div>
												<div>회원탈퇴 후 동일 아이디로 재가입이 불가능 하니 신중하게 생각해주세요.</div>
											</div>

											<div class="form-group">
												<input type="password" name="password" class="form-style"
													placeholder="비밀번호" id="password" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<p class='text-muted small' id="infoPw">
												<c:if test="${not empty param.err}">
                   비밀번호를 잘못 입력하였습니다.
                </c:if>
											</p>

											<button class="btn mt-4" type="submit" style="width: 100%">submit</button>

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



	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
	<script src="/resources/js/member/script.js"></script>
</body>
</html>