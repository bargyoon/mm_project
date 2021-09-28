package mm.todo.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mm.member.model.dto.Member;
import mm.todo.model.dto.Todo;
import mm.todo.model.service.TodoService;

/**
 * Servlet implementation class TodoController
 */
@WebServlet("/todo/*")
public class TodoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private TodoService todoService = new TodoService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TodoController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "main":
			todoMain(request, response);
			break;
		case "detail":
			todoDetail(request, response);
			break;
		case "insert":
			todoInsert(request, response);
			break;
		case "modify":
			todoModify(request, response);
			break;
		default:
		}
	}
	
	
	private void todoMain(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		int userIdx = member.getUserIdx();
		
		List<Todo> todayList = todoService.todoMain(userIdx);
		System.out.println("userIdx : " + userIdx);
		
		for (Todo todo : todayList) {
			System.out.println(todo.toString());
		}
		
		request.setAttribute("todayList", todayList);
		System.out.println(todayList.toString());
		
		request.getRequestDispatcher("/todo/todo-main").forward(request, response);
	
	}
	
	//캘린더에 일정 보여주기 
	private void todoDetail(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 해당 아이디의 모든 일정 조회
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		int userIdx = member.getUserIdx();

		
		
		// request 속성에 추가
		
		request.getRequestDispatcher("/todo/todo-detail").forward(request, response);
		
		
		
	}
	
	private void todoInsert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/todo/todo-insert").forward(request, response);	
	}

	private void todoModify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/todo/todo-modify").forward(request, response);				
	}

	private void todoDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/todo/todo-modify").forward(request, response);				
	}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		
		String[] uriArr = request.getRequestURI().split("/");

		switch (uriArr[uriArr.length - 1]) {
		case "insert":
			insert(request, response);
			break;
		case "modify":
			modify(request, response);
			break;
		case "delete":
			delete(request, response);
			break;
		case "todaySave":
			todaySave(request, response);
			break;
		default:
		}
	}
	



	private void insert(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		System.out.println("userId : " + member.getUserId());
		System.out.println("userIdx : " + member.getUserIdx());
		
		int userIdx = member.getUserIdx();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String title = request.getParameter("title");
		String done = request.getParameter("done");
		String color = request.getParameter("color");
		
		System.out.println("############# @TodoController - todoInsert()");
		System.out.println("title : " + title);
		
		Todo todo = new Todo();
		todo.setUserIdx(userIdx);
		todo.setStartDate(Date.valueOf(startDate));
		todo.setEndDate(Date.valueOf(endDate));
		todo.setTitle(title);
		todo.setDone(Boolean.parseBoolean(done));
		todo.setColor(color);
		
		todoService.insertTodo(todo);
		
	}
	
	
	private void modify(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		Todo todo = (Todo) session.getAttribute("todoIdx");
		
		System.out.println("userId : " + member.getUserId());
		System.out.println("userIdx : " + member.getUserIdx());
		
		int userIdx = member.getUserIdx();
		int todoIdx = todo.getTodoIdx();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String title = request.getParameter("title");
		String color = request.getParameter("color");
		
		System.out.println("############# @TodoController - todoModify()");
		System.out.println("title : " + title);
		System.out.println("todoIdx : " + todoIdx);
		System.out.println("todoIdx : " + todoIdx);
		
		todo = new Todo();
		
		todo.setUserIdx(userIdx);
		todo.setTodoIdx(todoIdx);
		todo.setStartDate(Date.valueOf(startDate));
		todo.setEndDate(Date.valueOf(endDate));
		todo.setTitle(title);
		todo.setColor(color);
		
		todoService.modifyTodo(todo);		
	}
	
	
	private void delete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		Todo todo = (Todo) session.getAttribute("todoIdx");

		int userIdx = member.getUserIdx();
		int todoIdx = todo.getTodoIdx();
//		int todoIdx = Integer.parseInt(request.getParameter("todoIdx")); 

		System.out.println("############# @TodoController - todoDelete()");
		System.out.println("todoIdx : " + todoIdx);
		
		todo = new Todo();
		todo.setUserIdx(userIdx);
		todo.setTodoIdx(todoIdx);

		
		todoService.deleteTodo(todo);				
	}

	
	//오늘의 일정
	private void todaySave(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		Member member = (Member) session.getAttribute("authentication");
		
		String[] todoList = request.getParameterValues("todoList");
		
		ArrayList<Integer> todoIdxList = new ArrayList<Integer>();
		
		for (String todoIdx : todoList) {
			System.out.println("완료 시킬 todoIdx : " + todoIdx);
			todoIdxList.add( Integer.parseInt(todoIdx));
		}
		
		todoService.todaySave(todoIdxList);
		
	}

}
