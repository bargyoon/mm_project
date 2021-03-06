<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/mypage.css">
</head>
<body class="bg-right" style="height: 100vh">

	<!-- Top navbar -->
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>
	<div class="container-fluid"
		style="padding-top: 9rem; padding-bottom: 9rem; min-height: 92vh">
		<div class="row">
			<div class="col-md-10 col-11 mx-auto">


				<!-- Side navbar -->
				<div class="row">
					<div class="col-lg-3 col-md-4 d-md-block">
						<div class="card bg-common card-left bg-commom">
							<div class="profile">
								<c:if test="${not empty sessionScope.files}">
									<img src="${files.downloadURL}"
										class="card-img-top img-fluid rounded-circle" alt
										style="margin: 15px auto; width: 120px; height: 120px; display: block">
								</c:if>

								<h1 class="text-light" style="margin-top: 40px">${authentication.userName}</h1>
								
							</div>

							<div class="card-body">
								<nav class="nav d-md-block d-none">
									<a data-toggle="tab" class="nav-link active"
										aria-current="page" href="#profile"> <i
										class="fas fa-user mr-1"></i>프로필
									</a> <a data-toggle="tab" class="nav-link" href="#account"> <i
										class="fas fa-user-cog mr-1"></i>계정 정보
									</a> <a data-toggle="tab" class="nav-link" href="#security"> <i
										class="fas fa-user-shield mr-1"></i>Security
									</a>
									<c:if test="${not empty sessionScope.authMentor }">
										<a data-toggle="tab" class="nav-link" href="#billing"> <i
											class="fas fa-money-check-alt mr-1"></i>계좌 정보
										</a>
									</c:if>

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
									<c:if test="${not empty sessionScope.authMentor }">
										<li class="nav-item"><a data-toggle="tab"
											class="nav-link" href="#billing"><i
												class="fas fa-money-check-alt mr-1"></i></a></li>

									</c:if>


								</ul>
							</div>

							<!-- user profile start -->
							<div class="card-body tab-content border-0">
								<!-- profile data -->
								<div class="tab-pane active" id="profile">
									<h6>프로필 정보</</h6>
									<hr>
									<c:choose>
										<c:when test="${not empty sessionScope.authMentor }">
											<form action="/member/modify-mentor">
										</c:when>
										<c:otherwise>
											<form action="/member/modify-mentee">
										</c:otherwise>
									</c:choose>
									<div class="mb-3">
										<label for="userName" class="form-label">이름</label> <input
											type="text" class="form-control" id="userName"
											name="userName" required value="${authentication.userName}">


									</div>
									<div class="mb-3">
										<label for="email" class="form-label">email</label> <input
											type="text" class="form-control" id="email" name="email"
											required value="${authentication.email}">

									</div>
									<div class="mb-3">
										<label for="phone" class="form-label">핸드폰</label> <input
											type="text" class="form-control" id="phone" name="phone"
											required value="${authentication.phone}">

									</div>
									<div class="mb-3">
										<label for="address" class="form-label">주소</label> <input
											type="text" class="form-control" id="address" name="address"
											required value="${authentication.address}">

									</div>
									<c:choose>
										<c:when test="${not empty sessionScope.authMentor }">
											<div class="mb-3">
												<label for="university" class="form-label">학교</label> <input
													type="text" class="form-control" id="university"
													name="university" required
													value="${authMentor.universityName}">

											</div>
											<div class="mb-3">
												<label for="grade" class="form-label">학년</label> <select
													data-sel="grade" class="form-control" id="grade"
													name="grade">
													<option disabled>현재 학년</option>
													<option value="1">1학년</option>
													<option value="2">2학년</option>
													<option value="3">3학년</option>
													<option value="4">4학년</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="major" class="form-label">전공계열</label> <select
													data-sel="major" class="form-control" id="major"
													name="major">
													<option disabled>전공 계열</option>
													<option value="humanities">인문계열</option>
													<option value="education">교육계열</option>
													<option value="engineering">공학계열</option>
													<option value="society">사회계열</option>
													<option value="nature">자연계열</option>
													<option value="anp">예체능계열</option>
													<option value="medicine">의약계열</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="wantDay" class="form-label">원하는 요일</label> <select
													data-sel="wantDay" class="form-control" id="wantDay"
													name="wantDay">
													<option disabled>희망 요일</option>
													<option value="mon">월요일</option>
													<option value="tue">화요일</option>
													<option value="wed">수요일</option>
													<option value="thu">목요일</option>
													<option value="fri">금요일</option>
													<option value="sat">토요일</option>
													<option value="sun">일요일</option>
													<option value="all">무관</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="wantTime" class="form-label">원하는 시간</label> <select
													data-sel="wantTime" class="form-control" id="wantTime"
													name="wantTime">
													<option disabled>희망 시간</option>
													<option value="am">오전(09:00 ~ 12:00)</option>
													<option value="pm">오후(12:00 ~ 17:00)</option>
													<option value="evening">저녁(17:00 ~ 21:00)</option>
													<option value="all">무관</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="requirement" class="form-label">요구사항</label> <select
													data-sel="requirement" class="form-control"
													id="requirement" name="requirement">
													<option disabled>원하는 진행방식</option>
													<option value="videoChat">비대면(화상채팅)</option>
													<option value="myTown">멘토의 동네에서 대면 수업</option>
													<option value="yourTown">멘티의 동네에서 대면 수업</option>
													<option value="rentalSpace">카페나 스터디룸 대여희망</option>
												</select>
											</div>

											<div class="mb-3">
												<label for="originHistory" class="form-label">이력사항</label>
												<div class='myHistory' id="originHistory"
													name="originHistory">
													<c:forTokens items="${authMentor.history}" delims=","
														var="hist">
														<div>-${hist}</div>
													</c:forTokens>
												</div>
											</div>

											<div class="form-group " id="histories">
												<div class="form-text text-muted small">
													이력사항을 추가하시려면 오른쪽 +버튼을 눌러 추가하시면 됩니다.<a
														class="btn btn-outline-warning btn-sm ml-2"
														id="btnHistory" onclick="addHist();">+</a>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="mb-3">
												<label for="schoolName" class="form-label">학교</label> <input
													type="text" class="form-control" id="schoolName"
													name="schoolName" required value="${authMentee.schoolName}">

											</div>
											<div class="mb-3">
												<label for="major" class="form-label">현재 계열</label> <select
													data-sel="major" class="form-control" id="major"
													name="major">
													<option disabled>현재 계열</option>
													<option value="문과">문과</option>
													<option value="이과">이과</option>
													<option value="예체능">예체능</option>
													<option value="미정">미정</option>
												</select>
											</div>
											<div class="mb-3">
												<label for="grade" class="form-label">학년</label> <select
													data-sel="grade" class="form-control" id="grade"
													name="grade">
													<option disabled>현재 학년</option>
													<option value="1">1학년</option>
													<option value="2">2학년</option>
													<option value="3">3학년</option>
													<option value="4">4학년</option>
												</select>
											</div>

											<div class="mb-3">
												<label for="hopeUniversity" class="form-label">희망 대학</label>
												<input type="text" class="form-control" id="hopeUniversity"
													name="hopeUniversity" value="${authMentee.hopeUniversity}">

											</div>

											<div class="mb-3">
												<label for="hopeMajor" class="form-label">희망 학과</label> <input
													type="text" class="form-control" id="hopeMajor"
													name="hopeMajor" value="${authMentee.hopeMajor}">

											</div>
										</c:otherwise>
									</c:choose>


									<br>
									<button class="btn btn-outline-info" type="submit">Update
										Profile</button>
									<button class="btn btn-outline-info" type="reset" id="resetBtn">Reset
										Changes</button>
									</form>
								</div>

								<!-- account data -->
								<div class="tab-pane " id="account">
									<h6>계정 설정</h6>
									<hr>

									<c:if test="${not empty sessionScope.authMentor }">
										<form action="/member/uploadImg" method="post"
											enctype="multipart/form-data">
											<div class="mb-3">
												<label for="profile_img" class="form-label">사진등록</label> <input
													type="file" class="btn form-control" name="files"
													id="profile_img"> <small
													class='form-text text-muted'>사진을 등록하세요.</small>
											</div>
											<button class="btn btn-success">사진 등록하기</button>
										</form>
										<hr>
									</c:if>


									<form action="/member/confirm-pw">
										<div class="mb-3">
											<label for="exampleFormControlInput1"
												class="form-label text-danger">Delete Account</label>
											<p class="text-muted">계정을 삭제하시면 되돌릴 수 없습니다.</p>

										</div>
										<br>
										<button class="btn btn-danger" type="submit">Delete
											Profile</button>
									</form>
								</div>
								<div class="tab-pane " id="security">
									<h6>Security Setting</h6>
									<hr>
									<form action="/member/modify-password" method="post">
										<div class="mb-3">
											<label for="exampleFormControlInput1" class="form-label">현재
												비밀번호</label> <input type="Password" class="form-control" id="currPw"
												name="currPw" placeholder="현재 비밀번호">
											<p class='text-muted small' id="infoCurrPw">
												<c:if
													test="${not empty param.err and not empty modifyValid.currPassword}">
                   비밀번호를 잘못 입력하였습니다.
                </c:if>
											</p>
											<label for="exampleFormControlInput1" class="form-label">새로운
												비밀번호</label> <input type="Password" class="form-control mb-2"
												id="newPw" name="newPw" placeholder="새로운 비밀번호"> <input
												type="Password" class="form-control mb-2" id="confirmNewPw"
												name="confirmNewPw" placeholder="비밀번호 확인">
											<div class='text-muted small' id="infoNewPw">
												<c:choose>
													<c:when
														test="${not empty param.err and not empty modifyValid.samePassword}">
                         이전 비밀번호와 같습니다
                      </c:when>
													<c:when
														test="${not empty param.err and not empty modifyValid.newPassword}">
                         영어,숫자,특수문자 조합의 8글자 이상입니다.
                      </c:when>
													<c:when
														test="${not empty param.err and not empty modifyValid.confirmPassword}">
                         비밀번호가 일치하지 않습니다.
                      </c:when>
												</c:choose>
											</div>
											<button class="btn btn-outline-info" id="btnModifyPw"
												type="submit">비밀번호 변경</button>

										</div>
									</form>
									<hr>
									<form action="javascript:loginFormWithKakao()">
										<div class="form-group">
											<label class="d-block mb-2">카카오 계정 연동</label>
											<c:choose>
												<c:when test="${authentication.kakaoJoin == 'y' }">
													<div class='text-muted small'>카카오 연동이 되어있습니다.</div>
												</c:when>
												<c:otherwise>
													<button class="btn" type="submit">
														<img src="/resources/img/kakaoLogo.png">
													</button>
													<div class='text-muted small'>버튼을 클릭해 카카오아이디로 로그인
														하세요~</div>
												</c:otherwise>
											</c:choose>
										</div>
									</form>
								</div>


								<c:if test="${not empty sessionScope.authMentor }">
									<div class="tab-pane " id="billing">
										<h6>계좌정보</h6>
										<hr>
										<form action="/member/modify-account" method="post">
											<div class="mb-3">
												<label for="accountNum" class="form-label">계좌번호</label> <input
													type="text" class="form-control" id="accountNum"
													value="${authMentor.accountNum}" name="accountNum" required
													placeholder="계좌번호">
												<p class='text-muted small' id="infoCurrPw">- 빼고 입력하세요</p>
												<label for="bankName" class="form-label">은행명</label> <input
													type="text" class="form-control mb-2" id="bankName" required
													name="bankName" value="${authMentor.bank}"
													placeholder="은행명">
												<button class="btn btn-outline-info" type="submit">계좌번호
													변경</button>

											</div>
										</form>
									</div>

								</c:if>

							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
	</div>


	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
	<script src="/resources/js/member/mypage.js"></script>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
	<script type="text/javascript">
	(()=>{if("${authMentor}" != ""){
		var dataArr = ["${authMentor.grade}","${authMentor.major}","${authMentor.wantDay}","${authMentor.wantTime}","${authMentor.requirement}"];
	}else{
		var dataArr = ["${authMentee.major}","${authMentee.grade}"];
	}
	
	var i = 0;
	
	document.querySelectorAll('select').forEach(e =>{
		document.querySelectorAll('#'+e.dataset.sel+' option').forEach(t => {
			console.dir(t.value)
			console.dir(dataArr[i])
			if(t.value == dataArr[i]) t.selected =true;
		})
		i++;
	})})();
	</script>
</body>
</html>
