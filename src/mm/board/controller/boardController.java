package mm.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mm.board.model.dto.BoardMentee;
import mm.board.model.service.BoardService;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentee;

/**
 * Servlet implementation class boardController
 */
@WebServlet("/board/*")
public class boardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   private BoardService boardService = new BoardService();
	
    public boardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "mentor":
			mentor(request, response);
			break;
		case "mentee":
			mentee(request, response);
			break;
		case "mentee-board-detail":
			menteeBoardDetail(request,response);
			break;
		case "mentee-board-create-form":
			menteeBoardCreateForm(request, response);
			break;
		case "mentee-upload":
			menteeUpload(request, response);
		default:

		}
	}

	private void menteeUpload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		Mentee mentee = (Mentee) request.getSession().getAttribute("authMentee");
		
		BoardMentee boardMentee = new BoardMentee();
		
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		System.out.println(title);
		System.out.println(content);
		
		boardMentee.setMenteeIdx(mentee.getMenteeIdx());
		boardMentee.setUserId(member.getUserId());
		boardMentee.setBdTitle(title);
		boardMentee.setBdContent(content);
		boardService.insertBoard(boardMentee);
		response.sendRedirect("/board/mentee");
	}

	private BoardMentee registBoard(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardMentee boardMentee = new BoardMentee();
		boardMentee.setBdTitle(request.getParameter("title"));
		boardMentee.setBdContent(request.getParameter("content"));
		return boardMentee;
	}

	private void menteeBoardCreateForm(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/board/mentee-board-create-form").forward(request, response);
		
	}
	
	private void menteeBoardDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bdIdx = Integer.parseInt(request.getParameter("bdIdx"));
		
		BoardMentee boardMenteeDetail = boardService.selectBoardDetail(bdIdx);
		request.setAttribute("userId", boardMenteeDetail.getUserId());
		request.setAttribute("title", boardMenteeDetail.getBdTitle());
		request.setAttribute("regDate", boardMenteeDetail.getRegDate());
		request.setAttribute("viewCount", boardMenteeDetail.getViewCount());
		request.setAttribute("recCount", boardMenteeDetail.getRecCount());
		request.setAttribute("content", boardMenteeDetail.getBdContent());
		request.getRequestDispatcher("/board/mentee-board-detail").forward(request, response);
	}

	private void mentee(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<BoardMentee> boardMenteeList = boardService.selectBoardList();
		request.setAttribute("boardMenteeList", boardMenteeList);
		request.getRequestDispatcher("/board/mentee").forward(request, response);
		
	}

	private void mentor(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/board/mentor").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
