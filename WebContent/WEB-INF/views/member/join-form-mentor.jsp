<%@ page language="java" contentType="text/html; charset=UTF-8"
<<<<<<< HEAD
	pageEncoding="UTF-8"%>
=======
   pageEncoding="UTF-8"%>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MM 멘토 가입 페이지</title>
<%@ include file="/WEB-INF/views/include/head.jsp"%>
<link rel="stylesheet" href="/resources/css/member/join-form.css">
</head>
<<<<<<< HEAD
<body style="height: 100vh">
=======
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
	<%@ include file="/WEB-INF/views/include/nav.jsp"%>

	<div class="container pt-6">
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

						<!-- UserId -->
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

						<!-- Password -->
						<div class="input-group col-lg-6 mb-4">
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
						<div class="input-group col-lg-6 mb-4">
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
=======
<body style="height: 100vh">

   <%@ include file="/WEB-INF/views/include/nav.jsp"%>

   <div class="container" style="padding-top: 100px">

      <!-- Registeration Form -->
      <div class="col-md-7 col-lg-6 m-auto">
            <form action="/member/join-mentor" method="post">
               <div class="row" style="padding: 22px;">

                  <!-- Name -->
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-user text-muted"></i>
                        </span>
                     </div>
                     <input id="userName" type="text" name="userName" placeholder="이름"
                        <c:if test="${not empty param.err and empty joinValid.userName}">
                            value="${joinForm.userName}"
                                  </c:if>
                        required class="form-control bg-white border-left-0 border-md">
                  </div>

                  <!-- UserId -->
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git


<<<<<<< HEAD
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
								class="form-control bg-white border-left-0 border-md">
						</div>
						<!-- Gender -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								</span>
							</div>
							<div id="email" name="email" placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md"
								style="max-width: 80px; display: flex; align-content: center; flex-wrap: wrap; justify-content: flex-start;">성별</div>
							<div
								style="display: flex; justify-content: space-around; align-content: center; flex-wrap: wrap;"
								class="form-control bg-white border-left-0 border-md h-70 font-weight-bold">
								<div>
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" checked="" required=""> <label
										class="form-check-label" for="credit">남 </label>
								</div>
								<div>
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required=""> <label
										class="form-check-label" for="debit">여</label>
								</div>
=======
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-user text-muted"></i>
                        </span>
                     </div>
                     <input id="userId" type="text" name="userId" placeholder="아이디"
                        required class="form-control bg-white border-left-0 border-md"
                        <c:if test="${not empty param.err and empty joinValid.userId}">
                            value="${joinForm.userId}"
                                  </c:if>>
                     <button class="checkIdBtn">중복검사</button>
                  </div>
                  <span class="valid-msg" id="idCheck"> </span>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
=======
                  <!-- Password -->
                  <div class="input-group col-lg-6 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-lock text-muted"></i>
                        </span>
                     </div>
                     <input id="password" type="password" name="password" required
                        <c:if test="${not empty param.err and empty joinValid.password}">
                         value="${joinForm.password}"
                            </c:if>
                        placeholder="비밀번호"
                        class="form-control bg-white border-left-0 border-md">
                  </div>
                  
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
							</div>
						</div>
