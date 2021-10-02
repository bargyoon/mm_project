package mm.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import mm.board.model.dto.BoardMentee;
import mm.board.model.service.BoardService;
import mm.common.file.FileDTO;
import mm.common.file.FileUtil;
import mm.common.file.MultiPartParams;
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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		// System.out.println(uriArr[uriArr.length -1]);

		switch (uriArr[uriArr.length - 1]) {
		case "mentor":
			mentor(request, response);
			break;
		case "mentee":
			mentee(request, response);
			break;
		case "mentee-board-detail":
			menteeBoardDetail(request, response);
			break;
		case "mentee-board-create-form":
			menteeBoardCreateForm(request, response);
			break;
		case "mentee-upload":
			menteeBoardUpload(request, response);
			break;
		case "mentee-board-delete":
			menteeBoardDelete(request, response);
			break;
		case "mentee-board-modify":
			menteeBoardModify(request, response);
			break;
		case "mentee-board-update":
			menteeBoardUpdate(request, response);
			break;
		default:

		}
	}

	private void menteeBoardUpdate(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		FileUtil util = new FileUtil();
		MultiPartParams params = util.fileUpload(request);
		BoardMentee boardMentee = new BoardMentee();
		
		int bdIdx = Integer.parseInt(params.getParameter("bdIdx"));
		
		boardService.deleteFile(bdIdx);
		
		boardMentee.setBdTitle(params.getParameter("bdTitle"));
		boardMentee.setBdContent(params.getParameter("bdContent"));
		
		List<FileDTO> fileDTOs = params.getFilesInfo();
		
		boardService.updateBoard(boardMentee, bdIdx, fileDTOs);
		
		response.sendRedirect("/board/mentee");
	}

	private void menteeBoardModify(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		int bdIdx = Integer.parseInt(request.getParameter("bdIdx"));
		Map<String, Object> datas = boardService.selectBoardDetail(bdIdx);
		
		request.setAttribute("bdIdx", bdIdx);
		request.setAttribute("datas", datas);
		//request.setAttribute("bdTitle", datas.getBdTitle());
		//request.setAttribute("bdContent", boardMenteeDetail.getBdContent());
		
		request.getRequestDispatcher("/board/mentee-board-modify").forward(request, response);
		
	}

	private void menteeBoardDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		Member member = (Member) request.getSession().getAttribute("authentication");
		
		int bdIdx = Integer.parseInt(request.getParameter("bdIdx"));
		String client = member.getUserId();
		String writer = request.getParameter("userId");
		
		//Map<String, Object> datas = boardService.selectBoardDetail(bdIdx);
		
		//request.setAttribute("datas", datas);
		
		
		//System.out.println(writer);
		//System.out.println(client);
		if (writer.equals(client)) {
			//boardService.deleteBoard(bdIdx, datas);
			boardService.deleteBoard(bdIdx);
		} else {
			System.out.println("해당 게시글을 작성한 사용자가 아닙니다.");
		}

		response.sendRedirect("/board/mentee");
	}

	private void menteeBoardUpload(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		FileUtil util = new FileUtil();
		MultiPartParams params = util.fileUpload(request);
		
		Member member = (Member) request.getSession().getAttribute("authentication");
		Mentee mentee = (Mentee) request.getSession().getAttribute("authMentee");

		BoardMentee boardMentee = new BoardMentee();

		boardMentee.setMenteeIdx(mentee.getMenteeIdx());
		boardMentee.setUserId(member.getUserId());
		boardMentee.setBdTitle(params.getParameter("bdTitle"));
		boardMentee.setBdContent(params.getParameter("bdContent"));
		
		List<FileDTO> fileDTOs = params.getFilesInfo();
		boardService.insertBoard(boardMentee, fileDTOs);
		response.sendRedirect("/board/mentee");
	}

	private BoardMentee registBoard(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BoardMentee boardMentee = new BoardMentee();
		boardMentee.setBdTitle(request.getParameter("title"));
		boardMentee.setBdContent(request.getParameter("content"));
		return boardMentee;
	}

	private void menteeBoardCreateForm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.getRequestDispatcher("/board/mentee-board-create-form").forward(request, response);

	}

	private void menteeBoardDetail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int bdIdx = Integer.parseInt(request.getParameter("bdIdx"));

		Map<String, Object> datas = boardService.selectBoardDetail(bdIdx);
		request.setAttribute("datas", datas);
		/*request.setAttribute("bdIdx", boardMenteeDetail.getBdIdx());
		request.setAttribute("userId", boardMenteeDetail.getUserId());
		request.setAttribute("bdTitle", boardMenteeDetail.getBdTitle());
		request.setAttribute("regDate", boardMenteeDetail.getRegDate());
		request.setAttribute("viewCount", boardMenteeDetail.getViewCount());
		request.setAttribute("recCount", boardMenteeDetail.getRecCount());
		request.setAttribute("bdContent", boardMenteeDetail.getBdContent());*/
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
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
