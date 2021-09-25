package mm.mentoring.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.MentorCondition;
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
		case "manage":
			mentoringManage(request, response);
			break;
		case "mentor-rating":
			mentorRating(request, response);
			break;
		case "regist-rating":
			registRating(request, response);
			break;
		case "test":
			test(request, response);
			break;
		case "test-submit":
			testSubmit(request, response);
			break;
		default:
			break;
		}
		
	}

	private void testSubmit(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] params = request.getParameterValues("rating");
		String param = request.getParameter("rating_comment");
		
		for (String para : params) {
			System.out.println(para);
		}
		
		System.out.println(param);
	}

	private void test(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/test").forward(request, response);
	}

	private void registRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] ratings = request.getParameterValues("rating");
		String comment = request.getParameter("rating_comment");
		
		for (String rating : ratings) {
			System.out.println("rating : " + rating);
		}
		
		System.out.println("comment : " + comment);
	}

	private void mentorRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
		
	}

	private void mentoringManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
		
		List<Mentor> mentorList = mService.getMentorByCondition(mentorCondition);
		
		for (int i = 0; i < mentorList.size(); i++) {
			memberList.add(mService.getMemberByIdx(mentorList.get(i).getUserIdx()));
		}
		
		for (int i = 0; i < memberList.size(); i++) {
			System.out.println(memberList.get(i).toString());
		}
		for (int i = 0; i < mentorList.size(); i++) {
			System.out.println(mentorList.get(i).toString());
		}
		
		request.setAttribute("selected-mentors", mentorList);
		request.setAttribute("selected-members", memberList);
		
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

	
	private String ParameterValuesToString (String[] params) {
		String values = "";
		
		if(params[0].equals("all")) {
			values = "all";
		} else {
			for (int i = 0; i < params.length; i++) {
				if(i == params.length-1) {
					values += params[i];
				} else {
					values += params[i] + ", ";
				}
			}
		}
		
		return values;
	}
}
