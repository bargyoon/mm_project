package mm.board.model.service;

import java.sql.Connection;
import java.util.List;

import mm.board.model.dao.BoardDao;
import mm.board.model.dto.BoardMentee;
import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;

public class BoardService {

	private JDBCTemplate template = JDBCTemplate.getInstance();
	private BoardDao boardDao = new BoardDao();

	public List<BoardMentee> selectBoardList() {

		List<BoardMentee> boardMentee = null;
		Connection conn = template.getConnection();
		boardMentee = boardDao.selectBoardList(conn);
		return boardMentee;
	}
	
	public BoardMentee selectBoardDetail(int bdIdx) {
		BoardMentee boardMentee = null;
		Connection conn = template.getConnection();
		boardMentee = boardDao.selectBoardDetail(bdIdx,conn);
		return boardMentee;
	}

	public void insertBoard(BoardMentee boardMentee) {
		Connection conn = template.getConnection();

		try {
			boardDao.insertBoard(boardMentee, conn);
			template.commit(conn);
		} catch (DataAccessException e) {
			template.rollback(conn);
			throw e;
		} finally {
			template.close(conn);
		}
	}

	

}
