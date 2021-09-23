package mm.mentoring.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import mm.mentoring.model.dto.MentorList;

public class MentoringDao {

	public int[] getMentorIdx(MentorList mentorList, Connection conn) {
		int[] mentorIdx = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		
		return mentorIdx;
	}

}
