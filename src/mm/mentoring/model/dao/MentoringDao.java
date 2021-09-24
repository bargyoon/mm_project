package mm.mentoring.model.dao;

import java.sql.Array;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.MentorCondition;

public class MentoringDao {

	JDBCTemplate template = JDBCTemplate.getInstance();
	
	public ArrayList<Mentor> getMentorIdx(MentorCondition mentorCondition, Connection conn) {
		ArrayList<Mentor> mentorList = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from user_mentor where university_type = ? and major in (?) and want_day in (?) and want_time = ? and requirement = ?";
		
		try {
			pstm = conn.prepareStatement(query);
			pstm.setString(1, mentorCondition.getUniversityType());
			pstm.setArray(2, (Array) mentorCondition.getMajorType());
			pstm.setArray(3, (Array) mentorCondition.getWantDate());
			pstm.setString(4, mentorCondition.getWantTime());
			pstm.setString(5, mentorCondition.getWantPlace());
			
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				mentorList.add(convertToMentor(rset));
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
