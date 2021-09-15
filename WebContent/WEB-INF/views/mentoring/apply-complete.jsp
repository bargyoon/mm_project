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
<link href="/mm/resources/css/common/style.css" rel="stylesheet" />
<link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
	crossorigin="anonymous" />
<link href="https://fonts.googleapis.com/css?family=Quicksand:400,600,700&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/mm/resources/css/font/style.css">

<!-- Style -->
<link rel="stylesheet" href="/mm/resources/css/common/styles.css">
</head>
<body class="d-flex flex-column h-100">
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
		<!-- .site-mobile-menu -->


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
		<!-- Header-->
		<header class="bg-dark py-5">
			<div class="container px-5" style="margin-top: 5%">
				<div class="row gx-5 align-items-center justify-content-center">
					<div class="col-lg-8 col-xl-7 col-xxl-6">
						<div class="my-5 text-center text-xl-start">
							<h1 class="display-5 fw-bolder text-white mb-3">
								선배가 직접 들려주는 <br>자신의 이야기
							</h1>
							<p class="lead fw-bolder mb-5"
								style="border: solid 2px gray; color: white; padding-top: 2%; padding-bottom: 2%">
								자신에게 맞는 선배를 찾아 멘토링을 받아보세요<br> 전보다 <span
									class="shadow-dark-1" style="color: orange;">더 빠르게 높은
									곳으로</span> 갈수 있을 거예요
							</p>
							<div class="d-grid gap-3 d-sm-flex justify-content-sm-center">
								<a class="btn btn-primary btn-lg px-4 me-sm-3 fw-bolder"
									href="#features" style="box-shadow: 4px 3px 3px black">멘토링
									신청하기</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</header>
		<!-- Features section-->
		<section class="py-3" id="features">
			<div class="container px-5 my-5 ">
				<div class="row gx-5">
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0" style="text-decoration: underline;">Mentor-Mentee
							연결</h5>
						<h3 class="fw-bolder mb-0 shadow-gray-2" style="margin-top: 0;">
							<span style="background-color: orange; color: white;">M&M</span>은
							사용자의 조건에 맞는<br>Mentor를 연결해줍니다.
						</h3>
						<h6 class="fw-bolder mb-0" style="margin-top: 2%; color: gray;">
							학교, 학과, 원하는 조언 등<br>다양한 조건을 선택해 멘토를 선택할 수 있어요.
						</h6>
					</div>
				</div>
				<div>
					<img src="/mm/resources/img/main3.jpg" class="img-fluid img-main">
				</div>
			</div>
		</section>

		<section class="bg-dark py-5" id="features">
			<div class="container px-5 my-5 ">
				<div class="row gx-5">
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0"
							style="text-decoration: underline; color: white;">Check
							Detail</h5>
						<h3 class="fw-bolder mb-0 shadow-dark-2"
							style="margin-top: 0; color: white;">
							마음에 드는 멘토를 <span style="background-color: orange;">클릭</span>해<br>
							멘토의 <span style="background-color: orange;">상세이력</span>을 보고 결정하세요
							!
						</h3>
						<h6 class="fw-bolder mb-0"
							style="margin-top: 2%; color: rgb(224, 224, 224);">
							간소화된 멘토정보를 클릭하면<br>멘토의 상세이력을 확인 할 수 있습니다.
						</h6>
					</div>
				</div>
				<div>
					<img src="/mm/resources/img/main1.jpg" class="img-fluid img-main">
				</div>
			</div>
		</section>


		<section class="py-5" id="features">
			<div class="container px-5 my-5">
				<div class="row gx-5">
					<div class="col-lg-5 mb-5 mb-lg-5">
						<h5 class="fw-bolder mb-0" style="text-decoration: underline;">Free
							Chat</h5>
						<h3 class="fw-bolder mb-0 shadow-gray-2" style="margin-top: 0;">
							멘토가 마음에 든다면<br>
							<span style="background-color: orange; color: white;">무료
								채팅 상담</span>으로<br> 멘토 진행 방식에 대해 알아보세요 !
						</h3>
						<h6 class="fw-bolder mb-0" style="margin-top: 2%; color: gray;">
							무료채팅 상담으로<br>멘토선택에 도움을 받으세요.
						</h6>
					</div>
				</div>
				<div>
					<img src="/mm/resources/img/main2.jpg" class="img-fluid img-main">
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