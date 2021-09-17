<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MENTOR & MENTEE - 멘토링 신청</title>

<link rel="stylesheet" href="/resources/css/mentoring/calender.css">
<%@ include file="/WEB-INF/views/include/head.jsp" %>

</head>
<body class="d-flex flex-column h-75">
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
	<main class="flex-shrink-0">
		<!-- Section -->
		<section class="pt-5">
			<div class="container px-5 mt-5 pt-5">
				<div class="row gx-5">
					<h5 class="fw-bolder px-sm-0 mb-3 pb-2" style="border-bottom: solid 2px gray;">멘토링 리스트</h5>
					<div class="fw-bolder mb-0 py-2 small offcanvas-header">
						<span></span>
						<span style="font-size: 11px">${sessionScope.authentication} 님의 선택에 따른 추천 멘토 리스트 입니다.</span>
					</div>
				</div>
			</div>
		</section>
		
		<section class="py-3">
	        <div class="container px-5 my-5">
	            <div class="row gx-5 justify-content-center">
	                <div class="col-lg-8 col-xl-6">
	                    <div class="text-center">
	                        <h2 class="fw-bolder fw-normaltext-muted mb-5 montor-of-month" style="color:#bf9667"></h2>
	                    </div>
	                </div>
	            </div>
	            <div class="row gx-5">
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">${sessionScope.authentication} 멘토</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Blog post title</h5></a>
	                            <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Kelly Rowan</div>
	                                        <div class="text-muted">March 12, 2021 &middot; 6 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Another blog post title</h5></a>
	                            <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Josiah Barclay</div>
	                                        <div class="text-muted">March 23, 2021 &middot; 4 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">The last blog post title is a little bit longer than the others</h5></a>
	                            <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Evelyn Martinez</div>
	                                        <div class="text-muted">April 2, 2021 &middot; 10 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </section>
        
        <hr>
        <section class="py-3">
	        <div class="container px-5 my-5">
	            <div class="row gx-5 justify-content-center">
	                <div class="col-lg-8 col-xl-6">
	                    <div class="text-center">
	                        <h2 class="fw-bolder">추천 멘토</h2>
	                        <p class="lead fw-normal text-muted mb-5"></p>
	                    </div>
	                </div>
	            </div>
	            <div class="row gx-5">
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/ced4da/6c757d" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">멘토 ${sessionScope.authentication}</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Blog post title</h5></a>
	                            <p class="card-text mb-0">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Kelly Rowan</div>
	                                        <div class="text-muted">March 12, 2021 &middot; 6 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/adb5bd/495057" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">Media</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">Another blog post title</h5></a>
	                            <p class="card-text mb-0">This text is a bit longer to illustrate the adaptive height of each card. Some quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Josiah Barclay</div>
	                                        <div class="text-muted">March 23, 2021 &middot; 4 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	                <div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">The last blog post title is a little bit longer than the others</h5></a>
	                            <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Evelyn Martinez</div>
	                                        <div class="text-muted">April 2, 2021 &middot; 10 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	               	<div class="col-lg-4 mb-5">
	                    <div class="card h-100 shadow border-0">
	                        <img class="card-img-top" src="https://dummyimage.com/600x350/6c757d/343a40" alt="..." />
	                        <div class="card-body p-4">
	                            <div class="badge bg-primary bg-gradient rounded-pill mb-2">News</div>
	                            <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">The last blog post title is a little bit longer than the others</h5></a>
	                            <p class="card-text mb-0">Some more quick example text to build on the card title and make up the bulk of the card's content.</p>
	                        </div>
	                        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
	                            <div class="d-flex align-items-end justify-content-between">
	                                <div class="d-flex align-items-center">
	                                    <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
	                                    <div class="small">
	                                        <div class="fw-bold">Evelyn Martinez</div>
	                                        <div class="text-muted">April 2, 2021 &middot; 10 min read</div>
	                                    </div>
	                                </div>
	                            </div>
	                        </div>
	                    </div>
	                </div>
	            </div>
	        </div>
        </section>
	</main>
	<!-- Footer-->
	<footer class="py-4 mt-auto" style="background-color: #343a40">
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
		
<script src="/resources/js/mentoring/mentor-list.js"></script>
<%@ include file="/WEB-INF/views/include/jsFiles.jsp" %>
	

</body>
</html>