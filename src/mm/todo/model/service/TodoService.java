package mm.todo.model.service;

import java.sql.Connection;

import mm.common.db.JDBCTemplate;
import mm.todo.model.dao.TodoDao;
import mm.todo.model.dto.Todo;

public class TodoService {

	private TodoDao todoDao = new TodoDao();
	private JDBCTemplate template = JDBCTemplate.getInstance();
	
	public int insertTodo(Todo todo) {
		Connection conn = template.getConnection();
		int res = 0;
		try {
			
			if(todoDao.insertTodo(todo, conn) != 0) {
				
				res = todoDao.insertTodo(todo, conn);
			}
			
			System.out.println(todo.getTodoIdx());
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
	
	
	
	
}
