package mm.todo.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.todo.model.dao.TodoDao;
import mm.todo.model.dto.Todo;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	//모든 일정 조회
	
	
	
	//일정 등록	
	public int insertTodo(Todo todo) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = todoDao.insertTodo(todo, conn);
			
			if( res != 0 )
				template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		System.out.println(res);
		return res;
		
	}


	//일정수정 
	public int modifyTodo(Todo todo) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			res = todoDao.updateTodo(todo, conn);
			
			if( res != 0 )
				template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
		
		System.out.println(res);
		return res;
						
	}


	//일정 삭제
	public int deleteTodo(Todo todo) {
		Connection conn = template.getConnection();
		int res = 0;
		
		try {
			res = todoDao.deleteTodo(todo,conn);
			template.commit(conn);
		} catch (Exception e) {
			template.rollback(conn);
			e.printStackTrace(); //디버깅용
		}finally {
			template.close(conn);
		}
		
		return res;
		
		
	}


	//todo-main(오늘의 일정)
	public List<Todo> todoMain(int userIdx) {
		List<Todo> todayList = null;
		Connection conn = template.getConnection();

		try {
			todayList = todoDao.todoMain(userIdx, conn);

		} finally {
			template.close(conn);
		}
		return todayList;
	}

	
	public void todaySave(ArrayList<Integer> todoIdxList) {

		todoDao.todaySave(todoIdxList);
	}

	
	
}
