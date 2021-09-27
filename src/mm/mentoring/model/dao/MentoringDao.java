package mm.mentoring.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentor;
import mm.mentoring.model.dto.ApplyHistory;
import mm.mentoring.model.dto.MentorCondition;
import mm.mentoring.model.dto.MentoringHistory;

public class MentoringDao {

	JDBCTemplate template = JDBCTemplate.getInstance();
	
	public List<Mentor> getMentorByCondition(MentorCondition mentorCondition, Connection conn) {
		List<Mentor> mentorList = new ArrayList<Mentor>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = createQuery(mentorCondition);
		
		try {
			pstm = conn.prepareStatement(query);
			
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

	public Member getMemberByIdx(int userIdx, Connection conn) {
		Member member = new Member();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from member where user_idx = ? and is_leave = 0";
		
		try {
			
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, userIdx);
			rset = pstm.executeQuery();
			
			if(rset.next()) {
				member = convertToMember(rset);
			}
			
			
		} catch (Exception e) {
			new DataAccessException(e);
		} finally {
			template.close(pstm, conn);
		}
		
		return member;
	}
	
	public List<MentoringHistory> getMtHistoryByUserIdx(int userIdx, Connection conn) {
		List<MentoringHistory> mhList = new ArrayList<MentoringHistory>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from mentoring_history where user_idx = ?";
		
		try {
			
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, userIdx);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				MentoringHistory mh = convertToManageDTO(rset);
				mhList.add(mh);
			}
			
		} catch (Exception e) {
			new DataAccessException(e);
		} finally {
			template.close(pstm, conn);
		}
		
		
		return mhList;
	}
	
	public List<ApplyHistory> getApHistoryByUserIdx(int userIdx, Connection conn) {
		List<ApplyHistory> ahList = new ArrayList<ApplyHistory>();
		PreparedStatement pstm = null;
		ResultSet rset = null;
		String query = "select * from apply_history where user_idx = ?";
		
		try {
			
			pstm = conn.prepareStatement(query);
			pstm.setInt(1, userIdx);
			rset = pstm.executeQuery();
			
			while(rset.next()) {
				ApplyHistory ah = convertToApplyDTO(rset);
				ahList.add(ah);
			}
			
		} catch (Exception e) {
			new DataAccessException(e);
		} finally {
			template.close(pstm, conn);
		}
		
		return ahList;
	}
	
	
	
	private ApplyHistory convertToApplyDTO(ResultSet rset) throws SQLException {
		ApplyHistory ah = new ApplyHistory();
		ah.setaIdx(rset.getInt("a_idx"));
		ah.setUserIdx(rset.getInt("user_idx"));
		ah.setMentorIdx(rset.getInt("mentor_idx"));
		ah.setMentorName(rset.getString("mentor_name"));
		ah.setEpDate(rset.getDate("ep_date"));
		
		return ah;
	}
	
	private MentoringHistory convertToManageDTO(ResultSet rset) throws SQLException {
		MentoringHistory mh = new MentoringHistory();
		mh.setmIdx(rset.getInt("m_idx"));
		mh.setUserIdx(rset.getInt("user_idx"));
		mh.setMentorIdx(rset.getInt("mentor_idx"));
		mh.setMentorName(rset.getString("mentor_name"));
		mh.setStartDate(rset.getDate("start_date"));
		mh.setEndDate(rset.getDate("end_date"));
		mh.setPrice(rset.getInt("price"));
		mh.setState(rset.getString("state"));

		return mh;
	}
	
	private String createQueryPart (String[] types) {
		String type = "";
		
		for (int i = 0; i < types.length; i++) {
			if(i == types.length-1) {
				type += "'" + types[i] + "')";
			} else {
				type += "'" + types[i] + "',";
			}
		}
		
		return type;
	}
	
	
	private String createQuery (MentorCondition mentorCondition) {
		String query = "select * from user_mentor where";
		String universityType = " university_type in (";
		String wantTime = " want_time in (";
		String wantPlace = " requirement in (";
		String major = " major in (";
		String date = " want_day in (";
		
		universityType += createQueryPart(mentorCondition.getUniversityType());
		wantTime += createQueryPart(mentorCondition.getWantTime());
		wantPlace += createQueryPart(mentorCondition.getWantPlace());
		major += createQueryPart(mentorCondition.getMajorType());
		date += createQueryPart(mentorCondition.getWantDate());
		
		return query+universityType+" and"+wantTime+" and"+wantPlace+" and"+major+" and"+date;
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
	
	private Member convertToMember(ResultSet rset) throws SQLException {
		Member member = new Member();
		member.setUserIdx(rset.getInt("user_idx"));
		member.setUserName(rset.getString("user_name"));
		member.setUserId(rset.getString("user_id"));
		member.setPassword(rset.getString("password"));
		member.setEmail(rset.getString("email"));
		member.setGender(rset.getString("gender"));
		member.setAddress(rset.getString("address"));
		member.setPhone(rset.getString("phone"));
		member.setNickname(rset.getString("nickname"));
		member.setRole(rset.getString("role"));
		member.setJoinDate(rset.getDate("join_date"));
		member.setIsLeave(rset.getInt("is_leave"));

		return member;
	}


}
