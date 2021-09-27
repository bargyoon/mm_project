package mm.todo.model.service;

import java.sql.Connection;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.todo.model.dao.TodoDao;
import mm.todo.model.dto.Todo;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public int insertTodo(Todo todo) {
		//커넥션 연결
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

	
	
}
