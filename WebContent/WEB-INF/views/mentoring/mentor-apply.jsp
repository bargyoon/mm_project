<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENTOR & MENTEE - 멘토링 신청</title>
<!-- Bootstrap icons-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
<!-- Core theme CSS (includes Bootstrap)-->
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css'>
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.8.1/css/all.css'>
<link rel='stylesheet' href='https://unicons.iconscout.com/release/v2.1.9/css/unicons.css'>
<link href="/mm/resources/css/mentoring/style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/mm/resources/css/font/style.css">
<link rel="stylesheet" href="/mm/resources/css/mentoring/styles.css">
</head>
<body class="d-flex flex-column h-75">
	<main class="flex-shrink-0">
		<!-- Navigation-->

		<div class="site-mobile-menu site-navbar-target">
			<div class="site-mobile-menu-header">
				<div class="site-mobile-menu-close mt-3">
					<span class="icon-close2 js-menu-toggle"></span>
				</div>
			</div>
			<div class="site-mobile-menu-body"></div>
		</div>

		<div class="site-navbar-wrap">

			<div class="site-navbar site-navbar-target js-sticky-header">
				<div class="container">
					<div class="row align-items-center">
						<div class="col-2">
								<a class="navbar-brand" href="index.html">MENTOR & MENTEE</a>
						</div>
						<div class="col-10" style="display:flex; justify-content: flex-end;">
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
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!-- Section -->
		<section class="pt-6" id="features">
			<div class="container px-5 my-5 py-5">
				<div class="row gx-5">
					<h5 class="fw-bolder px-sm-0 mb-3 pb-2" style="border-bottom: solid 2px gray;">멘토링 신청하기</h5>
				</div>
				<div class="row gx-5 pt-5 justify-content-md-around">
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0 text-sm-center">희망 학과 선택</h5>
						<hr>
						<form action="/mentoring/apply-mentoring">
							<div class="fw-bolder mb-0 py-3 small offcanvas-header">
								<span>1. 학교 유형</span>
								<span>*중복선택가능</span>
							</div>
							<div class="offcanvas-header">
								<label class=""><input class="me-md-1" type="checkbox" name="school_type" value="all">전체</label>
								<label class="px-sm-3"><input class="me-md-1" type="checkbox" name="school_type" value="university">대학교</label>
								<label class="px-sm-3"><input class="me-md-1" type="checkbox" name="school_type" value="college">전문대</label>
							</div>
							<hr>
							<div class="fw-bolder mb-0 py-3 small offcanvas-header">
								<span>2. 전공 계열</span>
								<span>*중복선택가능</span>
							</div>
							<div class="offcanvas-header">
								<label><input class="me-md-1" type="radio" name="major_type" value="all">전체</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="humanities">인문계열</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="education">교육계열</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="Engineering">공학계열</label>
							</div>						
							<div class="offcanvas-header">
								<label><input class="me-md-1" type="radio" name="major_type" value="society">사회계열</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="nature">자연계열</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="anp">예체능계열</label>
								<label><input class="me-md-1" type="radio" name="major_type" value="medicine">의약계열</label>
							</div>
							<div class="offcanvas-header">
								<h3>1/3</h3>
								<input class="btn btn-primary-dark btn-lg px-4 me-sm-3 fw-bolder" type="button" value="다음">
							</div>
						</form>
					</div>
					<div class="col-lg-5 mb-5 mb-lg-5 navbar-nav-scroll">
						<h5 class="fw-bolder mb-0 text-sm-center">계열 안내</h5>
						<hr>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">1. 인문계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">2. 교육계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">3. 공학계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">4. 사회계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">5. 자연계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">6. 예체능계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
						<div class="mb-0 py-3 small list-group">
							<span class="fw-bolder">7. 의약계열</span>
							<span class="pt-2">인문계열은 모든 학문의 근본이 되는 인문학의 교육과 연구를 목표로 합니다.<br>인문계열은 인간과 인간의 문화, 인간의 가치와 인간의 자기표현 능력을
								바르게 이해하기 위한 과학적인 연구 방법에 관심을 갖고 있습니다.
							</span>
						</div>
					</div>
				</div>
			</div>
		</section>
	</main>
	<!-- Footer-->
	<footer class="bg-dark py-4 mt-auto">
		<div class="container px-5">
			<div
				class="row align-items-center justify-content-between flex-column flex-sm-row">
				<div class="col-auto">
					<div class="small m-0 text-white">Copyright &copy; Your
						Website 2021</div>
				</div>
				<div class="col-auto">
					<a class="link-light small" href="#!">Privacy</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Terms</a> <span
						class="text-white mx-1">&middot;</span> <a
						class="link-light small" href="#!">Contact</a>
				</div>
			</div>
		</div>
	</footer>
	
	
		<script src="/mm/resources/js/main/jquery-3.3.1.min.js"></script>
		<script src="/mm/resources/js/main/bootstrap.min.js"></script>
		<script src="/mm/resources/js/main/jquery.sticky.js"></script>
		<script src="/mm/resources/js/main/main.js"></script>
	

</body>
</html>