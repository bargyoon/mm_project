package mm.todo.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.member.model.dto.Member;
import mm.todo.model.dto.Todo;

public class TodoDao {

	JDBCTemplate template = JDBCTemplate.getInstance();

	
	//일정 추가
	public int insertTodo(Todo todo, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		
		System.out.println("################ @TodoDao - insertTodo");
		System.out.println(todo.toString());
		

		try {
			String query = "INSERT INTO TODO(TODO_IDX, USER_IDX, START_DATE, END_DATE, TITLE, DONE, COLOR) "
							+ "VALUES(SEQ_TODO.nextval,?,?,?,?,?,?)";
			
			pstm = conn.prepareStatement(query);
			/*
			pstm.setInt(1, todo.getTodoIdx());
			pstm.setInt(2, todo.getUserIdx());
			pstm.setDate(3, todo.getStartDate());
			pstm.setDate(4, todo.getEndDate());
			pstm.setString(5, todo.getTitle());
			pstm.setBoolean(6, todo.isDone());
			pstm.setString(7, todo.getColor());
			*/
			int index = 1;
			pstm.setInt(index++, todo.getUserIdx());
			pstm.setDate(index++, todo.getStartDate());
			pstm.setDate(index++, todo.getEndDate());
			pstm.setString(index++, todo.getTitle());
			pstm.setBoolean(index++, todo.isDone());
			pstm.setString(index++, todo.getColor());

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
	public boolean doneTodo(Todo todo, Connection conn) {		
		boolean res = false;		
		PreparedStatement pstm = null;
		String query = "UPDATE TODO SET DONE = ? WHERE TODO_IDX = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setBoolean(1, todo.isDone());
			pstm.setInt(2, todo.getTodoIdx());
			res = pstm.execute();
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

	//오늘의 일정 출력
	public List<Todo> todoMain(int userIdx, Connection conn) {
		Todo todo = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		ArrayList<Todo> todayList = new ArrayList<Todo>();
		try {
			String query = " SELECT * "
						 + " FROM TODO "
						 + " WHERE USER_IDX = ? "
						 + " AND TRUNC(sysdate) >= START_DATE " 
						 + " AND TRUNC(sysdate) <= END_DATE ";	
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, userIdx);
			rset = pstm.executeQuery();

			while (rset.next()) {
				todo = convertRowToTodo(rset);
				todayList.add(todo);
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);		
		} finally {
			template.close(rset, pstm);

		}
		return todayList;
	}
	
	
	private Todo convertRowToTodo(ResultSet rset) throws SQLException {
		Todo todo = new Todo();
		todo.setTodoIdx(rset.getInt("todo_idx"));
		todo.setUserIdx(rset.getInt("user_idx"));
		todo.setStartDate(rset.getDate("start_date"));
		todo.setEndDate(rset.getDate("end_date"));
		todo.setTitle(rset.getString("title"));
		todo.setDone(rset.getBoolean("done"));
		todo.setColor(rset.getString("color"));
		
		return todo;
	}

	
}
