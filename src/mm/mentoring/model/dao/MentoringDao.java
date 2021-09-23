package mm.mentoring.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.MentorList;

public class MentoringDao {

	public Mentor[] getMentorIdx(MentorList mentorList, Connection conn) {
		Mentor[] mentorArr = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		
		
		return mentorArr;
	}

	private Mentor convertToMentor(ResultSet rset) throws SQLException {
		Mentor mentor = new Mentor();
		mentor.setMentorIdx(rset.getInt("mentor_idx"));
		mentor.setUserIdx(rset.getInt("user_idx"));
		mentor.setUniversityName(rset.getString("university_name"));
		mentor.setUniversityType(rset.getString("university_type"));
		mentor.setGrade(rset.getInt("grade"));
		mentor.setMajor(rset.getString("major"));
		mentor.setWantDay(rset.getString("want_date"));

		return mentor;
	}
	
}
