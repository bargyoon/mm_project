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
							<div class="profile">
								<img
									src="https://footballk.net/w/images/thumb/3/39/%ED%99%8D%EA%B8%B8%EB%8F%99.jpg/300px-%ED%99%8D%EA%B8%B8%EB%8F%99.jpg"
									class="card-img-top img-fluid rounded-circle" alt
									style="margin: 15px auto; width: 120px; display: block">
								<h1 class="text-light">${authentication.userName}</h1>
							</div>
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
									<form action="/member/modify-mentor">
										<div class="mb-3">
											<label for="userName" class="form-label">이름</label>

											<input type="text" class="form-control"
												id="userName" name="userName"
												value="${authentication.userName}"> <small
												class="form-text text-muted">Please Enter your
												fullname</small>

										</div>
										<div class="mb-3">
											<label for="email" class="form-label">email</label>

											<input type="text" class="form-control"
												id="email"  name="email"
												value="${authentication.email}">

										</div>
										<div class="mb-3">
											<label for="phone" class="form-label">핸드폰</label>

											<input type="text" class="form-control"
												id="phone"  name="phone"
												value="${authentication.phone}">

										</div>
										<div class="mb-3">
											<label for="address" class="form-label">주소</label>

											<input type="text" class="form-control"
												id="address"  name="address"
												value="${authentication.address}">

										</div>
										<div class="mb-3">
											<label for="university" class="form-label">학교</label>

											<input type="text" class="form-control"
												id="university"  name="university"
												value="${authMentor.universityName}">

										</div>
										<div class="mb-3">
											<label for="grade" class="form-label">학년</label> <select data-sel="grade"
												class="form-control" id="grade" name="grade">
												<option disabled>현재 학년</option>
												<option value="1">1학년</option>
												<option value="2">2학년</option>
												<option value="3">3학년</option>
												<option value="4">4학년</option>
											</select>
										</div>
										<div class="mb-3">
											<label for="major" class="form-label">전공계열</label> <select data-sel="major"
												class="form-control" id="major" name="major">
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
											<label for="wantDay" class="form-label">원하는 요일</label> <select data-sel="wantDay"
												class="form-control" id="wantDay" name="wantDay">
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
											<label for="wantTime" class="form-label">원하는 시간</label> <select data-sel="wantTime"
												class="form-control" id="wantTime" name="wantTime">
												<option disabled>희망 시간</option>
												<option value="am">오전(09:00 ~ 12:00)</option>
												<option value="pm">오후(12:00 ~ 17:00)</option>
												<option value="evening">저녁(17:00 ~ 21:00)</option>
												<option value="all">무관</option>
											</select>
										</div>
										<div class="mb-3"> 
											<label for="requirement" class="form-label">요구사항</label> <select data-sel="requirement"
												class="form-control" id="requirement" name="requirement">
												<option disabled>원하는 진행방식</option>
												<option value="videoChat">비대면(화상채팅)</option>
												<option value="myTown">멘토의 동네에서 대면 수업</option>
												<option value="yourTown">멘티의 동네에서 대면 수업</option>
												<option value="rentalSpace">카페나 스터디룸 대여희망</option>
											</select>
										</div>

										<div class="mb-3">
											<label for="exampleFormControlTextarea1" class="form-label">이력사항</label>
											<div class='myHistory' id="exampleFormControlTextarea1">
												<c:forTokens items="${authMentor.history}" delims=","
													var="hist">
													<div>-${hist}</div>
												</c:forTokens>
											</div>
										</div>

										<div class="form-group " id="histories">
											<div class="form-text text-muted small">
												이력사항을 추가하시려면 오른쪽 +버튼을 눌러 추가하시면 됩니다.<a
													class="btn btn-outline-warning btn-sm ml-2" id="btnHistory">+</a>
											</div>
										</div>
										<br>
										<button class="btn btn-outline-info" type="submit">Update
											Profile</button>
										<button class="btn btn-outline-info" type="reset"
											id="resetBtn">Reset Changes</button>
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
											<button class="btn btn-outline-info" type="submit">Enable
												two-factor authentication</button>
											<p class='text-muted small'>여기에 아마 카카오랑 네이버 로그인 연동하는거 하지
												않을까 싶습니다.</p>
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

	<script type="text/javascript">
(() =>{
	var dataArr = ["${authMentor.grade}","${authMentor.major}","${authMentor.wantDay}","${authMentor.wantTime}","${authMentor.requirement}"];
	var i = 0;
	
	document.querySelectorAll('select').forEach(e =>{
		document.querySelectorAll('#'+e.dataset.sel+' option').forEach(t => {
			if(t.value == dataArr[i]) t.selected =true;
		})
		i++;
	})
	
	
})();

let cnt = 1;
let div = document.createElement('div');
document.querySelector('#btnHistory').addEventListener('click', (e) =>{
	
	
	
	
	let input = document.createElement('input');

	
		div.className = "hsDiv";
		input.className = "form-control mt-2";
		input.id = "history"+cnt;
		input.name = "history";
		input.placeholder="이력사항을 적어주세요";
		div.append(input);
		
		if(cnt == 1){
			document.querySelector('#histories').append(div)
		}
		
		
			
		
		cnt++;
		
	
})


document.querySelector('#resetBtn').addEventListener('click', (e) =>{
	div.innerHTML = "";
})



</script>

	<%@ include file="/WEB-INF/views/include/footer.jsp"%>
	<%@ include file="/WEB-INF/views/include/jsFiles.jsp"%>
</body>
</html>