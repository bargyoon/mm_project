package mm.todo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.todo.model.dto.Todo;

public class TodoDao {

	JDBCTemplate template = JDBCTemplate.getInstance();

	
	//일정 추가
	public int insertTodo(Todo todo, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		

		try {
			String query = "INSERT INTO TODO(TODO_IDX, USER_IDX, START_DATE, END_DATE, TITLE, DONE, COLOR) "
							+ "VALUES(?,?,?,?,?,?,?)";
			
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, todo.getTodoIdx());
			pstm.setInt(1, todo.getUserIdx());
			pstm.setDate(3, todo.getStartDate());
			pstm.setDate(4, todo.getEndDate());
			pstm.setString(5, todo.getTitle());
			pstm.setBoolean(6, todo.isDone());
			pstm.setString(7, todo.getColor());

			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}

		return res;
		
	}
	
	//일정 수정
	public int updateTodo(Todo todo, Connection conn) {		
		int res = 0;		
		PreparedStatement pstm = null;
		String query = "UPDATE TODO SET TITLE=?, START_DATE=?, END_DATE=?, COLOR=? WHERE TODO_IDX=?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, todo.getTitle());
			pstm.setDate(2, todo.getStartDate());
			pstm.setDate(3, todo.getEndDate());
			pstm.setString(4, todo.getColor());	
			pstm.setInt(5, todo.getTodoIdx());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		}finally {
			template.close(pstm);
		}
		
		return res;
	}
	

	
	
	//일정 체크, 미체크 
	public int doneTodo(Todo todo, Connection conn) {		
		int res = 0;		
		PreparedStatement pstm = null;
		String query = "UPDATE TODO SET DONE = ? WHERE TODO_IDX = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setBoolean(1, todo.isDone());
			pstm.setInt(2, todo.getTodoIdx());
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		}finally {
			template.close(pstm);
		}
		
		return res;
	}
	
	
	
	
	//일정 삭제
	public int deleteTodo(int todoIdx, Connection conn) {
		int res = 0;		
		PreparedStatement pstm = null;
		String query = "DELETE FROM TODO WHERE TODO_IDX = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, todoIdx);
			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		}finally {
			template.close(pstm);
		}
		
		return res;
	}
	
	
	
	
}
