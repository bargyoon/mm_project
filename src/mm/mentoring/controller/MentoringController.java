package mm.mentoring.controller;

import java.io.IOException;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/mentoring/*")
public class MentoringController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
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
		String[] params = request.getParameterValues("rating");
		String param = request.getParameter("rating_comment");
		
		for (String para : params) {
			System.out.println(para);
		}
		
		System.out.println(param);
	}

	private void mentorRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
		
	}

	private void mentoringManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-manage").forward(request, response);
		
	}

	private void mentorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String schoolType = request.getParameter("school_type");
		String[] majorType = request.getParameterValues("major_type");
		String wantTime = request.getParameter("want_time");
		String[] wantDate = request.getParameterValues("want_date");
		String wantPlace = request.getParameter("want_place");
		
		System.out.println("majorType : " + Arrays.toString(majorType));
		System.out.println("wantDate : " + Arrays.toString(wantDate));
		System.out.println("schoolType : " + schoolType);
		System.out.println("wantTime : " + wantTime);
		System.out.println("wantPlace : " + wantPlace);
		
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
