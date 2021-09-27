package mm.mentoring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.ApplyHistory;
import mm.mentoring.model.dto.MentorCondition;
import mm.mentoring.model.dto.MentoringHistory;
import mm.mentoring.model.service.MentoringService;

@WebServlet("/mentoring/*")
public class MentoringController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MentoringService mService = new MentoringService();
	
    public MentoringController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");
		
		switch (uriArr[uriArr.length - 1]) {
		case "apply-page":
			applyPage(request, response);
			break;
		case "apply-complete":
			applyComolete(request, response);
			break;
		case "mentor-list":
			mentorList(request, response);
			break;
		case "manage-page":
			managePage(request, response);
			break;
		case "mentor-rating-page":
			ratingPage(request, response);
			break;
		case "regist-rating":
			registRating(request, response);
			break;
		default:
			break;
		}
		
	}

	private void registRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ratings = request.getParameterValues("rating");
		String comment = request.getParameter("rating_comment");
		
		for (String rating : ratings) {
			System.out.println("rating : " + rating);
		}
		
		System.out.println("comment : " + comment);
	}

	private void ratingPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
		
	}

	private void managePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//세션에서 멤버정보 가져옴
		Member member = (Member) request.getSession().getAttribute("authentication");
		//멤버 idx로 MentoringHistory DTO 생성
		List<MentoringHistory> mhList = mService.getMtHistoryByUserIdx(member.getUserIdx());
		List<ApplyHistory> ahList = mService.getApHistoryByUserIdx(member.getUserIdx());
		
		request.setAttribute("apply-history", ahList);
		request.setAttribute("mentoring-history", mhList);
		
		request.getRequestDispatcher("/mentoring/mentor-manage").forward(request, response);
		
	}

	private void mentorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MentorCondition mentorCondition = new MentorCondition();
		List<Member> memberList = new ArrayList<Member>();
		mentorCondition.setUniversityType(request.getParameter("school_type").split(","));
		mentorCondition.setWantTime(request.getParameter("want_time").split(","));
		mentorCondition.setWantPlace(request.getParameter("want_place").split(","));
		mentorCondition.setMajorType(request.getParameter("major_type").split(","));
		mentorCondition.setWantDate(request.getParameter("want_date").split(","));
		
		//mentorCondition에 맞는 멘토리스트 가져옴
		List<Mentor> mentorList = mService.getMentorByCondition(mentorCondition);
		
		//멘토 idx로 멘토의 멤버정보 가져옴
		for (int i = 0; i < mentorList.size(); i++) {
			memberList.add(mService.getMemberByIdx(mentorList.get(i).getUserIdx()));
		}
		
		//가져온 멘토 및 정보 확인용 syso
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println(memberList.get(i).toString());
		}
		for (int i = 0; i < mentorList.size(); i++) {
			System.out.println(mentorList.get(i).toString());
		}
		
		
		request.setAttribute("selectedMentors", mentorList);
		request.setAttribute("selectedMembers", memberList);
		
		request.getRequestDispatcher("/mentoring/mentor-list").forward(request, response);
	}

	private void applyComolete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/apply-complete").forward(request, response);
	}

	private void applyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-apply").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
