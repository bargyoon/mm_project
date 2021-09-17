package mm.mentoring.controller;

import java.io.IOException;
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
		case "apply-mentoring":
			applyMentoring(request, response);
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
		default:
			break;
		}
		
	}

	private void mentorRating(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-rating").forward(request, response);
		
	}

	private void mentoringManage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-manage").forward(request, response);
		
	}

	private void mentorList(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-list").forward(request, response);
		
	}

	private void applyComolete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/apply-complete").forward(request, response);
	}

	private void applyMentoring(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	private void applyPage(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/mentoring/mentor-apply").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
