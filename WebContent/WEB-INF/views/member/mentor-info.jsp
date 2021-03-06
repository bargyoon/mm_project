<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>멘토 정보</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
</head>
<body class="bg-right">


<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container-fluid"
		style="padding-top: 9rem; padding-bottom: 9rem">
		<div class="row">
			<div class="col-md-10 col-11 mx-auto">


				<!-- Side navbar -->
				<div class="row">
					<div class="col-lg-3 col-md-4 d-md-block">
						<div class="card bg-common card-left bg-commom">
							<div class="profile">
								<img
									src="${files.downloadURL}"
									class="card-img-top img-fluid rounded-circle" alt=""
									style="margin: 15px auto; width: 120px; height: 120px; display: block">
								<h1 class="text-light mb-2">${userInfo.userName}</h1>
								<h4 class="text-light mb-2">멘토링 횟수:${mentorInfo.mentoringCnt}</h4>
							</div>
							<div class="card-body"></div>
						</div>
					</div>
					<!-- right side div -->
					<div class="col-lg-9 col-md-8">
						<div class="card">



							<!-- user profile start -->
							<div class="card-body tab-content border-0">
								<!-- profile data -->
								<div class="tab-pane active" id="profile">
									<h6>Your Profile Information</h6>
									<hr>
									<form>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">이름</label>

											<div class="form-control" id="exampleFormControlInput">${userInfo.userName}
											</div>

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">email</label>

											<div class="form-control" id="exampleFormControlInput">${userInfo.email}</div>

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">주소</label>

											<div class="form-control" id="exampleFormControlInput">${userInfo.address}</div>

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">대학</label>

											<div class="form-control" id="exampleFormControlInput">${mentorInfo.universityName}</div>

										</div>
										<div class="mb-3">
											<label for="exampleFormControlInput" class="form-label">전공 계열</label>

											<div class="form-control" id="exampleFormControlInput">${mentorInfo.major}</div>

										</div>

										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label">이력사항</label>
											<div class="myHistory" id="exampleFormControlTextarea1">

												<c:forTokens items="${mentorInfo.history}" delims=","
													var="hist">
													<div>-${hist}</div>
												</c:forTokens>

											</div>
										</div>


										<br>

										<a class="btn btn-outline-info" href="javascript:history.back();">멘토링 신청하기</a>
									</form>
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