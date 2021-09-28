package mm.member.controller;

import java.io.IOException;
import java.lang.reflect.Array;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.member.model.dto.Member;
import mm.member.model.dto.Mentee;
import mm.member.model.dto.Mentor;
import mm.member.model.service.MemberService;

/**
 * Servlet implementation class MemberController
 */
@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "login-form":
			loginForm(request, response);
			break;
		case "login":
			login(request, response);
			break;
		case "logout":
			logout(request, response);
			break;
		case "forget-password":
			forgetPassword(request, response);
			break;

		case "join-form-mentor":
			joinFormMentor(request, response);
			break;
		case "join-form-mentee":
			joinFormMentee(request, response);
			break;
		case "join-mentee":
			joinMentee(request, response);
			break;
		case "join-mentor":
			joinMentor(request, response);
			break;
		case "join-impl":
			joinImpl(request, response);
			break;
		case "join-rule":
			joinRule(request, response);
			break;
		case "id-check":
			checkID(request, response);
			break;
		case "modify-mentor":
			modifyMentor(request, response);
			break;
		case "confirm-pw":
			confirmPassword(request, response);
			break;
		case "mypage":
			mypage(request, response);
			break;
		case "mentor-info":
			mentorInfoForm(request, response);
			break;

		default:

		}

	}

	private void modifyMentor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String address = request.getParameter("address");
		String universityName = request.getParameter("university");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String wantDay = request.getParameter("wantDay");
		String wantTime = request.getParameter("wantTime");
		String requirement = request.getParameter("requirement");
		String[] historyArr = request.getParameterValues("history");
		Member member = (Member) request.getSession().getAttribute("authentication");
		Mentor mentor = (Mentor) request.getSession().getAttribute("authMentor");
		String history = mentor.getHistory();

		System.out.println(userName);
		
		member.setUserName(userName);
		member.setEmail(email);
		member.setAddress(address);
		member.setPhone(phone);

		mentor.setUniversityName(universityName);
		mentor.setGrade(Integer.parseInt(grade));
		mentor.setMajor(major);
		mentor.setWantDay(wantDay);
		mentor.setWantTime(wantTime);
		mentor.setRequirement(requirement);
		if (historyArr != null) {
			
		
			for (int i = 0; i < historyArr.length; i++) {

				history += ("," + historyArr[i]);

			}
			mentor.setHistory(history);
		} 

		if (memberService.modifyMentor(member, mentor) != 0) {
			System.out.println("수정완료");
		}
		request.getRequestDispatcher("/member/mypage").forward(request, response);
	}

	private void joinRule(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/join-rule").forward(request, response);

	}

	private void mentorInfoForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int mentorIdx = Integer.parseInt(request.getParameter("user_idx"));
		Member member = null;
		Mentor mentor = null;
		member = memberService.selectMemberByIdx(mentorIdx);

		mentor = memberService.selectMentorByRole(member);
		request.getSession().setAttribute("mentorInfo", mentor);

		request.getSession().setAttribute("userInfo", member);

		request.getRequestDispatcher("/member/mentor-info").forward(request, response);

	}

	private void forgetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/forget-password").forward(request, response);
	}

	private void confirmPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/confirm-pw").forward(request, response);

	}

	private void mypage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.getRequestDispatcher("/member/mypage").forward(request, response);

	}

	private void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("authentication");
		response.sendRedirect("/index");
	}

	private void checkID(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userId = request.getParameter("userId");

		Member member = memberService.selectMemberById(userId);

		if (member == null) {
			response.getWriter().print("available");
		} else {
			response.getWriter().print("disable");
		}

	}

	private void joinMentee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		/*
		 * String userId = request.getParameter("userId"); String password =
		 * request.getParameter("password"); String tell = request.getParameter("tell");
		 * String email = request.getParameter("email");
		 * 
		 * Member member = new Member(); member.setUserId(userId);
		 * member.setPassword(password); member.setTell(tell); member.setEmail(email);
		 * 
		 * String persistToken = UUID.randomUUID().toString();
		 * request.getSession().setAttribute("persistUser", member);
		 * request.getSession().setAttribute("persist-token", persistToken);
		 * 
		 * memberService.authenticateEmail(member, persistToken);
		 * 
		 * request.setAttribute("msg", "회원가입을 위한 이메일이 발송되었습니다.");
		 * request.setAttribute("url", "/member/login-form");
		 * request.getRequestDispatcher("/common/result").forward(request, response);
		 * 
		 * 
		 * String email = request.getParameter("email"); MailSender mailSender = new
		 * MailSender(); mailSender.sendEmail(email, "회원가입을 축하합니다.",
		 * "<h1>어서오세요! 환영합니다!</h1>");
		 * 
		 */

		String schoolName = request.getParameter("schoolName");
		String major = request.getParameter("major");
		String grade = request.getParameter("grade");
		String hopeUniversity = request.getParameter("hopeUniversity");
		String hopeMajor = request.getParameter("hopeMajor");

		Member member = new Member();
		Mentee mentee = new Mentee();

		member = commonMember(request, response, member);

		member.setRole("ME00");
		mentee.setSchoolName(schoolName);
		mentee.setMajor(major);
		mentee.setGrade(Integer.parseInt(grade));
		mentee.setHopeUniversity(hopeUniversity);
		mentee.setHopeMajor(hopeMajor);

		if (memberService.insertMentee(member, mentee) != 0) {
			System.out.println("로그인 완료");
		}

	}

	private void joinMentor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String universityName = request.getParameter("universityName");
		String universityType = request.getParameter("universityType");
		String grade = request.getParameter("grade");
		String major = request.getParameter("major");
		String wantDay = request.getParameter("wantDay");
		String wantTime = request.getParameter("wantTime");
		String requirement = request.getParameter("requirement");
		String[] historyArr = request.getParameterValues("history");

		Member member = new Member();
		Mentor mentor = new Mentor();

		member = commonMember(request, response, member);

		member.setRole("MO00");
		mentor.setUniversityName(universityName);
		mentor.setUniversityType(universityType);
		mentor.setGrade(Integer.parseInt(grade));
		mentor.setMajor(major);
		mentor.setWantDay(wantDay);
		mentor.setWantTime(wantTime);
		mentor.setRequirement(requirement);
		if (historyArr.length != 0) {
			String history = "";

			for (int i = 0; i < historyArr.length; i++) {
				if (i == 0) {
					history = historyArr[i];
				} else {
					history += ("," + historyArr[i]);
				}

			}
			mentor.setHistory(history);
		}

		if (memberService.insertMentor(member, mentor) != 0) {
			System.out.println("로그인 완료");
		}

	}

	private void joinImpl(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * HttpSession session = request.getSession();
		 * memberService.insertMember((Member) session.getAttribute("persistUser"));
		 * 
		 * // 예전처럼 예외처리를 했을 경우 직접 request.setAttribute를 사용해 메시지를 입력해서 넣어줬다. // 지금과의 차이점이
		 * 무엇일까 // 가독성의 차이. 예외상황이라는 것이 더 명확하게 보인다.
		 * 
		 * // 같은 persistUser값이 두 번 DB에 입력되지 않도록 사용자 정보와 인증을 만료시킴
		 * session.removeAttribute("persistUser");
		 * session.removeAttribute("persist-token");
		 * response.sendRedirect("/member/login-form");
		 */

	}

	private void joinFormMentor(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/join-form-mentor").forward(request, response);
	}

	private void joinFormMentee(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/join-form-mentee").forward(request, response);
	}

	private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/*
		 * String userId = request.getParameter("userId"); String password =
		 * request.getParameter("password");
		 * 
		 * Member member = null;
		 * 
		 * // 1. 시스템에서 문제가 생겨서(DB가 뻗었다던데... 외부 API서버가 죽었다던가...) // 예외가 발생하는 경우. => 예외처리를
		 * service 단에서 처리 member = memberService.memberAuthenticate(userId, password);
		 * 
		 * 
		 * request.setAttribute("msg", "회원정보를 조회하는 도중 예외가 발생했습니다.");
		 * request.setAttribute("url", "/index");
		 * request.getRequestDispatcher("/error/result").forward(request, response);
		 * return;
		 * 
		 * 
		 * // 2. 사용자가 잘못된 아이디나 비밀번호를 입력한 경우. // 사용자에게 아이디나 비밀번호가 틀렸음을 알림, login-form 으로
		 * redirect
		 * 
		 * if (member == null) { response.sendRedirect("/member/login-form?err=1");
		 * return; }
		 */

		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		Member member = null;
		Mentor mentor = null;
		Mentee mentee = null;
		member = memberService.memberAuthenticate(userId, password);

		if (member == null) {
			response.sendRedirect("/member/login-form?err=1");
			return;
		}
		if (member.getRole().startsWith("ME")) {
			mentee = memberService.selectMenteeByRole(member);
			request.getSession().setAttribute("authMentee", mentee);
		} else {
			mentor = memberService.selectMentorByRole(member);
			request.getSession().setAttribute("authMentor", mentor);
		}
		request.getSession().setAttribute("authentication", member);

		response.sendRedirect("/");

	}

	private void loginForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/member/login").forward(request, response);
	}

	private Member commonMember(HttpServletRequest request, HttpServletResponse response, Member member)
			throws ServletException, IOException {
		String userName = request.getParameter("userName");
		String userId = request.getParameter("userId");
		String password = request.getParameter("password");
		String email = request.getParameter("email");
		String gender = request.getParameter("gender-radio");
		String address = request.getParameter("address");
		String phone = request.getParameter("countryCode") + request.getParameter("phone");
		String nickname = request.getParameter("nickname");

		member.setUserName(userName);
		member.setUserId(userId);
		member.setPassword(password);
		member.setEmail(email);
		if (gender.equals("male")) {
			member.setGender("m");
		} else {
			member.setGender("f");
		}
		member.setAddress(address);
		member.setPhone(phone);
		member.setNickname(nickname);

		return member;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
