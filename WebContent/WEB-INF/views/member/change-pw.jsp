<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>





<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/style.css">




</head>
<body style="height: 100vh">
	<!-- Navigation-->

	<%@ include file="/WEB-INF/views/include/nav.jsp"%>



	<div class="section" style="min-height: 92vh;">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-12 text-center align-self-center py-5">
					<div class="section pb-5 pt-5 pt-sm-2 text-center">

						<div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">

										<form action="/member/change-password"
											class="section text-left" method="post">
											<h3 class="mb-4">비밀번호 변경</h3>
											<div class="mb-4">
												<div>비밀번호 변경페이지 입니다.</div>
												<div>영어, 숫자, 특수문자 8글자 이상으로 작성해주십시오</div>
											</div>

											<div class="form-group">
												<input type="password" name="resetNewPw" class="form-style"
													placeholder="비밀번호" id="resetNewPw" autocomplete="off">
												<i class="input-icon uil uil-lock-alt"></i>
											</div>
											<div class="form-group mt-2">
												<input type="password" name="resetConfirmNewPw"
													class="form-style" placeholder="비밀번호 확인"
													id="resetConfirmNewPw" autocomplete="off"> <i
													class="input-icon uil uil-lock-alt"></i>
											</div>
											<span style="color: moccasin"> <c:choose>
													<c:when
														test="${not empty param.err and not empty modifyValid.newPassword}">
                         영어,숫자,특수문자 조합의 8글자 이상입니다.
                      </c:when>
													<c:when
														test="${not empty param.err and not empty modifyValid.confirmPassword}">
                         비밀번호가 일치하지 않습니다.
                      </c:when>
												</c:choose>
											</span>

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