=======
                  <!-- Password Confirmation -->
                  <div class="input-group col-lg-6 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-lock text-muted"></i>
                        </span>
                     </div>
                     <input id="passwordConfirmation" type="password"
                        name="passwordConfirmation" placeholder="비밀번호 확인" required
                        class="form-control bg-white border-left-0 border-md">
                  </div>
                  <span id="pwCheck" class="valid-msg"> 
                  <c:choose><c:when test="${not empty param.err and not empty joinValid.password}">
                         영어,숫자,특수문자 조합의 8글자 이상입니다.
                      </c:when>
                      <c:when test="${not empty param.err and not empty joinValid.passwordConfirmation}">
                         비밀번호가 일치하지 않습니다.
                      </c:when>
                      </c:choose>
                  </span>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
						<!-- Address -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="주소"
								class="form-control bg-white border-left-0 border-md">
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
=======
                  <!-- Email Address -->
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-envelope text-muted"></i>
                        </span>
                     </div>
                     <input id="email" type="email" name="email" placeholder="이메일"
                     <c:if test="${not empty param.err and empty joinValid.email}">
                            value="${joinForm.email}"
                                  </c:if>
                        required class="form-control bg-white border-left-0 border-md">
                  </div>
                  <!-- Gender -->
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fas fa-venus-mars text-muted"></i>
                        </span>
                     </div>
                     <div id="gender" name="gender" placeholder="성별"
                        class="form-control bg-white border-left-0 border-md text-muted"
                        style="max-width: 80px; display: flex; align-content: center; flex-wrap: wrap; justify-content: flex-start;">성별</div>
                     <div
                        style="display: flex; justify-content: space-around; align-content: center; flex-wrap: wrap;"
                        class="form-control bg-white border-left-0 border-md h-70 font-weight-bold">
                        <div>
                           <input type="radio" id="gender-radio" name="gender-radio"
                              value="male" class="form-check-input" checked> <label
                              class="form-check-label" for="male">남 </label>
                        </div>
                        <div>
                           <input id="gender-radio" name="gender-radio" type="radio"
                              value="female" class="form-check-input"> <label
                              class="form-check-label" for="female">여</label>
                        </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git


<<<<<<< HEAD
						<!-- Nickname -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="닉네임"
								class="form-control bg-white border-left-0 border-md">
						</div>
=======
                     </div>
                  </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
=======
                  <!-- Address -->
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fas fa-home text-muted"></i>
                        </span>
                     </div>
                     <input id="address" type="text" name="address" placeholder="주소"
                        <c:if test="${not empty param.err and empty joinValid.address}">
                            value="${joinForm.address}"
                                  </c:if>
                        required class="form-control bg-white border-left-0 border-md">
                  </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
						<!-- Divide Line -->
						<div
							class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom " style="width: 40%;"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted"
								style="width: 20%;">대학교 정보</span>
							<div class="border-bottom " style="width: 40%;"></div>
						</div>
=======
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
                        <option value="010">010</option>
                        <option value="011">011</option>
                        <option value="019">019</option>
                        <option value="017">017</option>
                     </select> <input id="phone" type="tel" name="phone"
                        placeholder="전화번호(-빼고 입력)" required
                        <c:if test="${not empty param.err and empty joinValid.phone}">
                value="${joinForm.phone}"
                </c:if>
                        class="form-control bg-white border-md border-left-0 pl-3">
                  </div>
                  <span id="tellCheck" class="valid-msg">
                <c:if test="${not empty param.err and not empty joinValid.phone}">
                   휴대폰 번호는 9-11자리의 숫자입니다.
                </c:if>
                </span>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
						<!-- College name -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="passwordConfirmation" type="text"
								name="passwordConfirmation" placeholder="재학중인 대학명"
								class="form-control bg-white border-left-0 border-md">
						</div>
=======
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
						<!-- Grade -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-envelope text-muted"></i>
								</span>
							</div>
							<div id="email" name="email" placeholder="Email Address"
								class="form-control bg-white border-left-0 border-md"
								style="max-width: 80px; display: flex; align-content: center; flex-wrap: wrap; justify-content: flex-start;">학년</div>
							<div
								style="display: flex; justify-content: space-around; align-content: center; flex-wrap: wrap;"
								class="form-control bg-white border-left-0 border-md h-70 font-weight-bold">
								<div>
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" checked="" required=""> <label
										class="form-check-label" for="credit">1학년 </label>
								</div>
								<div>
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required=""> <label
										class="form-check-label" for="debit">2학년</label>
								</div>
								<div>
									<input id="credit" name="paymentMethod" type="radio"
										class="form-check-input" checked="" required=""> <label
										class="form-check-label" for="credit">3학년 </label>
								</div>
								<div>
									<input id="debit" name="paymentMethod" type="radio"
										class="form-check-input" required=""> <label
										class="form-check-label" for="debit">4학년</label>
								</div>
