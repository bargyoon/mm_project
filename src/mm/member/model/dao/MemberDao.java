package mm.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import mm.common.db.JDBCTemplate;
import mm.common.exception.DataAccessException;
import mm.member.model.dto.Member;
import mm.member.model.dto.Mentee;
import mm.member.model.dto.Mentor;

public class MemberDao {

	JDBCTemplate template = JDBCTemplate.getInstance();
	
	
	public Member memberAuthenticate(String userId, String password, Connection conn) {
		Member member = null;
		PreparedStatement pstm = null;
		ResultSet rset = null;
		try {
			String query = "select * from member where user_id = ? and password = ? ";
			pstm = conn.prepareStatement(query);

			pstm.setString(1, userId);
			pstm.setString(2, password);
			System.out.println(userId);
			rset = pstm.executeQuery();

			// 5. ResultSet에 저장된 데이터를 DTO에 옮겨담기.
			if (rset.next()) {
				member = convertRowToMember(rset);
			}

		} catch (SQLException e) {
			
			throw new DataAccessException(e);		
		} finally {
			template.close(rset, pstm);

		}
		return member;
	}

	public Member selectMemberById(String userId, Connection conn)  {
		Member member = null;
		
		PreparedStatement pstm = null;
		ResultSet rset = null;

		try {
			
			String query = "select * from member where user_id = ?";
			pstm = conn.prepareStatement(query);
			pstm.setString(1, userId);

			rset = pstm.executeQuery();

			if (rset.next()) {
				member = convertRowToMember(rset);
			}
		} catch (SQLException e) {
			
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}

		return member;
	}

	public List<Member> selectMemberList(Connection conn) {
		List<Member> memberList = new ArrayList<>();
		PreparedStatement pstm = null;
		ResultSet rset = null;

		try {
		
			String query = "select * from member";
			pstm = conn.prepareStatement(query);

			rset = pstm.executeQuery();

			while (rset.next()) {
				memberList.add(convertRowToMember(rset));
			}

		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(rset, pstm);
		}

		return memberList;
	}
	
	public int insertMember(Member member, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		

		try {
			String query = "insert into member(user_idx,user_name,user_id,password,email,gender,address,phone,nickname,role) values(sc_user_idx.nextval,?,?,?,?,?,?,?,?,?)";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, member.getUserName());
			pstm.setString(2, member.getUserId());
			pstm.setString(3, member.getPassword());
			pstm.setString(4, member.getEmail());
			pstm.setString(5, member.getGender());
			pstm.setString(6, member.getAddress());
			pstm.setString(7, member.getPhone());
			
			pstm.setString(8, member.getNickname());
			pstm.setString(9, member.getRole());
			
		

			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}

		return res;
		
	}

	public int insertMentee(Mentee mentee, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		

		try {
			String query = "insert into user_mentee(mentee_idx,user_idx,school_name,major,grade,hope_university,hope_major) values(sc_mentee_idx.nextval,sc_user_idx.currval,?,?,?,?,?)";
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, mentee.getSchoolName());
			pstm.setString(2, mentee.getMajor());
			pstm.setInt(3, mentee.getGrade());
			pstm.setString(4, mentee.getHopeUniversity());
			pstm.setString(5, mentee.getHopeMajor());
			

			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}

		return res;
	}

	public int insertMentor(Mentor mentor, Connection conn) {
		int res = 0;
		PreparedStatement pstm = null;
		

		try {
			String query = "insert into user_mentor(mentor_idx,user_idx,university_name,university_type,grade,major,want_day,want_time,requirement,history) values(sc_mentor_idx.nextval,sc_user_idx.currval,?,?,?,?,?,?,?,?)";
			
			
			pstm = conn.prepareStatement(query);
			pstm.setString(1, mentor.getUniversityName());
			pstm.setString(2, mentor.getUniversityType());
			pstm.setInt(3, mentor.getGrade());
			pstm.setString(4, mentor.getMajor());
			pstm.setString(5, mentor.getWantDay());
			pstm.setString(6, mentor.getWantTime());
			pstm.setString(7, mentor.getRequirement());
			pstm.setString(8, mentor.getHistory());
			

			res = pstm.executeUpdate();
		} catch (SQLException e) {
			throw new DataAccessException(e);
		} finally {
			template.close(pstm);
		}

		return res;
	}
	
	private Member convertRowToMember(ResultSet rset) throws SQLException {
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
