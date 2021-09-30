package mm.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.board.model.dto.BoardMentee;
import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;

public class BoardDao {

	private JDBCTemplate template = JDBCTemplate.getInstance();

	public List<BoardMentee> selectBoardList(Connection conn) {
		List<BoardMentee> boardMenteeList = new ArrayList<BoardMentee>();
		PreparedStatement pstm = null;
		ResultSet rset = null;

		String sql = "select bd_idx,bd_title,reg_date,view_count,rec_count,bd_content,mentee_idx,user_id " + "from mentee_board";

		try {
			pstm = conn.prepareStatement(sql);
			rset = pstm.executeQuery();
			while (rset.next()) {
				boardMenteeList.add(convertRowToBoardList(rset));
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return boardMenteeList;
	}

	public BoardMentee selectBoardDetail(int bdIdx, Connection conn) {
		BoardMentee boardMenteeDetail = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;

		String sql = "select bd_idx,bd_title,reg_date,view_count,rec_count,bd_content,mentee_idx,user_id "
				+ "from mentee_board where bd_idx=?";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, bdIdx);
			rset = pstm.executeQuery();
			while (rset.next()) {
				boardMenteeDetail = convertRowToBoardList(rset);
			}
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		return boardMenteeDetail;
	}

	public void insertBoard(BoardMentee boardMentee, Connection conn) {

		PreparedStatement pstm = null;

		String sql = "insert into mentee_board(bd_idx,bd_title,reg_date,view_count,rec_count,bd_content,mentee_idx,user_id)"
				+ "values(sc_mentee_bd_idx.nextval,?,sysdate,0,0,?,?,?)";

		try {
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, boardMentee.getBdTitle());
			pstm.setString(2, boardMentee.getBdContent());
			pstm.setInt(3, boardMentee.getMenteeIdx());
			pstm.setString(4, boardMentee.getUserId());
			pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}
	}

	private BoardMentee convertRowToBoardList(ResultSet rset) throws SQLException {

		BoardMentee boardMentee = new BoardMentee();
		boardMentee.setBdIdx(rset.getInt("bd_idx"));
		boardMentee.setBdTitle(rset.getString("bd_title"));
		boardMentee.setRegDate(rset.getDate("reg_date"));
		boardMentee.setViewCount(rset.getInt("view_count"));
		boardMentee.setRecCount(rset.getInt("rec_count"));
		boardMentee.setBdContent(rset.getString("bd_content"));
		boardMentee.setMenteeIdx(rset.getInt("mentee_idx"));
		boardMentee.setUserId(rset.getString("user_id"));

		return boardMentee;
	}

}
