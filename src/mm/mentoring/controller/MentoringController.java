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

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "apply-page":
			applyPage(request, response);
			break;
		case "apply-complete":
			applyComplete(request, response);
			break;
		case "reapply-complete":
			reapplyComplete(request, response);
			break;
		case "regist-apply":
			registApply(request, response);
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

	private void applyComplete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	//DB apply_history 테이블에 등록
	private void registApply(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int userIdx = Integer.parseInt(request.getParameter("user_idx"));
		int mentorIdx = Integer.parseInt(request.getParameter("mentor_idx"));
		String mentorName = request.getParameter("mentor_name");
		MentoringHistory mh = new MentoringHistory();
		
		mh.setUserIdx(userIdx);
		mh.setMentorIdx(mentorIdx);
		mh.setMentorName(mentorName);
		
		int res = mService.registApply(mh);
		
		if(res == 0) { 
			request.setAttribute("msg", "멘토링 재신청에 실패하였습니다.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response); }
		else {
			request.getRequestDispatcher("/mentoring/apply-complete").forward(request,response); 
		}
	}

	private void reapplyComplete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int ahIdx = Integer.parseInt(request.getParameter("a_idx"));

		int res = mService.increaseReapplyCnt(ahIdx);
		if (res == 0) {
			request.setAttribute("msg", "멘토링 재신청에 실패하였습니다.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
		} else {
			request.getRequestDispatcher("/mentoring/apply-complete").forward(request, response);
		}

	}

	private void registRating(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] ratings = request.getParameterValues("rating");
		String comment = request.getParameter("rating_comment");

		for (String rating : ratings) {
			System.out.println("rating : " + rating);
		}

		System.out.println("comment : " + comment);
	}

	private void ratingPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);

	}

	private void managePage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 세션에서 멤버정보 가져옴
		Member member = (Member) request.getSession().getAttribute("authentication");
		// 멤버 idx로 MentoringHistory, ApplyHistory DTO 생성
		System.out.println(member.toString());

		List<MentoringHistory> mhList = mService.getMtHistoryByUserIdx(member.getUserIdx());
		List<ApplyHistory> ahList = mService.getApHistoryByUserIdx(member.getUserIdx());
		List<MentoringHistory> finishMhList = new ArrayList<MentoringHistory>();
		List<MentoringHistory> processMhList = new ArrayList<MentoringHistory>();

		// 가져온 DTO 확인용 syso
		for (int i = 0; i < mhList.size(); i++) {
			System.out.println(mhList.get(i).toString());
		}

		for (int i = 0; i < ahList.size(); i++) {
			System.out.println(ahList.get(i).toString());
		}

		// 가져온 mhList를 진행중과 완료 상태로 나눔
		for (int i = 0; i < mhList.size(); i++) {
			if (mhList.get(i).getState().equals("P")) {
				processMhList.add(mhList.get(i));
			} else {
				finishMhList.add(mhList.get(i));
			}
		}

		request.setAttribute("applyHistory", ahList);
		request.setAttribute("processHistory", processMhList);
		request.setAttribute("finishHistory", finishMhList);

		request.getRequestDispatcher("/mentoring/mentor-manage").forward(request, response);

	}

	private void mentorList(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		MentorCondition mentorCondition = new MentorCondition();
		List<Member> memberList = new ArrayList<Member>();
		mentorCondition.setUniversityType(request.getParameter("school_type").split(","));
		mentorCondition.setWantTime(request.getParameter("want_time").split(","));
		mentorCondition.setWantPlace(request.getParameter("want_place").split(","));
		mentorCondition.setMajorType(request.getParameter("major_type").split(","));
		mentorCondition.setWantDate(request.getParameter("want_date").split(","));

		// mentorCondition에 맞는 멘토리스트 가져옴
		List<Mentor> mentorList = mService.getMentorByCondition(mentorCondition);

		// 멘토 idx로 멘토의 멤버정보 가져옴
		for (int i = 0; i < mentorList.size(); i++) {
			memberList.add(mService.getMemberByIdx(mentorList.get(i).getUserIdx()));
		}

		// 가져온 멘토 및 정보 확인용 syso
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

	private void applyPage(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-apply").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