=======
                  <!-- Nickname -->
                  <div class="input-group col-lg-12 mb-4">
                     <div class="input-group-prepend">
                        <span
                           class="input-group-text bg-white px-4 border-md border-right-0">
                           <i class="fa fa-user text-muted"></i>
                        </span>
                     </div>
                     <input id="nickname" type="text" name="nickname"
                        placeholder="닉네임"
                        <c:if test="${not empty param.err and empty joinValid.nickname}">
                            value="${joinForm.nickname}"
                                  </c:if>
                        class="form-control bg-white border-left-0 border-md">
                  </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
=======
               <!-- Divide Line -->
               <div
                  class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                  <div class="border-bottom " style="width: 40%;"></div>
                  <span class="px-2 small text-muted font-weight-bold text-muted"
                     style="width: 20%;">대학교 정보</span>
                  <div class="border-bottom " style="width: 40%;"></div>
               </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD
							</div>
						</div>
=======
               <!-- 대학명 -->
               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-school text-muted"></i>
                     </span>
                  </div>
                  <input id="universityName" type="text" name="universityName" required
                     placeholder="재학중인 대학명"
                     class="form-control bg-white border-left-0 border-md">
               </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git

<<<<<<< HEAD

						<!-- Major -->

						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-lock text-muted"></i>
								</span>
							</div>
							<input id="password" type="password" name="password"
								placeholder="전공명"
								class="form-control bg-white border-left-0 border-md">
						</div>

						<!-- Divide Line -->
						<div
							class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
							<div class="border-bottom " style="width: 35%;"></div>
							<span class="px-2 small text-muted font-weight-bold text-muted"
								style="width: 30%;">멘토링 요청사항</span>
							<div class="border-bottom " style="width: 35%;"></div>
						</div>
						
						<!-- Want day -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">희망 요일</option>
								<option value="">월요일</option>
								<option value="">화요일</option>
								<option value="">수요일</option>
								<option value="">목요일</option>
								<option value="">금요일</option>
								<option value="">토요일</option>
								<option value="">일요일</option>
								<option value="">무관</option>
							</select>
						</div>
						
							<!-- Want Time -->
						<div class="input-group col-lg-6 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">희망 시간</option>
								<option value="">오전(09:00 ~ 12:00)</option>
								<option value="">오후(12:00 ~ 17:00)</option>
								<option value="">저녁(17:00 ~ 21:00)</option>
								<option value="">무관</option>
							</select>
						</div>

						<!-- Want Process -->
						<div class="input-group col-lg-12 mb-4">
							<div class="input-group-prepend">
								<span
									class="input-group-text bg-white px-4 border-md border-right-0">
									<i class="fa fa-black-tie text-muted"></i>
								</span>
							</div>
							<select id="job" name="jobtitle"
								class="form-control custom-select bg-white border-left-0 border-md">
								<option value="">원하는 진행방식</option>
								<option value="">비대면(화상채팅)</option>
								<option value="">멘토의 동네에서 대면 수업</option>
								<option value="">카페나 스터디룸 대여희망</option>
								<option value="">기타</option>
							</select>
						</div>
						
						<!-- 이력사항 -->
						
						<div class="pl-lg-4">
                  <div class="form-group focused">
                    <label>이력사항</label>
                    <textarea rows="4" class="form-control form-control-alternative" placeholder="A few words about you ...">A beautiful Dashboard for Bootstrap 4. It is Free and Open Source.</textarea>
                  </div>
                </div>
=======
               <!-- 대학 종류 -->
               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-school text-muted"></i>
                     </span>
                  </div>
                  <select id="universityType" name="universityType" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>학교 유형</option>
                     <option value="university">대학교</option>
                     <option value="college">전문대</option>
                  </select>
               </div>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git


