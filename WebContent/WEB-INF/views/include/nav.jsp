<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

</head>
<body>

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
						<div class="col-5">

							<a class="navbar-brand" href="${contextPath}/index">MENTOR & MENTEE</a>

						</div>
						<div class="col-7"
							style="display: flex; justify-content: flex-end;">
							<nav class="site-navigation text-right" role="navigation">
								<div class="container">
									<div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3">
										<a href="#" class="site-menu-toggle js-menu-toggle text-white"><span
											class="icon-menu h3"></span></a>
									</div>

									<ul class="site-menu main-menu js-clone-nav d-none d-lg-block">

										<li><a href="${contextPath}/mentoring/apply-page" class="nav-link">멘토신청</a></li>
										<li><a href="${contextPath}/mentoring/manage" class="nav-link">멘토링
												관리</a></li>
										<li class="has-children"><a href="#" class="nav-link">게시판</a>
											<ul class="dropdown arrow-top" style="text-align: center;">
												<li><a href="${contextPath}/board/mentor" class="nav-link">멘토
														게시판</a></li>
												<li><a href="${contextPath}/board/mentee" class="nav-link">멘티
														게시판</a></li>


											</ul></li>

										<li><a href="${contextPath}/todo/main" class="nav-link">일정관리</a></li>

										<!-- 로그인 후 바뀌는 내비바 변경사항 -->

										<c:choose>
											<c:when test="${sessionScope.authentication eq null}">
												<li><a href="${contextPath}/member/login-form" class="nav-link">로그인</a></li>

												<li class="has-children"><a href="#" class="nav-link">회원가입</a>
													<ul class="dropdown arrow-top" style="text-align: center;">
														<li><a href="${contextPath}/member/join-form-mentor"
															class="mentor-join">멘토 가입</a></li>
														<li><a href="${contextPath}/member/join-form-mentee"
															class="mentee-join">멘티 가입</a></li>
													</ul></li>
											</c:when>
											<c:otherwise>
												
												<li class="has-children"><a href="#" class="profile">${sessionScope.authentication}</a>
													<ul class="dropdown arrow-top" style="text-align: center;">
														<li><a href="${contextPath}/member/mypage"
															class="mypage">마이페이지</a></li>
														<li><a href="${contextPath}/member/logout"
															class="logout">로그아웃</a></li>
													</ul></li>
											</c:otherwise>
										</c:choose>
									</ul>
								</div>
							</nav>
						</div>
					</div>
				</div>
			</div>
		</div>
</body>
</html>