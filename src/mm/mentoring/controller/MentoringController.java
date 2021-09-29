package mm.mentoring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.common.code.ErrorCode;
import mm.common.exception.HandlableException;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.ApplyHistory;
import mm.mentoring.model.dto.MentorCondition;
import mm.mentoring.model.dto.MentoringHistory;
import mm.mentoring.model.dto.Rating;
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
		case "rating-page":
			ratingPage(request, response);
			break;
		case "regist-rating":
			registRating(request, response);
			break;
		case "comment-check":
			commentCheck(request, response);
			break;
		default:
			break;
		}

	}

	private void commentCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = (Member) request.getSession().getAttribute("authentication");
		int userIdx = member.getUserIdx();
		int mIdx = Integer.parseInt(request.getParameter("m_idx"));
		MentoringHistory mh = mService.getMhByMIdx(mIdx);
		int mentorIdx = mh.getMentorIdx();
		
		boolean isRegistered = mService.commentCheck(userIdx, mentorIdx);
		
		if(isRegistered) {
			response.getWriter().print("registered");
		} else {
			response.getWriter().print("not-registered");
		}
		
	}

	private void applyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	//DB apply_history 테이블에 등록
	private void registApply(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	private void reapplyComplete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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

	private void registRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ratings = request.getParameterValues("rating");
		String comment = request.getParameter("rating_comment");
		int mentorIdx = Integer.parseInt(request.getParameter("mentor_idx"));
		Member member = (Member) request.getSession().getAttribute("authentication");
		int userIdx = member.getUserIdx();
		
		boolean isRegistered = mService.commentCheck(userIdx, mentorIdx);
		
		if(isRegistered) {
			throw new HandlableException(ErrorCode.ALREADY_REGISTERED_COMMENT);
		}
		
		Rating rating = createRatingDTO(ratings);
		rating.setMentorIdx(mentorIdx);
		rating.setUserIdx(userIdx);
		rating.setComment(comment);
		
		int res = mService.registRating(rating);
		
		System.out.println(rating);
		
		if (res == 0) {
			request.setAttribute("msg", "평가 등록에 실패했습니다.");
			request.setAttribute("back", "back");
			request.getRequestDispatcher("common/result").forward(request, response);
		} else {
			request.setAttribute("msg", "평가를 등록하였습니다.");
			request.setAttribute("url", "/mentoring/manage-pag");
			request.getRequestDispatcher("common/result").forward(request, response);
		}
		
	}
	
	private Rating createRatingDTO(String[] ratings) {
		Rating rating = new Rating();
		
		for (int i = 0; i < ratings.length; i++) {
			if(ratings[i].equals("kindness")) {
				rating.setKindness("Y");
			} else if(ratings[i].equals("communication")) {
				rating.setCommunication("Y");
			} else if(ratings[i].equals("professional")) {
				rating.setProfessional("Y");
			} else if(ratings[i].equals("process")) {
				rating.setProcess("Y");
			} else if(ratings[i].equals("timeAppointment")) {
				rating.setAppointment("Y");
			} else if(ratings[i].equals("explain")) {
				rating.setExplain("Y");
			}
		}
		
		return rating;
	}

	private void ratingPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mIdx = Integer.parseInt(request.getParameter("m_idx"));
		MentoringHistory mh = mService.getMhByMIdx(mIdx);
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		int userIdx = member.getUserIdx();
		int mentorIdx = mh.getMentorIdx();
		
		boolean isRegistered = mService.commentCheck(userIdx, mentorIdx);
		
		if(isRegistered) {
			throw new HandlableException(ErrorCode.ALREADY_REGISTERED_COMMENT);
		}
		
		
		request.setAttribute("mh", mh);
		
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
	}

	private void managePage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

	private void mentorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MentorCondition mentorCondition = new MentorCondition();
		List<Member> memberList = new ArrayList<Member>();
		Member member = (Member) request.getSession().getAttribute("authentication");
		mentorCondition.setUniversityType(request.getParameter("school_type").split(","));
		mentorCondition.setWantTime(request.getParameter("want_time").split(","));
		mentorCondition.setWantPlace(request.getParameter("want_place").split(","));
		mentorCondition.setMajorType(request.getParameter("major_type").split(","));
		mentorCondition.setWantDate(request.getParameter("want_date").split(","));
		int userIdx = member.getUserIdx();

		// mentorCondition에 맞는 멘토리스트 가져옴
		List<Mentor> mentorList = mService.getMentorByCondition(mentorCondition);
		
		//applyhistory에 있는 멘토들을 제거해 리스트에 저장
		List<Mentor> nonExistMentorList = mService.isExistInApply(mentorList, userIdx);
		
		// 제거한 멘토목록의 idx로 멘토의 멤버정보 가져옴
		for (int i = 0; i < nonExistMentorList.size(); i++) {
			memberList.add(mService.getMemberByIdx(nonExistMentorList.get(i).getUserIdx()));
		}

		// 가져온 멘토 및 정보 확인용 syso
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println("memberlist : " + memberList.get(i).toString());
		}
		for (int i = 0; i < mentorList.size(); i++) {
			System.out.println("mentorlist : " + mentorList.get(i).toString());
		}
		for (int i = 0; i < nonExistMentorList.size(); i++) {
			System.out.println("nonExistMentorList : " + nonExistMentorList.get(i).toString());
		}

		request.setAttribute("selectedMentors", nonExistMentorList);
		request.setAttribute("selectedMembers", memberList);

		request.getRequestDispatcher("/mentoring/mentor-list").forward(request, response);
	}

	private void applyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-apply").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}
}