<<<<<<< HEAD
						<!-- Submit Button -->
						<div class="form-group col-lg-12 mx-auto mb-0">
							<a href="#" class="btn btn-primary btn-block py-2"> <span
								class="font-weight-bold">Create your account</span>
							</a>
						</div>



						<!-- Already Registered -->
						<div class="text-center w-100">
							<p class="text-muted font-weight-bold">
								이미 회원이신가요? <a href="/member/login-form" class="text-primary ml-2">Login</a>
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
=======
               <!-- 현재학년 -->
               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-user-graduate text-muted"></i>
                     </span>
                  </div>
                  <select id="grade" name="grade" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>현재 학년</option>
                     <option value="1">1학년</option>
                     <option value="2">2학년</option>
                     <option value="3">3학년</option>
                     <option value="4">4학년</option>
                  </select>
               </div>

               <!-- 전공 계열 -->

               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-university text-muted"></i>
                     </span>
                  </div>
                  <select id="major" name="major" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>전공 계열</option>
                     <option value="humanities">인문계열</option>
                     <option value="education">교육계열</option>
                     <option value="engineering">공학계열</option>
                     <option value="society">사회계열</option>
                     <option value="nature">자연계열</option>
                     <option value="anp">예체능계열</option>
                     <option value="medicine">의약계열</option>
                  </select>
               </div>

               <!-- Divide Line -->
               <div
                  class="form-group col-lg-12 mx-auto d-flex align-items-center my-4">
                  <div class="border-bottom " style="width: 35%;"></div>
                  <span class="px-2 small text-muted font-weight-bold text-muted"
                     style="width: 30%;">멘토링 요청사항</span>
                  <div class="border-bottom " style="width: 35%;"></div>
               </div>

               <!-- Want day -->
               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-calendar-day text-muted"></i>
                     </span>
                  </div>
                  <select id="wantDay" name="wantDay" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>희망 요일</option>
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

               <!-- Want Time -->
               <div class="input-group col-lg-6 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-clock text-muted"></i>
                     </span>
                  </div>
                  <select id="wantTime" name="wantTime" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>희망 시간</option>
                     <option value="am">오전(09:00 ~ 12:00)</option>
                     <option value="pm">오후(12:00 ~ 17:00)</option>
                     <option value="evening">저녁(17:00 ~ 21:00)</option>
                     <option value="all">무관</option>
                  </select>
               </div>

               <!-- requirement -->
               <div class="input-group col-lg-12 mb-4">
                  <div class="input-group-prepend">
                     <span
                        class="input-group-text bg-white px-4 border-md border-right-0">
                        <i class="fas fa-atom text-muted"></i>
                     </span>
                  </div>
                  <select id="requirement" name="requirement" required
                     class="form-control custom-select bg-white border-left-0 border-md">
                     <option selected disabled>원하는 진행방식</option>
                     <option value="videoChat">비대면(화상채팅)</option>
                     <option value="myTown">멘토의 동네에서 대면 수업</option>
                     <option value="yourTown">멘티의 동네에서 대면 수업</option>
                     <option value="rentalSpace">카페나 스터디룸 대여희망</option>
                  </select>
               </div>

               <!-- 이력사항 -->

               <div class="pl-lg-4">
                  <div class="form-group focused">
                     <label>이력사항</label>
                     <textarea rows="4" class="form-control form-control-alternative"
                        id='history' name="history" placeholder="이력사항을 적어주세요~"></textarea>
                  </div>
               </div>


               <!-- Submit Button -->
               <div class="form-group col-lg-12 mx-auto mb-0">
                  <input type="submit" class="btn btn-primary btn-block py-2">
                  <span class="font-weight-bold" value="계정 생성"></span>


               </div>



               <!-- Already Registered -->
               <div class="text-center w-100">
                  <p class="text-muted font-weight-bold">
                     이미 회원이신가요? <a href="/member/login-form" class="text-primary ml-2">Login</a>
                  </p>
               </div>

            </div>
         </form>
      </div>
   </div>
   <%@ include file="/WEB-INF/views/include/footer.jsp"%>
   <%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
   <script type="text/javascript" src="/resources/js/member/joinForm.js"></script>
>>>>>>> branch 'main' of https://github.com/bargyoon/mm_project.git
</body>
</html>