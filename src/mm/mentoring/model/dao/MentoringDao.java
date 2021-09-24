package mm.mentoring.model.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.MentorCondition;

public class MentoringDao {

	JDBCTemplate template = JDBCTemplate.getInstance();
	
	public List<Mentor> getMentorIdx(MentorCondition mentorCondition, Connection conn) {
		List<Mentor> mentorList = new ArrayList<Mentor>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from user_mentor where want_time in (?)";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, mentorCondition.getWantTime());
			
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				Mentor mentor = convertToMentor(rset);
				mentorList.add(mentor);
			}
			
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}
		
		return mentorList;
	}

	private Mentor convertToMentor(ResultSet rset) throws SQLException {
		Mentor mentor = new Mentor();
		mentor.setMentorIdx(rset.getInt("mentor_idx"));
		mentor.setUserIdx(rset.getInt("user_idx"));
		mentor.setUniversityName(rset.getString("university_name"));
		mentor.setUniversityType(rset.getString("university_type"));
		mentor.setGrade(rset.getInt("grade"));
		mentor.setMajor(rset.getString("major"));
		mentor.setWantDay(rset.getString("want_day"));
		mentor.setRequirement(rset.getString("requirement"));
		mentor.setHistory(rset.getString("history"));
		mentor.setMentoringCnt(rset.getInt("mentoring_cnt"));

		return mentor;
	}
	
}
